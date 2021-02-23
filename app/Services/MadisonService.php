<?php

namespace App\Services;

use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Storage;
use Response;
use App\User;

class MadisonService {
  private $headerToken;
  private $headerUid;
  private $headerClient;
  private $baseUrl = 'http://beta.madisonpos.com/';

  /*
   * Customers / Providers
   */
  public static function createCustomer() {
    $this->auth();
    $tercero = [];
    $tercero['thirdparty']['name'] = "PavelP";
    $tercero['thirdparty']['phone'] = "8098512032";
    $tercero['thirdparty']['rnc'] = "131125332";
    $tercero['thirdparty']['email'] = "email2@pruebabarton.com";
    $tercero['thirdparty']['is_client'] = 1;
    $tercero['thirdparty']['is_provider'] = 1;
    $tercero['thirdparty']['is_active'] = 1;
    $tercero['thirdparty']['price_level'] = 1;
    $tercero['thirdparty']['is_company'] = 1;
    $tercero['thirdparty']['ncf_type'] = 'Consumidor Final';
    $tercero['thirdparty']['price_level'] = 1;
    echo json_encode($tercero);

    $client = new GuzzleHttp\Client();
    try {
      $result = $client->request('POST', $this->baseUrl.'api/v2/thirdparties.json',
                                          ['headers' => [
                                            'uid' => $this->headerUid,
                                            'client' => $this->headerClient,
                                            'access-token' => $this->headerToken,
                                            'Content-Type' => 'application/json'
                                            ],
                                            'body' => json_encode($tercero)
                                          ]);
      $response = json_decode($result->getBody(), true);
      echo $result->getBody();
      echo $response['id'];
    } catch (ClientException $e) {
      echo Psr7\str($e->getRequest());
      echo Psr7\str($e->getResponse());
    }
  }

  public function getCustomer($id) {
    $this->auth();
    $client = new GuzzleHttp\Client();
    $result = $client->request('GET', $this->baseUrl.'api/v2/thirdparties/'.$id.'.json',
                            ['headers' => [
                              'uid' => $this->headerUid,
                              'client' => $this->headerClient,
                              'access-token' => $this->headerToken
                              ],
                            ]);
    $customer = json_decode($result->getBody(), true);
    return $customer;
  }

  /*
   * Items / Services
   */
  public function listItems(){
    $this->auth();
    $client = new GuzzleHttp\Client();
    $result = $client->request('GET', $this->baseUrl.'api/v2/items.json',
                            ['headers' => [
                              'uid' => $this->headerUid,
                              'client' => $this->headerClient,
                              'access-token' => $this->headerToken
                              ],
                            ]);
    $items = json_decode($result->getBody(), true);
    return $items;
  }

  public static function createItem() {
    $this->auth();
    $item = [];
    $item['item']['name'] = "PavelP";
    $item['item']['description'] = "8098512032";
    $item['item']['measure_unit'] = "unidad";
    $item['item']['is_service'] = 1;
    $item['item']['tax_id'] = 3;
    $item['item']['cost'] = 100;
    $item['item']['item_category_id'] = 516;
    $item['item']['prices_attributes'][0]['price'] = 100;
    $item['item']['prices_attributes'][0]['tax_percent'] = 18;
    $item['item']['prices_attributes'][0]['tax_value'] = 18;
    $item['item']['prices_attributes'][0]['sale_price'] = 118;
    $item['item']['prices_attributes'][0]['margin'] = 1;
    $item['item']['prices_attributes'][0]['keep_margin'] = 1;
    echo json_encode($item);

    $client = new GuzzleHttp\Client();
    try {
      $result = $client->request('POST', $this->baseUrl.'api/v2/items.json',
                                          ['headers' => [
                                            'uid' => $this->headerUid,
                                            'client' => $this->headerClient,
                                            'access-token' => $this->headerToken,
                                            'Content-Type' => 'application/json'
                                            ],
                                            'body' => json_encode($item)
                                          ]);
      $response = json_decode($result->getBody(), true);
      echo $result->getBody();
      echo $response['id'];
      echo $response['name'];
      echo $response['item_code'];
    } catch (ClientException $e) {
      echo Psr7\str($e->getRequest());
      echo Psr7\str($e->getResponse());
    }
  }


  /*
   * Invoices / Orders
   */
>>>>>>> fd60654252d8e7e19492e58bc01153fadd49147b
  public static function createOrder() {
  }

  public static function createInvoice() {
  }

  public function get_pdf_order() {
    $this->auth();
    $client = new GuzzleHttp\Client();
    $id = 1548098;
    $result = $client->request('GET', $this->baseUrl.'api/v2/sales_orders/generar_pdf?id='.$id,
                               ['headers' => [
                                  'uid' => $this->headerUid,
                                  'client' => $this->headerClient,
                                  'access-token' => $this->headerToken,
                                  'Content-Type' => 'application/pdf'
                               ],
                               'sink' => storage_path('app/public/'.$id.'.pdf')
                               ]);
    $headers = array('Content-Type: application/pdf');
    return Response::download(storage_path('app/public/'.$id.'.pdf'), $id.'.pdf', $headers);
  }

  public function get_pdf_invoice() {
    $this->auth();
    $client = new GuzzleHttp\Client();
    $id = 1548098;
    $result = $client->request('GET', $this->baseUrl.'api/v2/invoices/generar_pdf?id='.$id,
                               ['headers' => [
                                  'uid' => $this->headerUid,
                                  'client' => $this->headerClient,
                                  'access-token' => $this->headerToken,
                                  'Content-Type' => 'application/pdf'
                               ],
                               'sink' => storage_path('app/public/'.$id.'.pdf')
                               ]);
    $headers = array('Content-Type: application/pdf');
    return Response::download(storage_path('app/public/'.$id.'.pdf'), $id.'.pdf', $headers);
  }


  /*
   * Authentication
   */
  public function auth() {
    $client = new GuzzleHttp\Client();
    $result = $client->request('POST', $this->baseUrl.'api/v2/auth/sign_in',
                            ['form_params' => [
                              'email' => 'demo@madisonpos.com',
                              'password' => '1234demo'
                              ]
                            ]);
    $this->madisonHeaders($result);          
  }

  private function madisonHeaders($result) {
    if ($result->hasHeader('access-token')) {
      $this->headerToken = $result->getHeader('access-token')[0];
    }
    if ($result->hasHeader('uid')) {
      $this->headerUid = $result->getHeader('uid')[0];
    }
    if ($result->hasHeader('client')) {
      $this->headerClient = $result->getHeader('client')[0];
    }
  }
}