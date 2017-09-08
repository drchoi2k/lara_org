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
        $this ->validate($r,[
        'name' => 'required|max:5',
        'email' => 'required|unique:users',
        'role_id' =>'required',
        'password' =>'required|min:6'
        ]);
    	user::insert(['name'=>$r->name,
    				  'email'=>$r->email,
    				  'password'=>bcrypt($r->password),
    				  'role_id'=>$r->role_id]);
    	return redirect('pagination'); 
   
    public function getEdit($id)
    { 
    	$user = User::find($id);
    	// $roles = Role::all();        
        
        $roles = Role::pluck('name','id');
    	return view('user.getEdit', compact('user','roles'));
    }

    public function postUpdate(Request $r, $id)
    {
    	$password = $r->password;
    	$user = User::find($id);
    	if ($password !="")
    	{
    		$user->name = $r->name;
    		$user->email = $r->email;
    		$user->password = $r->password;
            $user->role_id = $r->role_id;
    	} else {
    		$user->name = $r->name;
    		$user->email = $r->email;
            $user->role_id = $r->role_id;
    	}
    		$user->save();
    		return redirect('pagination');
    }
    public function postDelete($id)
    {
    	User::destroy($id);
    	// User::where('id',$id)->delete(); //each one to user by selft
    	   return back();

    }
}
 
