<?php

namespace App\Events;
use Illuminate\Auth\Events\Logout;
use Illuminate\Support\Facades\Log;
use Cache;

class LogSuccessfulLogout
{
    /**
      * Create the event listener.
      *
      * @return void
      */
    public function __construct()
    {
        //
    }

    /**
      * Handle the event.
      *
      * @param  Logout  $event
      * @return void
      */
    public function handle(Logout $event)
    {
      Cache::forget("role_names");
    }
}