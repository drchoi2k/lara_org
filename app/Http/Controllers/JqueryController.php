<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
USE App\User;
class JqueryController extends Controller
{
    public function jquery()
    {

    	return view('jquery.jquery',['roles'=>Role::pluck('name','id')]);
    }

    public function postJquery(Request $r)	
    {
    	if ($r->ajax())
    	{
     		$user = new User();
    		$user['name'] = $r->name;
    		$user['email'] = $r->email;
    		$user['password'] = $r['password'];
    		$user['role_id'] = $r['role_id'];
    		if ($user ->save())
    		 {
    		 	return response($r->all());
    		 	// return response(['msg'=>'inserted successfully']);
    		 }
    		
    	}
    	
    }
    public function readByAjax()
    	{
    		$users = User::join('roles', 'roles.id', '=', 'users.role_id')
    			->select('users.*', 'roles.name as rolename')
    			->orderBy('users.id','DESC')
    			->get();
    		return view('jquery.readByAjax', compact('users'));
    	}
    public function deleteByAjax(Request $r)
    	{
    		if ($r->ajax())
    		{
    		User::destroy($r->id);
    	    return response(['id'=>$r->id]);
    	    }		
		}

}
