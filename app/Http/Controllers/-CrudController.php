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
}
