<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
// use DB;
use App\User;
class PaginationController extends Controller
{
    public function pagination()
    {
    	$users = User::join('roles', 'roles.id','=','users.role_id')
    				->select('users.*', 'roles.name AS rolename')
    				->orderBy('users.id')           //users.id순으로 정렬
    				->paginate(5);
    	// $users = User::paginate(3);                               //use App\User
    	// $users =DB::table('users')->paginate(3);               //use DB;
    	return View('user.pagination',compact('users'));
    }
}
 