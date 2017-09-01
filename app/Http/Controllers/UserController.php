<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use App\User;
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
    // role와 user출력
        // $users = DB::table('users')->select('name');
        // $union = DB::table('roles')->select('name')->unionAll($users) ->get();
        // return view('union.union', compact('union'));
    // user와 role출력
        $roles = DB::table('roles')->select('name');
        $union = DB::table('users')->select('name')->unionAll($roles) ->get();
        return view('union.union', compact('union'));

    // ROLE만 출력
        // $roles = DB::table('roles')->select('name')->get();
        // return view('union.union', compact('roles'));

    // U전체 출력   
        // $users = DB::table('users')->get();
        // $roles = DB::table('roles')->select('name')->get();
        // dump($roles);
        // // $email = DB::table('users')->select('email')->get();
        // return view('union.union', ['users' => $users, 'roles' => $roles]);

    }




    public function all_list()
    {
    // role와 user출력
        // $users = DB::table('users')->select('name');
        // $union = DB::table('roles')->select('name')->unionAll($users) ->get();
        // return view('union.union', compact('union'));
    // user와 role출력
        // $roles = DB::table('roles')->select('name');
        // $union = DB::table('users')->select('name')->unionAll($roles) ->get();
        // return view('union.union', compact('union'));

    // ROLE만 출력
        // $roles = DB::table('roles')->select('name')->get();
        // return view('union.union', compact('roles'));

    // U전체 출력   
        // $users = DB::table('users')->get();
        $users =DB::table('users')->paginate(3);
        // $roles = DB::table('roles')->select('name')->get();
        // dump($roles);
        // $email = DB::table('users')->select('email')->get();
        return view('board.all_list', compact('users'));
        // return view('board.all_list', ['users' => $users, 'roles' => $roles]);        

    }

    public function xedb()
    {
    	$dbdata =DB::table('xe_menu_item')->paginate(2000);
    	return view('board.xedb', compact('dbdata'));
	}

 

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