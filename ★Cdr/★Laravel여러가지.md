php artisan make:controller indexcontroller
routes촐더 안에 wep.php 와 상기 controller와 연결됨

1. phpmyadmin에서 database생성
2. php artisan make:controller XxxxxxxController
3. php artisan make:model Xxxxxxx
4. 

php artisan make:migration create_user_table --create=user
===================2017_08_24_231647_create_user_table.php
<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('role_id')->unsigned();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
            $table->foreign('role_id')->references('id')->on('roles');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}


php artisan migrate

php artisan make:seeder RolesTableSeeder
===================RolesTableSeeder.php

<?php

use Illuminate\Database\Seeder;
use App\Role;
class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       Role :: insert([['name'=>'admin','description'=>'This is Admin'],
       					['name'=>'Virector','description'=>'This is Virector'],
       					['name'=>'Manager','description'=>'This is Manager'],
        	            ]);
    }
}



php artisan make:model Role
=========================Role.php
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    //
}


php artisan db:seed --class=RolesTableSeeder

php artisan migrate:refresh --seed            //:db data delete
