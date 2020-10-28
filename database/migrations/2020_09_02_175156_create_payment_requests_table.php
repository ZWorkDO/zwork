<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_requests', function (Blueprint $table) {
            $table->increments('id');
            $table->string('transaction_uuid');
            $table->string('reference_number');
            $table->integer('user_id');
            $table->integer('service_seller_id');
            $table->enum(
                'type',
                ['package', 'project']
            );
            $table->enum(
                'project_type',
                ['job', 'service']
            );
            $table->integer('product_id');
            $table->enum(
                'status',
                ['completed', 'pending', 'failed']
            );
            $table->string('token');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payment_requests');
    }
}
