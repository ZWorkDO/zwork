<?php

namespace App\Services;


use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp;
use GuzzleHttp\Client;
use App\User;

class MadisonService {

  public static function createCustomer() {
  }

  public static function createItem() {

  }

  public static function createOrder() {
  }

  public static function createInvoice() {
  }

  public static function accessMadison() {
    $client = new GuzzleHttp\Client();
    $res = $client->request('POST', 'http://beta.madisonpos.com/api/v2/auth/sign_in',
                            ['form_params' => [
                              'email' => 'demo@madisonpos.com',
                              'password' => '1234demo'
                              ]
                            ]);
    return $result->getBody(); 
    if ($request->hasHeader('X-Foo')) {
      echo 'It is there';
    }

    $clients = json_decode($result, true);

    foreach($clients as $client) {
        Student::updateOrCreate([
            'registration_no' => $client->{'Student Code'},
            'full_name' => $client->{'Full Name'},
            'student_class' => $client->{'StudentClass'},
            'facademic_term' => $client->{'AcademicTerm'}
        ]);
    }              
  }
}
