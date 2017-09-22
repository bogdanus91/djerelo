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
Auth::routes();
Route::get('/', function () {
    return view('welcome');
});

//Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('rooms', 'Admin\RoomController@index')->name('rooms');
Route::post('rooms/add', 'Admin\RoomController@addRoom')->name('addroom');
Route::get('rooms/add', 'Admin\RoomController@addRoom')->name('addroom');
Route::get('rooms/edit', 'Admin\RoomController@editRoom')->name('edit');
Route::post('rooms/edit', 'Admin\RoomController@editRoom')->name('edit');
