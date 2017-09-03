<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ROLE;
USE aPP\User;
class JqueryController extends Controller
{
    public function jquery()
    {

    	return view('jquery.jquery',['roles'=>Role::pluck('name','id')]);
    }	
}
