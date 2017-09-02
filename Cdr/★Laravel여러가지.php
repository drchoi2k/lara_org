<?php

// php artisan make:controller indexcontroller
// routes촐더 안에 wep.php 와 상기 controller와 연결됨

// 1. phpmyadmin에서 database생성
// 2. php artisan make:controller XxxxxxxController
// 3. php artisan make:model Xxxxxxx
// 4. 


//$ :db table migration
//$ php artisan make:migration create_user_table --create=user

// ===================2017_08_24_231647_create_user_table.php(/database/migrations)
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

//$ :db migrate
//$ php artisan migrate

//$ php artisan make:seeder RolesTableSeeder
//===================RolesTableSeeder.php

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



//$ php artisan make:model Role
//=========================Role.php(/app)
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    //
}


//$ :db data seeding
//$ php artisan db:seed
//$ php artisan db:seed --class=RolesTableSeeder

//$ :db data delete
//$ php artisan migrate:refresh --seed            


// DB users table에 data추가
//=============DatabaseSeeder.php(/databse/seeds)
 <?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     * 
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        // factory('App\User', 10)->create();
        factory('App\User')->create([
        	'role_id'=>2,
        	'name'=>'choi d r',
        	'email'=>str_random(10),
        	'password'=>bcrypt('secret'),
        	'remember_token'=>str_random(10)
        	]);
    }
}

//=============ModelFactory.php (/database/factories)
<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\User::class, function (Faker\Generator $faker) {
    static $password;

    return [
    	'role_id'=>1,
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'password' => $password ?: $password = bcrypt('secret'),
        'remember_token' => str_random(10),
    ];
});

//==========DB관련 명령
// web.php
Route::get('/all_list','UserController@all_list');

$users = DB::table('users')->get();
return view('board.all_list', compact('users'));

$users = DB::table('users')->get();
$user = DB::table('users')->where('id',5) ->first();
return view('user.index', ['users' => $users, 'singleUser' => $user]);

$roles = DB::table('roles')->select('name');
$union = DB::table('users')->select('name')->unionAll($roles) ->get();
return view('union.union', compact('union'));

// xxxxx.blade.php
<table class="list">
	@foreach($users as $un)
		<tr>
			<td>{{ $un -> role_id }} </td>
		</tr>
	@endforeach
</table>

//pagination
// UserController
 public function xedb()
    {
        $dbdata =DB::table('xe_menu_item')->paginate(2000);
        return view('board.xedb', compact('dbdata'));
    }


<body>
        <h1>DataBase 목 록</h1>
        <table class="list">
            @foreach($dbdata as $un)
            <tr>
                <td>{{ $un -> menu_item_srl }} </td>
            </tr>
            @endforeach
        </table>
        <hr>
    <ul class="posi">{{ $dbdata -> render() }}</ul>
</body>

// Form, Html 클래스 
composer require laravelcollective/html    //download
Collective\Html\HtmlServiceProvider::class,    // config/app.php 'provider'에 추가
'Form' => Collective\Html\FormFacade::class,   // config/app.php 'aliases'에 추가
'Html' => Collective\Html\HtmlFacade::class,   // config/app.php 'aliases'에 추가


