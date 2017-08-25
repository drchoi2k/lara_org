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
        	        	
        	'role_id'=>3,
        	'name'=>'hongkildong',
        	'email'=>str_random(10).'@naver.com',
        	'password'=>bcrypt('123456'),
        	'remember_token'=>str_random(10)
        	]);
    }
}
 