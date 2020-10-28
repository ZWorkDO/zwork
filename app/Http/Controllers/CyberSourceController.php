<?php

/**
 * Class StripeController
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @version <PHP: 1.0.0>
 * @link    http://www.amentotech.com
 */
namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Validator;
use URL;
use Session;
use Redirect;
use Input;
use App\User;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Stripe\Error\Card;
use App\Proposal;
use App\Job;
use Auth;
use App\Invoice;
use App\PaymentRequest;
use DB;
use App\Package;
use Illuminate\Support\Facades\Mail;
use App\EmailTemplate;
use App\Mail\FreelancerEmailMailable;
use App\Mail\EmployerEmailMailable;
use App\Helper;
use App\Item;
use Carbon\Carbon;
use App\Message;
use App\Service;
use App\SiteManagement;
use Illuminate\Support\Facades\Log;
use CybsSoapClient;
use CyberSourceHelper;
use stdClass;

/**
 * Class StripeController
 *
 */
class CyberSourceController extends Controller
{
    /**
     * Show the application paywith stripe.
     *
     * @return \Illuminate\Http\Response
     */

    public function getUserIpAddr(){
        if(!empty($_SERVER['HTTP_CLIENT_IP'])){
            //ip from share internet
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        }elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
            //ip pass from proxy
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        }else{
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request req->attr
     *
     * @return \Illuminate\Http\Response
     */
    public function postPayment(Request $request)
    {
        $payment_request = PaymentRequest::where("transaction_uuid",$request->req_transaction_uuid)
                                            ->where("reference_number",$request->req_reference_number)
                                            ->where("status",'pending')
                                            ->get()->first();

        $sale_params = array();
        $sale_params["currency"] = $request->req_currency;
        $sale_params["amount"] = $request->req_amount;
        $sale_params["payment_token"] = $request->payment_token;
        $sale_response = CyberSourceHelper::performSale($sale_params);   

        if($request->decision == "ACCEPT" && $sale_response->decision == "ACCEPT"){
            $payment_request->status = 'completed';
            $payment_request->token = filter_var($request->payment_token, FILTER_SANITIZE_STRING);
            $payment_request->save();

            $fee = 0;
            $invoice = new Invoice();
            $invoice->title = 'Invoice';
            $invoice->price = $request->req_amount;
            $invoice->payer_name = filter_var($request->req_bill_to_forename, FILTER_SANITIZE_STRING)." ".filter_var($request->req_bill_to_surname, FILTER_SANITIZE_STRING);
            $invoice->payer_email = filter_var($request->req_bill_to_email, FILTER_SANITIZE_STRING);
            $invoice->seller_email = 'test@email.com';
            $invoice->currency_code = filter_var($request->req_currency, FILTER_SANITIZE_STRING);
            $invoice->payer_status = '';
            $invoice->transaction_id = filter_var($sale_response->requestID, FILTER_SANITIZE_STRING);
            $invoice->invoice_id = filter_var($sale_response->merchantReferenceCode, FILTER_SANITIZE_STRING);
            $invoice->customer_id = filter_var($payment_request->user_id, FILTER_SANITIZE_STRING);
            $invoice->shipping_amount = 0;
            $invoice->handling_amount = 0;
            $invoice->insurance_amount = 0;
            $invoice->sales_tax = 0;
            $invoice->payment_mode = filter_var('cybersource', FILTER_SANITIZE_STRING);
            $invoice->paypal_fee = $fee;
            $invoice->paid = 1;
            $product_type = $payment_request->type;
            $invoice->type = $product_type;
            $invoice->save();
            $invoice_id = DB::getPdo()->lastInsertId();
            if ($payment_request->type == 'package') {
                $item = DB::table('items')->select('id')->where('subscriber', $payment_request->user_id)->first();
                if (!empty($item)) {
                    $item = Item::find($item->id);
                } else {
                    $item = new Item();
                }
            } else {
                $item = new Item();
            }
            $item->invoice_id = filter_var($invoice_id, FILTER_SANITIZE_NUMBER_INT);
            $item->product_id = filter_var($payment_request->product_id, FILTER_SANITIZE_NUMBER_INT);
            $item->subscriber = $payment_request->user_id;
            $item->item_name = filter_var($request->req_item_0_name, FILTER_SANITIZE_STRING);
            $item->item_price = filter_var($request->req_item_0_unit_price, FILTER_SANITIZE_STRING);
            $item->item_qty = filter_var(1, FILTER_SANITIZE_NUMBER_INT);
            $item->save();
            $last_order_id = session()->get('custom_order_id');
            DB::table('orders')
                ->where('id', $last_order_id)
                ->update(['status' => 'completed']);
                
            if (Auth::user()) {
                if ($product_type == 'package') {
                    if ($payment_request->product_id) {
                        $package_item = \App\Item::where('subscriber', Auth::user()->id)->first();
                        $id = $payment_request->product_id;
                        $package = \App\Package::find($id);
                        $option = !empty($package->options) ? unserialize($package->options) : '';
                        $expiry = !empty($option) ? $invoice->created_at->addDays($option['duration']) : '';
                        $expiry_date = !empty($expiry) ? Carbon::parse($expiry)->toDateTimeString() : '';
                        $user = \App\User::find(Auth::user()->id);
                        if (!empty($package->badge_id) && $package->badge_id != 0) {
                            $user->badge_id = $package->badge_id;
                        }
                        $user->expiry_date = $expiry_date;
                        $user->save();
                        // send mail
                        if (!empty(config('mail.username')) && !empty(config('mail.password'))) {
                            $item = DB::table('items')->where('product_id', $id)->get()->toArray();
                            $package =  Package::where('id', $item[0]->product_id)->first();
                            $user = User::find($item[0]->subscriber);
                            $role = $user->getRoleNames()->first();
                            $package_options = unserialize($package->options);
                            if (!empty($invoice)) {
                                if ($package_options['duration'] === 'Quarter') {
                                    $expiry_date = $invoice->created_at->addDays(4);
                                } elseif ($package_options['duration'] === 'Month') {
                                    $expiry_date = $invoice->created_at->addMonths(1);
                                } elseif ($package_options['duration'] === 'Year') {
                                    $expiry_date = $invoice->created_at->addYears(1);
                                }
                            }
                            if ($role === 'employer') {
                                if (!empty($user->email)) {
                                    $email_params = array();
                                    $template = DB::table('email_types')->select('id')->where('email_type', 'employer_email_package_subscribed')->get()->first();
                                    if (!empty($template->id)) {
                                        $template_data = EmailTemplate::getEmailTemplateByID($template->id);
                                        $email_params['employer'] = Helper::getUserName(Auth::user()->id);
                                        $email_params['employer_profile'] = url('profile/' . Auth::user()->slug);
                                        $email_params['name'] = $package->title;
                                        $email_params['price'] = $package->cost;
                                        $email_params['expiry_date'] = !empty($expiry_date) ? Carbon::parse($expiry_date)->format('M d, Y') : '';
                                        Mail::to(Auth::user()->email)
                                            ->send(
                                                new EmployerEmailMailable(
                                                    'employer_email_package_subscribed',
                                                    $template_data,
                                                    $email_params
                                                )
                                            );
                                    }
                                }
                            } elseif ($role === 'freelancer') {
                                if (!empty(Auth::user()->email)) {
                                    $email_params = array();
                                    $template = DB::table('email_types')->select('id')->where('email_type', 'freelancer_email_package_subscribed')->get()->first();
                                    if (!empty($template->id)) {
                                        $template_data = EmailTemplate::getEmailTemplateByID($template->id);
                                        $email_params['freelancer'] = Helper::getUserName(Auth::user()->id);
                                        $email_params['freelancer_profile'] = url('profile/' . Auth::user()->slug);
                                        $email_params['name'] = $package->title;
                                        $email_params['price'] = $package->cost;
                                        $email_params['expiry_date'] = !empty($expiry_date) ? Carbon::parse($expiry_date)->format('M d, Y') : '';
                                        Mail::to(Auth::user()->email)
                                            ->send(
                                                new FreelancerEmailMailable(
                                                    'freelancer_email_package_subscribed',
                                                    $template_data,
                                                    $email_params
                                                )
                                            );
                                    }
                                }
                            }
                        }
                    }
                } else if ($product_type == 'project') {
                    if (!empty( $payment_request->project_type)) {
                        $project_type = $payment_request->project_type;
                        if ($project_type == 'service') {
                            $id = $payment_request->project_id;
                            $freelancer = $payment_request->service_seller;
                            $service = Service::find($id);
                            $service->users()->attach(Auth::user()->id, ['type' => 'employer', 'status' => 'hired', 'seller_id' => $freelancer, 'paid' => 'pending']);
                            $service->save();
                            // send message to freelancer
                            $message = new Message();
                            $user = User::find(intval(Auth::user()->id));
                            $message->user()->associate($user);
                            $message->receiver_id = intval($freelancer);
                            $message->body = Helper::getUserName(Auth::user()->id) . ' ' . trans('lang.service_purchase') . ' ' . $service->title;
                            $message->status = 0;
                            $message->save();
                            // send mail
                            if (!empty(config('mail.username')) && !empty(config('mail.password'))) {
                                $email_params = array();
                                $template_data = Helper::getFreelancerNewOrderEmailContent();
                                $email_params['title'] = $service->title;
                                $email_params['service_link'] = url('service/' . $service->slug);
                                $email_params['amount'] = $service->price;
                                $email_params['freelancer_name'] = Helper::getUserName($freelancer);
                                $email_params['employer_profile'] = url('profile/' . $user->slug);
                                $email_params['employer_name'] = Helper::getUserName($user->id);
                                $freelancer_data = User::find(intval($freelancer));
                                Mail::to($freelancer_data->email)
                                    ->send(
                                        new FreelancerEmailMailable(
                                            'freelancer_email_new_order',
                                            $template_data,
                                            $email_params
                                        )
                                    );
                            }
                        }
                    } else {
                        $id = $payment_request->product_id;
                        $proposal = Proposal::find($id);
                        $proposal->hired = 1;
                        $proposal->status = 'hired';
                        $proposal->paid = 'pending';
                        $proposal->save();
                        $job = Job::find($proposal->job->id);
                        $job->status = 'hired';
                        $job->save();
                        // send message to freelancer
                        $message = new Message();
                        $user = User::find(intval(Auth::user()->id));
                        $message->user()->associate($user);
                        $message->receiver_id = intval($proposal->freelancer_id);
                        $message->body = trans('lang.hire_for') . ' ' . $job->title . ' ' . trans('lang.project');
                        $message->status = 0;
                        $message->save();
                        // send mail
                        if (!empty(config('mail.username')) && !empty(config('mail.password'))) {
                            $freelancer = User::find($proposal->freelancer_id);
                            $employer = User::find($job->user_id);
                            if (!empty($freelancer->email)) {
                                $email_params = array();
                                $template = DB::table('email_types')->select('id')->where('email_type', 'freelancer_email_hire_freelancer')->get()->first();
                                if (!empty($template->id)) {
                                    $template_data = EmailTemplate::getEmailTemplateByID($template->id);
                                    $email_params['project_title'] = $job->title;
                                    $email_params['hired_project_link'] = url('job/' . $job->slug);
                                    $email_params['name'] = Helper::getUserName($freelancer->id);
                                    $email_params['link'] = url('profile/' . $freelancer->slug);
                                    $email_params['employer_profile'] = url('profile/' . $employer->slug);
                                    $email_params['emp_name'] = Helper::getUserName($employer->id);
                                    Mail::to($freelancer->email)
                                        ->send(
                                            new FreelancerEmailMailable(
                                                'freelancer_email_hire_freelancer',
                                                $template_data,
                                                $email_params
                                            )
                                        );
                                }
                            }
                        }
                    }
                }
            }
            
        } else {
            $payment_request->status = 'failed';
            $payment_request->save();
            if($payment_request->type == "package") {
                Session::flash('error', trans('lang.money_not_add'));
                return Redirect::to('user/package/checkout/'.$payment_request->product_id);
            }
        }

        session()->forget('product_id');
        session()->forget('product_title');
        session()->forget('product_price');
        session()->forget('custom_order_id');
        $project_type = session()->get('project_type');
        
        if (Auth::user()->getRoleNames()[0] == "employer") {
            if ($type == 'project') {
                $url = '';
                if ($project_type == 'service') {
                    $url = 'employer/services/hired';
                } else {
                    $url = 'employer/jobs/hired';
                }
                session()->forget('type');
                Session::flash('message', trans('lang.freelancer_successfully_hired'));
                return Redirect::to($url);                
            } else {
                session()->forget('type');
                Session::flash('message', trans('lang.thanks_subscription'));
                return Redirect::to('dashboard/packages/employer');   
            }
        } else if (Auth::user()->getRoleNames()[0] == "freelancer") {
            session()->forget('type');
            Session::flash('message', trans('lang.thanks_subscription'));
            return Redirect::to('dashboard/packages/freelancer');  
        }
    }

    public function prePayment(Request $request) {
        $json = array();

        $this->validate(
            $request,
            [
                'transaction_uuid' => 'required',
                'reference_number' => 'required',
                'product_type' => 'required',
                'product_id' => 'required',
                'ccExpiryMonth' => 'required',
                'ccExpiryYear' => [
                    'required',
                    function ($attribute, $value, $fail) {
                        $current_year = Carbon::now()->format('Y');
                        if ($value < $current_year) {
                            $fail(trans('lang.valid_year'));
                        }
                      },
                ]
            ]
        );

        $payment_request = new PaymentRequest();
        $payment_request->storePaymentRequest($request, Auth::user()->id); 

        $json['type'] = 'success';
        return $json;
    }

}
