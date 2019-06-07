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

Route::get('/', function () {
    return view('welcome');
});

//*********Admin routes********* */
Route::group(['prefix' => 'admin', 'middleware' => 'guest:admin'], function () {
	Route::get('/','Admin\AdminLoginController@index')->name('admin.loginForm');
	Route::post('/authenticate', 'Admin\AdminLoginController@authenticate')->name('admin.login');
});

Route::group(['prefix' => 'admin', 'middleware' => ['auth:admin']], function () {
    Route::get('/dashboard', 'Admin\AdminController@dashboard')->name('admin.dashboard');
    Route::get('/logout', 'Admin\AdminController@logout')->name('admin.logout');

    // Profile Routes
    Route::get('/changePassword', 'Admin\AdminController@changePass')->name('admin.changePass');
    Route::post('/profile/updatePassword', 'Admin\AdminController@updatePassword')->name('admin.updatePassword');
    Route::get('/profile/edit/{adminID}', 'Admin\AdminController@editProfile')->name('admin.editProfile');
	Route::post('/profile/update/{adminID}', 'Admin\AdminController@updateProfile')->name('admin.updateProfile');

});
