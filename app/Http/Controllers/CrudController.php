<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use App\User;
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
    	// return back();  
    	return redirect('pagination'); 
    }

    public function getEdit($id)
    {
    $user = User::find($id);
    $roles = Role::all();
    return view('user.getEdit', compact('user', 'roles'));
    }
 }
 