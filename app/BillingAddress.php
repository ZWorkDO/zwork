<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BillingAddress extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name', 'last_name', 'address_line1', 'address_line2',
        'city', 'state', 'country',
    ];

    /**
     * Get the user that has the billing address.
     *
     * @return relation
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    //

    /**
     * Store Billing Address in database
     *
     * @param mixed   $request Request Attributes
     * @param integer $user_id User ID
     *
     * @return json response
     */
    public function storeBillingAddress($request, $user_id)
    {
        $user = User::find($user_id);
        $user_billing_address = $this::select('id')->where('user_id', $user_id)
            ->get()->first();
        if (!empty($user_billing_address->id)) {
            $billing_address = BillingAddress::find($user_billing_address->id);
        } else {
            $billing_address = $this;
        }

        $billing_address->first_name = filter_var($request['first_name'], FILTER_SANITIZE_STRING);
        $billing_address->last_name = filter_var($request['last_name'], FILTER_SANITIZE_STRING);
        $billing_address->address_line1 = filter_var($request['address_line1'], FILTER_SANITIZE_STRING);
        $billing_address->address_line2 = filter_var($request['address_line2'], FILTER_SANITIZE_STRING);
        $billing_address->city = filter_var($request['city'], FILTER_SANITIZE_STRING);
        $billing_address->state = filter_var($request['state'], FILTER_SANITIZE_STRING);
        $billing_address->country = filter_var($request['country'], FILTER_SANITIZE_STRING);

        $billing_address->user()->associate($user_id);

        return $billing_address->save();
    }
}
