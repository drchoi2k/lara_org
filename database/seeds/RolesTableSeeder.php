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
                ['name'=>'CEO','description'=>'This is CEO'],
        	            ]);
    }
}
