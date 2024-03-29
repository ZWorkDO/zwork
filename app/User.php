<?php

/**
 * Class User.
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */

namespace App;

use App\Notifications\ResetPasswordNotification;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Permission\Models\Role;
use DB;
use App\Payout;
use Illuminate\Support\Facades\Schema;
use App\Location;
use App\Profile;
use Auth;
use App\Package;
use App\Helper;
use App\Job;
use Carbon\Carbon;
use canResetPassword;
use App\Notifications;
use Event;
use Illuminate\Database\Eloquent\Relations\MorphToMany;
use Elasticquent\ElasticquentTrait;


/**
 * Class User
 *
 */
class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;
    use HasRoles;
    protected $guard_name = 'web';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name', 'last_name', 'slug', 'email', 'password',
        'avatar', 'banner', 'tagline', 'description',
        'location_id', 'verification_code', 'address',
        'longitude', 'latitude'
    ];

    /* ElasticSearch Model */
    use ElasticquentTrait;

    protected $mappingProperties = array(
        'location_id' => array(
            'type' => 'integer',
            "analyzer" => "standard",
        ),
        'first_name' => array(
            'type' => 'string',
            "analyzer" => "standard",
        ),
        'last_name' => array(
            'type' => 'string',
            "analyzer" => "standard",
        ),
        'slug' => array(
            'type' => 'string',
            "analyzer" => "standard",
        ),
        'tagline' => array(
            'type' => 'string',
            "analyzer" => "standard",
        ),
        'description' => array(
            'type' => 'text',
            "analyzer" => "standard",
        ),
    );

    function getIndexName() {
        return 'user_index';
    }

    /**
     * For creating event.
     *
     * @return event
     */
    public static function boot()
    {
        parent::boot();
        static::created(
            function ($user) {
                Event::fire('user.created', $user);
            }
        );
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * Mark the given user's email as verified.
     *
     * @return bool
     */
    public function markEmailAsVerified()
    {
        return $this->forceFill([
            'email_verified_at' => $this->freshTimestamp(),
            'user_verified' => 1,
            'verification_code' => null
        ])->save();
    }

    /**
     * User Can have multiple articles
     *
     * @return void
     */
    public function articles()
    {
        return $this->hasMany('App\Article');
    }
    
    /**
     * The skills that belong to the user.
     *
     * @return relation
     */
    public function skills()
    {
        return $this->belongsToMany('App\Skill')->withPivot('skill_rating');
    }

    /**
     * Get all of the categories for the user.
     *
     * @return relation
     */
    public function categories()
    {
        return $this->morphToMany('App\Category', 'catable');
    }

    /**
     * Get all of the languages for the user.
     *
     * @return relation
     */
    public function languages()
    {
        return $this->morphToMany('App\Language', 'langable');
    }

    /**
     * Get the location that owns the user.
     *
     * @return relation
     */
    public function location()
    {
        return $this->belongsTo('App\Location');
    }

    /**
     * Get the profile record associated with the user.
     *
     * @return relation
     */
    public function profile()
    {
        return $this->hasOne('App\Profile');
    }

    /**
     * Get the billing address record associated with the user.
     *
     * @return relation
     */
    public function billingAddress()
    {
        return $this->hasOne('App\BillingAddress');
    }

    /**
     * Get the payout record associated with the user.
     *
     * @return relation
     */
    public function payout()
    {
        return $this->hasOne('App\Payout');
    }

    /**
     * Get the jobs for the employer.
     *
     * @return relation
     */
    public function jobs()
    {
        return $this->hasMany('App\Job');
    }

    /**
     * Get the services for the freelancer.
     *
     * @return relation
     */
    public function services()
    {
        return $this->belongsToMany('App\Service')->withPivot('type', 'status', 'seller_id', 'paid');
    }

    /**
     * Get the employer purchased services
     *
     * @return relation
     */
    public function purchasedServices()
    {
        return $this->belongsToMany('App\Service')->withPivot('id', 'type', 'status', 'seller_id', 'paid')->wherePivot('status', 'hired');
    }

    /**
     * Get the employer completed services
     *
     * @return relation
     */
    public function completedServices()
    {
        return $this->belongsToMany('App\Service')->withPivot('id', 'type', 'status', 'seller_id', 'paid')->wherePivot('status', 'completed');
    }

    /**
     * Get the employer cancelled services
     *
     * @return relation
     */
    public function cancelledServices()
    {
        return $this->belongsToMany('App\Service')->withPivot('id', 'type', 'status', 'seller_id', 'paid')->wherePivot('status', 'cancelled');
    }

    /**
     * Get the proposals for the freelancer.
     *
     * @return relation
     */
    public function proposals()
    {
        return $this->hasMany('App\Proposal', 'freelancer_id');
    }

    /**
     * Get the reviews for the user.
     *
     * @return relation
     */
    public function reviews()
    {
        return $this->hasMany('App\Review', 'user_id');
    }

    /**
     * Get the user that owns the offer.
     *
     * @return offers
     */
    public function offers()
    {
        return $this->hasOne('App\Offer');
    }

    /**
     * Get all of reported employers.
     *
     * @return relation
     */
    public function reports()
    {
        return $this->morphMany('App\Report', 'reportable');
    }

    /**
     * Get the message for the user.
     *
     * @return relation
     */
    public function messages()
    {
        return $this->hasMany('App\Message');
    }

    /**
     * Get the item record associated with the user.
     *
     * @return relation
     */
    public function item()
    {
        return $this->hasMany('App\item', 'subscriber');
    }

    /**
     * Set slug before saving in DB
     *
     * @param string $value value
     *
     * @access public
     *
     * @return string
     */
    public function setSlugAttribute($value)
    {
        if (!empty($value)) {
            $temp = str_slug($value, '-');
            if (!User::all()->where('slug', $temp)->isEmpty()) {
                $i = 1;
                $new_slug = $temp . '-' . $i;
                while (!User::all()->where('slug', $new_slug)->isEmpty()) {
                    $i++;
                    $new_slug = $temp . '-' . $i;
                }
                $temp = $new_slug;
            }
            $this->attributes['slug'] = $temp;
        }
    }
    
     /**
     * Update user profile information
     *
     * @param \Illuminate\Http\Request $request           code
     *
     * @access public
     *
     * @return \Illuminate\Http\Response
     */
    public function updateProfile($request) {
      if (!empty($request)) {
        $role_names = array_pluck($this->roles, 'name');
        
        $user_profile = Profile::where('user_id', $this->id)
            ->get()->first();        
        
        if ($request['person_type'] == 1) {
          $user_profile->nationality = filter_var($request['nationality'], FILTER_SANITIZE_STRING);
          $user_profile->birthdate = filter_var($request['birthdate'], FILTER_SANITIZE_STRING);                
          $user_profile->id_type = filter_var($request['id_type'], FILTER_SANITIZE_STRING);
          $user_profile->id_number = filter_var($request['id_number'], FILTER_SANITIZE_STRING);
          $user_profile->profession_id = intval($request['profession_id']);
          $user_profile->grade_id = intval($request['grade_id']);
        } 
        //$profile->address = filter_var($request['address'], FILTER_SANITIZE_STRING);
        //$profile->phone = filter_var($request['phone'], FILTER_SANITIZE_STRING);                
        //$profile->gender = filter_var($request['gender'], FILTER_SANITIZE_STRING);
        //$profile->marital_status = filter_var($request['marital_status'], FILTER_SANITIZE_STRING);
        //$profile->main_activity = filter_var($request['main_activity'], FILTER_SANITIZE_STRING);

        if ($request['person_type'] == 2) {
          $user_profile->company_name = filter_var($request['company_name'], FILTER_SANITIZE_STRING);
          $user_profile->rnc = filter_var($request['rnc'], FILTER_SANITIZE_STRING);
          
          $user_profile->contact_name = filter_var($request['contact_name'], FILTER_SANITIZE_STRING);
          $user_profile->position = filter_var($request['position'], FILTER_SANITIZE_STRING);
          $user_profile->camara_id = intval($request['camara_id']);
          $user_profile->nr = filter_var($request['nr'], FILTER_SANITIZE_STRING);

          //$profile->address = filter_var($request['address'], FILTER_SANITIZE_STRING);
          //$profile->phone = filter_var($request['phone'], FILTER_SANITIZE_STRING);
          //$profile->rte_id = intval($request['rte']);                
          //$profile->main_activity = filter_var($request['main_activity'], FILTER_SANITIZE_STRING);
        } 
      
        $user_profile->save();
      }
    }

    /**
     * Store user
     *
     * @param \Illuminate\Http\Request $request           code
     * @param code                     $verification_code verification code
     *
     * @access public
     *
     * @return \Illuminate\Http\Response
     */
    public function storeUser($request, $verification_code)
    {
        if (!empty($request)) {
            $this->first_name = filter_var($request['first_name'], FILTER_SANITIZE_STRING);
            $this->last_name = filter_var($request['last_name'], FILTER_SANITIZE_STRING);
            $this->slug = filter_var($request['first_name'], FILTER_SANITIZE_STRING) . '-' .
                filter_var($request['last_name'], FILTER_SANITIZE_STRING);
            $this->email = filter_var($request['email'], FILTER_VALIDATE_EMAIL);
            $this->password = Hash::make($request['password']);
            $this->verification_code = $verification_code;
            $this->user_verified = 0;
            $this->assignRole(array('freelancer', 'employer'));

            if (!empty($request['locations'])) {
                $location = Location::find($request['locations']);
                $this->location()->associate($location);
            }            
            $this->badge_id = null;
            $this->expiry_date = null;
            $this->save();

            // reindex user
            $this->addToIndex();

            $user_id = $this->id;

            $updateBuilder = DB::table('model_has_roles')
            ->where('model_id',  $user_id);

            if(count($request["roles"]) > 1){
              $role = Role::where('name', '=', "employer")->first();
              $updateBuilder->where('role_id',  $role->id);
            }else {
              $role = Role::where('name', '=', $request["roles"][0])->first();
              $updateBuilder->where('role_id',  $role->id);
            }
            
            $updateBuilder->update(['is_active' => "true"]);

            $profile = new Profile();
            $profile->user()->associate($user_id);
            
            if (!empty($request['category'])) {
                $profile->no_of_employees = filter_var($request['category'], FILTER_SANITIZE_STRING);
            }
            if (!empty($request['department'])) {
                $profile->department_id = intval($request['department']);
                // $department = Department::find($request['department_name']);
                // $profile->department()->associate($department);
            }

            $profile->save();

            $this->categories()->sync($request['categories']);

            $role_id = Helper::getRoleByUserID($user_id);
            $package = Package::select('id', 'title', 'cost')->where('role_id', $role_id)->where('trial', 1)->get()->first();
            $trial_invoice = Invoice::select('id')->where('type', 'trial')->get()->first();
            if (!empty($package) && !empty($trial_invoice)) {
                DB::table('items')->insert(
                    [
                        'invoice_id' => $trial_invoice->id, 'product_id' => $package->id, 'subscriber' => $user_id,
                        'item_name' => $package->title, 'item_price' => $package->cost, 'item_qty' => 1,
                        "created_at" => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()
                    ]
                );
            }
            return $user_id;
        }
    }

    /**
     * Get user role type by user ID
     *
     * @param integer $user_id code
     *
     * @access public
     *
     * @return \Illuminate\Http\Response
     */
    public static function getUserRoleType($user_id)
    {
        if (!empty($user_id) && is_numeric($user_id)) {
            $role_id = DB::table('model_has_roles')->select('role_id')
                ->where('is_active', "true")
                ->where('model_id', $user_id)
                ->get()->pluck('role_id')->toArray();
            if (!empty($role_id)) {
                return DB::table('roles')->select('id', 'role_type', 'name')->where('id', $role_id[0])->get()->first();
            } else {
                return '';
            }
        }
    }

    
    /**
     * A model may have multiple roles.
     */
    public function roles(): MorphToMany
    {
        return $this->morphToMany(
            config('permission.models.role'),
            'model',
            config('permission.table_names.model_has_roles'),
            config('permission.column_names.model_morph_key'),
            'role_id'
        )->withPivot('is_active');
    }

    public function getRoleNames()
    {   
        $filtered = $this->roles->filter(function ($value, $key) {
          return $value->pivot->is_active == "true";
        });

        return $filtered->pluck('name');
    }

    

    /**
     * Get search results
     *
     * @param integer $type                   type
     * @param integer $keyword                keyword
     * @param integer $search_locations       search_locations
     * @param integer $search_employees       search_employees
     * @param integer $search_skills          search_skills
     * @param integer $search_hourly_rates    search_hourly_rates
     * @param integer $search_freelaner_types search_freelaner_types
     * @param integer $search_english_levels  search_english_levels
     * @param integer $search_languages       search_languages
     *
     * @access public
     *
     * @return \Illuminate\Http\Response
     */
    public static function getSearchResult(
        $type,
        $keyword,
        $search_categories,
        $search_locations,
        $search_employees,
        $search_skills,
        $search_hourly_rates,
        $search_freelaner_types,
        $search_english_levels,
        $search_languages
    ) {
        $json = array();
        $user_id = array();
        $user_by_role =  User::role($type)->select('id')->get()->pluck('id')->toArray();
        $users = !empty($user_by_role) ? User::whereIn('id', $user_by_role)->where('is_disabled', 'false') : array();
        $filters = array();
        if (!empty($users)) {
            $filters['type'] = $type;
            if (!empty($keyword)) {
                $filters['s'] = $keyword;
                $users->where('first_name', 'like', '%' . $keyword . '%');
                $users->orWhere('last_name', 'like', '%' . $keyword . '%');
                $users->orWhere('slug', 'like', '%' . $keyword . '%');
                $users->whereIn('id', $user_by_role);
                $users->where('is_disabled', 'false');
            }
            if (!empty($search_categories)) {
              $filters['category'] = $search_categories;
              foreach ($search_categories as $key => $search_category) {
                  $categor_obj = Category::where('slug', $search_category)->first();
                  $category = Category::find($categor_obj->id);
                  if (!empty($category->freelancers)) {
                      $category_freelancers = $category->freelancers->pluck('id')->toArray();
                      foreach ($category_freelancers as $id) {
                          $user_id[] = $id;
                      }
                  }
              }
              $users->whereIn('id', $user_id)->get();
            }
            if (!empty($search_locations)) {
                $filters['locations'] = $search_locations;
                $locations = Location::select('id')->whereIn('slug', $search_locations)
                    ->get()->pluck('id')->toArray();
                $users->whereIn('location_id', $locations);
            }
            if (!empty($search_employees)) {
                $filters['employees'] = $search_employees;
                $employees = Profile::whereIn('no_of_employees', $search_employees)->get();
                foreach ($employees as $key => $employee) {
                    if (!empty($employee->user_id)) {
                        $user_id[] = $employee->user_id;
                    }
                }
                $users->whereIn('id', $user_id)->get();
            }
            if (!empty($search_skills)) {
                $filters['skills'] = $search_skills;
                $skills = Skill::whereIn('slug', $search_skills)->get();
                foreach ($skills as $key => $skill) {
                    if (!empty($skill->freelancers[$key]->id)) {
                        $user_id[] = $skill->freelancers[$key]->id;
                    }
                }
                $users->whereIn('id', $user_id);
            }
            if (!empty($search_hourly_rates)) {
                $filters['hourly_rate'] = $search_hourly_rates;
                $min = '';
                $max = '';
                foreach ($search_hourly_rates as $search_hourly_rate) {
                    $hourly_rates = explode("-", $search_hourly_rate);
                    $min = $hourly_rates[0];
                    if (!empty($hourly_rates[1])) {
                        $max = $hourly_rates[1];
                    }
                    $user_id = Profile::select('user_id')->whereIn('user_id', $user_by_role)
                        ->whereBetween('hourly_rate', [$min, $max])->get()->pluck('user_id')->toArray();
                }
                $users->whereIn('id', $user_id);
            }
            if (!empty($search_freelaner_types)) {
                $filters['freelaner_type'] = $search_freelaner_types;
                $freelancers = Profile::whereIn('freelancer_type', $search_freelaner_types)->get();
                foreach ($freelancers as $key => $freelancer) {
                    if (!empty($freelancer->user_id)) {
                        $user_id[] = $freelancer->user_id;
                    }
                }
                $users->whereIn('id', $user_id)->get();
            }
            if (!empty($search_english_levels)) {
                $filters['english_level'] = $search_english_levels;
                $freelancers = Profile::whereIn('english_level', $search_english_levels)->get();
                foreach ($freelancers as $key => $freelancer) {
                    if (!empty($freelancer->user_id)) {
                        $user_id[] = $freelancer->user_id;
                    }
                }
                $users->whereIn('id', $user_id)->get();
            }
            if (!empty($search_languages)) {
                $filters['languages'] = $search_languages;
                $languages = Language::whereIn('slug', $search_languages)->get();
                foreach ($languages as $key => $language) {
                    if (!empty($language->users[$key]->id)) {
                        $user_id[] = $language->users[$key]->id;
                    }
                }
                $users->whereIn('id', $user_id);
            }
            if ($type = 'freelancer') {
                    $users = $users->orderByRaw('-badge_id DESC')->orderBy('expiry_date', 'DESC')->orderBy('id', 'DESC');
            } else {
                $users = $users->orderBy('created_at', 'DESC')->orderBy('id', 'DESC');
            }
            $users = $users->paginate(8)->setPath('');
        }
        foreach ($filters as $key => $filter) {
            $pagination = $users->appends(
                array(
                    $key => $filter
                )
            );
        }
        $json['users'] = $users;
        return $json;
    }

    /**
     * Save dispute.
     *
     * @param string $request $req->attr
     *
     * @return \Illuminate\Http\Response
     */
    public function saveDispute($request)
    {
        $user = User::find(Auth::user()->id);
        DB::table('disputes')->insert(
            [
                'proposal_id' => $request['proposal_id'], 'user_id' => $user->id,
                'reason' => $request['reason'], 'description' => $request['description'],
                'created_at' => Carbon::now()->format('Y-m-d H:i:s'),
                'updated_at' => Carbon::now()->format('Y-m-d H:i:s')
            ]
        );
        return 'success';
    }

    /**
     * Update calcel project
     *
     * @param string $request $req->attr
     *
     * @return \Illuminate\Http\Response
     */
    public function updateCancelProject($request)
    {
        $job = Job::find($request['job_id']);
        if (!empty($job)) {
            $job->status = trans('lang.completed');
            $job->save();
            $proposal = Proposal::find($request['order_id']);
            if (!empty($proposal)) {
                $proposal->status = trans('lang.completed');
                $proposal->save();
                return 'error';
            }
            return 'success';
        } else {
            return 'error';
        }
    }

    /**
     * Update calcel project
     *
     * @param string $request $req->attr
     *
     * @return \Illuminate\Http\Response
     */
    public function updateCancelService($request)
    {
        $order = DB::table('service_user')
            ->where('id', $request['order_id'])
            ->update(['status' => 'completed']);
        return 'success';
    }

    /**
     * Save refound payout.
     *
     * @param string $request $req->attr
     *
     * @return \Illuminate\Http\Response
     */
    public function transferRefund($request)
    {
        $json = array();
        if (!empty($request['refundable_user_id'])) {
            $payment_settings = SiteManagement::getMetaValue('commision');
            $currency  = !empty($payment_settings) && !empty($payment_settings[0]['currency']) ? $payment_settings[0]['currency'] : 'USD';
            $user = User::find($request['refundable_user_id']);
            $payout_id = !empty($user->profile->payout_id) ? $user->profile->payout_id : '';
            $payout_detail = !empty($user->profile->payout_settings) ? $user->profile->payout_settings : array();
            if (!empty($payout_id) || !empty($payout_detail)) {
                $payout = new Payout();
                $payout->user()->associate($request['refundable_user_id']);
                $payout->amount = $request['amount'];
                $payout->currency = $currency;
                if (!empty($payout_detail)) {
                    $payment_details  = Helper::getUnserializeData($user->profile->payout_settings);
                    if ($payment_details['type'] == 'paypal') {
                        if (Schema::hasColumn('payouts', 'email')) {
                            $payout->email = $payment_details['paypal_email'];
                        } elseif (Schema::hasColumn('payouts', 'paypal_id')) {
                            $payout->paypal_id = $payment_details['paypal_email'];
                        }
                    } else if ($payment_details['type'] == 'bacs') {
                        $payout->bank_details = $user->profile->payout_settings;
                    } else {
                        $payout->paypal_id = '';
                    }
                    $payout->payment_method = Helper::getPayoutsList()[$payment_details['type']]['title'];
                } else if (!empty($payout_id)) {
                    $payout->payment_method = 'paypal';
                    if (Schema::hasColumn('payouts', 'email')) {
                        $payout->email = $payout_id;
                    } elseif (Schema::hasColumn('payouts', 'paypal_id')) {
                        $payout->paypal_id = $payout_id;
                    }
                }
                $payout->status = 'pending';
                if (!empty($request['order_id'])) {
                    $payout->order_id = intval($request['order_id']);
                }
                $payout->type = $request['type'];
                $payout->save();
                return 'success';
            } else {
                return 'payout_not_available';
            }
        } else {
            return 'error';
        }
    }

    public function switchToRole($role_name){
      if (Auth::user()) {
          $role = Role::where('name', $role_name)->first();

          $affected = DB::table('model_has_roles')
          ->where('model_id', Auth::user()->id)
          ->update(['is_active' => "false"]);

          $affected = DB::table('model_has_roles')
              ->where('model_id', Auth::user()->id)
              ->where('role_id', $role->id)
              ->update(['is_active' => "true"]);    
      }
    }   

    /**
     * Get the reviews for the user.
     *
     * @return relation
     */
    public static function getTopFreelancers()
    {
        return 
            DB::select(
                DB::raw(
                "SELECT users.id, users.user_verified, users.badge_id, users.location_id , SUM(reviews.avg_rating) AS rating, COUNT(reviews.id) AS total_reviews
                FROM users 
                INNER JOIN reviews
                WHERE users.id = reviews.receiver_id
                GROUP BY users.id
                Order BY rating DESC Limit 4"
            )
        );
    }

    /**
     * Send the password reset notification.
     *
     * @param  string  $token
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token));
    }
}
