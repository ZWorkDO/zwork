<?php

/**
 * Class CyberSourceHelper
 *
 * @category Worketic
 *
 * @package Worketic
 * @author  Amentotech <theamentotech@gmail.com>
 * @license http://www.amentotech.com Amentotech
 * @link    http://www.amentotech.com
 */

namespace App;

set_include_path(join(PATH_SEPARATOR, array(get_include_path(),"..","vendor","cybersource","sdk-php","lib","conf")));

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;
use CybsSoapClient;
use stdClass;
use Auth;

/**
 * Class CyberSourceHelper
 *
 */
class CyberSourceHelper extends Model
{
    private const HMAC_SHA256 =  'sha256';

    private static function sign ($params, $secret_key) {
        return CyberSourceHelper::signData(CyberSourceHelper::buildDataToSign($params), $secret_key);
    }

    private static function signData($data, $secret_Key) {
        return base64_encode(hash_hmac(CyberSourceHelper::HMAC_SHA256, $data, $secret_Key, true));
    }

    private static function buildDataToSign($params) {
        $signedFieldNames = explode(",",$params["signed_field_names"]);
        foreach ($signedFieldNames as $field) {
            $dataToSign[] = $field . "=" . $params[$field];
        }
        return CyberSourceHelper::commaSeparate($dataToSign);
    }

    private static function commaSeparate ($dataToSign) {
        return implode(",",$dataToSign);
    }

    public static function performSale($params) {
        extract($params);

        $reference_number = time()."-".Helper::generateRandomCode(15);
        $client = new CybsSoapClient();
        $request = $client->createRequest($reference_number);

        // Build a sale request (combining an auth and capture). In this example only
        // the amount is provided for the purchase total.
        $ccAuthService = new stdClass();
        $ccAuthService->run = 'true';
        $request->ccAuthService = $ccAuthService;

        $ccCaptureService = new stdClass();
        $ccCaptureService->run = 'true';
        $request->ccCaptureService = $ccCaptureService;

        $recurringSubscriptionInfo = new stdClass();
        $recurringSubscriptionInfo->subscriptionID = $payment_token;

        $request->recurringSubscriptionInfo = $recurringSubscriptionInfo;

        $purchaseTotals = new stdClass();
        $purchaseTotals->currency = $currency;
        $purchaseTotals->grandTotalAmount = $amount;
        $request->purchaseTotals = $purchaseTotals;

        $reply = $client->runTransaction($request);

        return $reply;
    }

    public static function buildRequestParams($params) {
        extract($params);

        // $properties = parse_ini_file('cybs.ini');

        $user = Auth::user();
        $profile = User::find($user->id)->profile;
        $billing_address = BillingAddress::where('user_id', Auth::user()->id)
        ->get()->first();

        $customer_id_type = "Cedula";
        $customer_id = "";
        

        if(empty($profile->id_type)){
            $customer_id = $profile->rnc;
        }else {
            $customer_id = $profile->id_number;
            if($profile->id_type == 'P'){
                $customer_id_type = "Pasaporte";
            }
        }

        $transaction_uuid = uniqid();
        $reference_number = time()."-".Helper::generateRandomCode(15);

        $payment_info = array(
            // "access_key"=>$properties["access_key"], 
            // "profile_id"=>$properties["profile_id"], 
            "access_key"=>env('ACCESS_KEY', ''), 
            "profile_id"=>env('PROFILE_ID', ''), 
            "transaction_uuid"=> $transaction_uuid,
            "signed_field_names"=> "access_key,profile_id,transaction_uuid,signed_field_names,unsigned_field_names,signed_date_time,locale,transaction_type,reference_number,amount,currency,payment_method,bill_to_forename,bill_to_surname,bill_to_email,bill_to_phone,bill_to_address_line1,bill_to_address_line2,bill_to_address_city,bill_to_address_state,bill_to_address_country,item_0_name,item_0_quantity,item_0_unit_price,line_item_count,override_custom_receipt_page,merchant_defined_data1,merchant_defined_data2,merchant_defined_data3,merchant_defined_data4,merchant_defined_data27,merchant_defined_data29,merchant_defined_data30",
            "unsigned_field_names" => "card_type,card_number,card_expiry_date",
            "signed_date_time" => gmdate("Y-m-d\TH:i:s\Z"),
            "locale" => "en",
            "transaction_type" => "create_payment_token",
            "reference_number" => $reference_number,
            "amount" => $cost,
            "currency" => "DOP",
            "payment_method" => "card",
            "bill_to_forename" => $billing_address->first_name,
            "bill_to_surname" => $billing_address->last_name,
            "bill_to_address_line1" => $billing_address->address_line1,
            "bill_to_address_line2" => $billing_address->address_line2,
            "bill_to_address_city"=> $billing_address->city,
            "bill_to_address_state" => $billing_address->state,
            "bill_to_address_country" => $billing_address->country,     
            "bill_to_email" => $user->email,
            "bill_to_phone" => $profile->phone,
            "item_0_name" => $product_name,
            "item_0_quantity" => 1,
            "item_0_unit_price" => $cost,
            "line_item_count" => 1,
            "merchant_defined_data1" => "RETAIL",
            // "merchant_defined_data2" => $properties['merchant_id'],
            "merchant_defined_data2" => env('MERCHANT_ID', ''),
            "merchant_defined_data3" => "Web",
            "merchant_defined_data4" => Auth::user()->id,
            "merchant_defined_data27" => "TOKENIZATION NO",
            "merchant_defined_data29" => $customer_id_type,
            "merchant_defined_data30" => $customer_id,
            "override_custom_receipt_page" => "http://localhost/zwork/public/pay/cybsrc",        
        );
        // $payment_info["signature"] = CyberSourceHelper::sign($payment_info,  $properties['secret_key']);
        $payment_info["signature"] = CyberSourceHelper::sign($payment_info,  env('SECRET_KEY', ''));

        $payment_info["reference_fields"] = array(
            "transaction_uuid" => $transaction_uuid,
            "reference_number" => $reference_number,
            "product_id" => $product_id,
            "product_type" =>  $product_type,
            "project_type" => $project_type,
            "service_seller" => $service_seller
        );       

        return $payment_info;
    }
}
