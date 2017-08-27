<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class UserController extends Controller
{
     public function index() {
        return view('welcome');
	}

	  public function aws() {
	  	$data = ['대한민국','경상남도','지리산','종아가씨','팔룡산','무학산'];
        return view('aws_area.aws')->with('data',$data);
	}

	public function getuser()
	// public function getuser($id)
    {
        $users = DB::table('users')->get();
        
        //테이블 확인 localhost/getuser
        // dd($users);
        // dump($users); 
        
        // index.blade.php 로 넘김  
        $user = DB::table('users')->where('id',5) ->first();  
        // dump($users);
        // dump($user);
        return view('user.index', ['users' => $users, 'singleUser' => $user]);
    }

    public function union()
    {
        $users = DB::table('users')->select('name');
        $union = DB::table('roles')->select('name')->unionAll($users) ->get();

        return view('union.union', compact('union'));
    }

} 