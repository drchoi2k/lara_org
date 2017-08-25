<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
     public function index() {
        return view('welcome');
	}

	  public function aws() {
	  	$data = ['대한민국','경상남도','지리산','종아가씨','팔룡산','무학산'];
        return view('aws_area.aws')->with('data',$data);
	}

}