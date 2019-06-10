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


//***********Vendor Routes************** */
//doesnt work
//Route::get('/vendor','Vendor\LoginController@login')->name('vendor.login')->middleware('guest:vendor');
Route::group(['prefix' => 'vendor', 'middleware' => 'guest:vendor'], function () {
    Route::get('/','Vendor\LoginController@login')->name('vendor.login');
	Route::post('/authenticate', 'Vendor\LoginController@authenticate')->name('vendor.authenticate');

	Route::get('/register', 'Vendor\RegController@showRegForm')->name('vendor.showRegForm');
	Route::post('/register', 'Vendor\RegController@register')->name('vendor.reg');

	// Password Reset Routes
	Route::get('/showEmailForm', 'Vendor\ForgotPasswordController@showEmailForm')->name('vendor.showEmailForm');
	Route::post('/sendResetPassMail', 'Vendor\ForgotPasswordController@sendResetPassMail')->name('vendor.sendResetPassMail');
	Route::get('/reset/{code}', 'Vendor\ForgotPasswordController@resetPasswordForm')->name('vendor.resetPasswordForm');
	Route::post('/resetPassword', 'Vendor\ForgotPasswordController@resetPassword')->name('vendor.resetPassword');
});

Route::group(['prefix' => 'vendor', 'middleware' => ['auth:vendor']], function () {
	Route::get('/dashboard', 'Vendor\VendorController@dashboard')->name('vendor.dashboard')->middleware('bannedVendor');
	Route::get('/logout/{id?}', 'Vendor\LoginController@logout')->name('vendor.logout');

	// Password Routes
	Route::get('/changepassword', 'Vendor\VendorController@changePassword')->name('vendor.changePassword')->middleware('bannedVendor');
	Route::post('/updatepassword', 'Vendor\VendorController@updatePassword')->name('vendor.updatePassword');


	// Settings Routes
	Route::get('/settings', 'Vendor\SettingController@settings')->name('vendor.setting')->middleware('bannedVendor');
	Route::post('/settings/update', 'Vendor\SettingController@update')->name('vendor.setting.update');

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

    // Vendor Routes...
	Route::get('/vendors/all', 'Admin\VendorController@all')->name('admin.vendors.all');
	Route::get('/vendors/pending', 'Admin\VendorController@pending')->name('admin.vendors.pending');
	Route::get('/vendors/accepted', 'Admin\VendorController@accepted')->name('admin.vendors.accepted');
	Route::get('/vendors/rejected', 'Admin\VendorController@rejected')->name('admin.vendors.rejected');
	Route::post('/vendors/accept', 'Admin\VendorController@accept')->name('admin.vendors.accept');
	Route::post('/vendors/reject', 'Admin\VendorController@reject')->name('admin.vendors.reject');


});
