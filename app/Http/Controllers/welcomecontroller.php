<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class welcomecontroller extends Controller
{
    /**
     * Say hello to visitors.
     *
     * @return \Illuminate\Contracts\View\Factory
     */
    public function index() {
        return view('welcome');
    }
}
