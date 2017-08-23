<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('index');
// });
Route::get('/', [
    'as' => 'root',
    'uses' => 'WelcomeController@index',
]);

Route::get('/index', [
    'as' => 'root',
    'uses' => 'indexController@index',
]);

Route::get('/menu', [
    'as' => 'root',
    'uses' => 'menuController@index',
]);
Route::get('/getInsert','CrudController@getInsert');
