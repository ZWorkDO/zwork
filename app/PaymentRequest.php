<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaymentRequest extends Model
{
    //

    /**
     * Get the user that has the billing address.
     *
     * @return relation
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    /**
     * Store Billing Address in database
     *
     * @param mixed   $request Request Attributes
     * @param integer $user_id User ID
     *
     * @return json response
     */
    public function storePaymentRequest($request, $user_id)
    {
        $user = User::find($user_id);
 
        $payment_request = $this;
        $payment_request->transaction_uuid = filter_var($request['transaction_uuid'], FILTER_SANITIZE_STRING);
        $payment_request->reference_number = filter_var($request['reference_number'], FILTER_SANITIZE_STRING);
        $payment_request->user_id = $user_id;
        $payment_request->type = filter_var($request['product_type'], FILTER_SANITIZE_STRING);
        $payment_request->project_type = filter_var($request['project_type'], FILTER_SANITIZE_STRING);
        $payment_request->product_id = filter_var($request['product_id'], FILTER_SANITIZE_STRING);
        $payment_request->status = 'pending';

        $payment_request->user()->associate($user_id);
        $payment_request->save();
    }
}
