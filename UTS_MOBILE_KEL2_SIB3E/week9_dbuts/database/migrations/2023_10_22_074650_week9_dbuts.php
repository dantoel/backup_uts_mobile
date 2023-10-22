<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('datautsmobile', function(Blueprint $table){   
            $table->id();
            $table->string('Genre');
            $table->string('Reports');
            $table->string('Age');
            $table->string('Gpa');
            $table->string('Year');
            $table->string('Count');
            $table->string('Gender');
            $table->string('Nationality');
         });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
};
