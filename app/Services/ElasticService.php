<?php

namespace App\Services;

use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Storage;
use Response;
use App\User;

class ElasticService {

  public function indexModel($modelName){
    //$modeName::createIndex($shards = null, $replicas = null);
    $modelName::addAllToIndex();
  }

  public function update(){}

}