<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Role;
use App\User;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
class CrudController extends Controller
{
    public function getInsert()
    {
    	$roles = Role::all();
    	return view('user.getInsert',compact('roles'));
    }

    public function postInsert(Request $r)
    {
    	user::insert(['name'=>$r->name,
    				  'email'=>$r->email,
    				  'password'=>bcrypt($r->password),
    				  'role_id'=>$r->role_id]);
    	return back();  
    	// return redirect('pagination'); 
    }
 }
 