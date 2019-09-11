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

    // Product Routes
	Route::get('/product/create', 'Vendor\ProductController@create')->name('vendor.product.create')->middleware('bannedVendor');
	Route::post('/product/store', 'Vendor\ProductController@store')->name('vendor.product.store');
	Route::get('/product/getsubcategories', 'Vendor\ProductController@getsubcats')->name('vendor.product.getsubcats');
	Route::get('/product/getattributes', 'Vendor\ProductController@getattributes')->name('vendor.product.getattributes');
	Route::get('/product/manage', 'Vendor\ProductController@manage')->name('vendor.product.manage')->middleware('bannedVendor');
	Route::get('/product/{id}/edit', 'Vendor\ProductController@edit')->name('vendor.product.edit')->middleware('bannedVendor');
	Route::post('/product/update', 'Vendor\ProductController@update')->name('vendor.product.update');
	Route::get('/product/{id}/getimgs', 'Vendor\ProductController@getimgs')->name('vendor.product.getimgs');
    Route::post('/delete', 'Vendor\ProductController@delete')->name('vendor.product.delete');
    Route::get('/product/manage/{id}', 'Vendor\ProductController@individualproductshow')->name('vendor.product.individualproductshow')->middleware('bannedVendor');

    // Order Routes
	Route::get('/orders', 'Vendor\OrderController@orders')->name('vendor.orders')->middleware('bannedVendor');
	Route::get('/{orderid}/orderdetails', 'Vendor\OrderController@orderdetails')->name('vendor.orderdetails')->middleware('bannedVendor');


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

    // Category Management...
    Route::get('/category/index', 'Admin\CategoryController@index')->name('admin.category.index');
    Route::post('/category/store', 'Admin\CategoryController@store')->name('admin.category.store');
    Route::post('/category/update', 'Admin\CategoryController@update')->name('admin.category.update');

	// Subcategory Management...
    Route::get('/subcategory/{id}/index', 'Admin\SubcategoryController@index')->name('admin.subcategory.index');
    Route::post('/subcategory/store', 'Admin\SubcategoryController@store')->name('admin.subcategory.store');
    Route::post('/subcategory/update', 'Admin\SubcategoryController@update')->name('admin.subcategory.update');

    // Product Attribute Management...
	Route::get('/productattr/index', 'Admin\ProductattrController@index')->name('admin.productattr.index');
	Route::post('/productattr/store', 'Admin\ProductattrController@store')->name('admin.productattr.store');
    Route::post('/productattr/update', 'Admin\ProductattrController@update')->name('admin.productattr.update');

    // Attribute Value Management...
	Route::get('/options/{id}/index', 'Admin\OptionController@index')->name('admin.options.index');
	Route::post('/options/store', 'Admin\OptionController@store')->name('admin.options.store');
    Route::post('/options/update', 'Admin\OptionController@update')->name('admin.options.update');

    // Order Routes...
	Route::get('/orders/all', 'Admin\OrderController@all')->name('admin.orders.all');
	Route::get('/orders/confirmation/pending', 'Admin\OrderController@cPendingOrders')->name('admin.orders.cPendingOrders');
	Route::get('/orders/confirmation/accepted', 'Admin\OrderController@cAcceptedOrders')->name('admin.orders.cAcceptedOrders');
	Route::get('/orders/confirmation/rejected', 'Admin\OrderController@cRejectedOrders')->name('admin.orders.cRejectedOrders');
	Route::get('/orders/delivery/pending', 'Admin\OrderController@pendingDelivery')->name('admin.orders.pendingDelivery');
	Route::get('/orders/delivery/inprocess', 'Admin\OrderController@pendingInprocess')->name('admin.orders.pendingInprocess');
	Route::get('/orders/delivered', 'Admin\OrderController@delivered')->name('admin.orders.delivered');
	Route::get('/{orderid}/orderdetails', 'Admin\OrderController@orderdetails')->name('admin.orderdetails');

    Route::post('/shippingchange', 'Admin\OrderController@shippingchange')->name('admin.shippingchange');
	Route::post('/cancelOrder', 'Admin\OrderController@cancelOrder')->name('admin.cancelOrder');
    Route::post('/acceptOrder', 'Admin\OrderController@acceptOrder')->name('admin.acceptOrder');

    // Comment routes..
	Route::get('/comments', 'Admin\CommentController@all')->name('admin.comments.all');
	Route::get('/complains', 'Admin\CommentController@complains')->name('admin.complains');
    Route::get('/suggestions', 'Admin\CommentController@suggestions')->name('admin.suggestions');
    Route::post('/updateComment', 'Admin\CommentController@updateComment')->name('admin.updateComment');


    // Coupon Routes
	Route::get('/coupon/index', 'Admin\CouponController@index')->name('admin.coupon.index');
	Route::get('/coupon/create', 'Admin\CouponController@create')->name('admin.coupon.create');
	Route::post('/coupon/store', 'Admin\CouponController@store')->name('admin.coupon.store');
	Route::get('/coupon/{id}/edit', 'Admin\CouponController@edit')->name('admin.coupon.edit');
	Route::post('/coupon/update', 'Admin\CouponController@update')->name('admin.coupon.update');
    Route::post('/coupon/delete', 'Admin\CouponController@delete')->name('admin.coupon.delete');

    // Interface Routes
    Route::get('/interfaceControl/slider/index', 'Admin\InterfaceControl\SliderController@index')->name('admin.slider.index');
	Route::post('/interfaceControl/slider/store', 'Admin\InterfaceControl\SliderController@store')->name('admin.slider.store');
    Route::post('/interfaceControl/slider/delete', 'Admin\InterfaceControl\SliderController@delete')->name('admin.slider.delete');

    // User management Routes...
	Route::get('/userManagement/allUsers', 'Admin\UserManagementController@allUsers')->name('admin.allUsers');
    Route::get('/userManagement/allUsersSearchResult', 'Admin\UserManagementController@allUsersSearchResult' )->name('admin.allUsersSearchResult');
    Route::get('/userManagement/bannedUsers', 'Admin\UserManagementController@bannedUsers')->name('admin.bannedUsers');
    Route::get('/userManagement/bannedUsersSearchResult', 'Admin\UserManagementController@bannedUsersSearchResult' )->name('admin.bannedUsersSearchResult');
    Route::get('/userManagement/verifiedUsers', 'Admin\UserManagementController@verifiedUsers')->name('admin.verifiedUsers');
    Route::get('/userManagement/verUsersSearchResult', 'Admin\UserManagementController@verUsersSearchResult' )->name('admin.verUsersSearchResult');
    Route::get('/userManagement/mobileUnverifiedUsers', 'Admin\UserManagementController@mobileUnverifiedUsers')->name('admin.mobileUnverifiedUsers');
    Route::get('/userManagement/mobileUnverifiedUsersSearchResult', 'Admin\UserManagementController@mobileUnverifiedUsersSearchResult' )->name('admin.mobileUnverifiedUsersSearchResult');
    Route::get('/userManagement/emailUnverifiedUsers', 'Admin\UserManagementController@emailUnverifiedUsers')->name('admin.emailUnverifiedUsers');
    Route::get('/userManagement/emailUnverifiedUsersSearchResult', 'Admin\UserManagementController@emailUnverifiedUsersSearchResult' )->name('admin.emailUnverifiedUsersSearchResult');
    Route::get('/userManagement/userDetails/{userID}', 'Admin\UserManagementController@userDetails')->name('admin.userDetails');
    Route::post('/userManagement/updateUserDetails', 'Admin\UserManagementController@updateUserDetails')->name('admin.updateUserDetails');
    Route::get('/userManagement/addSubtractBalance/{userID}', 'Admin\UserManagementController@addSubtractBalance')->name('admin.addSubtractBalance');
    Route::post('/userManagement/updateUserBalance', 'Admin\UserManagementController@updateUserBalance')->name('admin.updateUserBalance');
    Route::get('/userManagement/emailToUser/{userID}', 'Admin\UserManagementController@emailToUser')->name('admin.emailToUser');
    Route::post('/userManagement/sendEmailToUser', 'Admin\UserManagementController@sendEmailToUser')->name('admin.sendEmailToUser');
    Route::get('/userManagement/ads/{userID}', 'Admin\UserManagementController@ads')->name('admin.userManagement.ads');


    // Vendor management Routes...
	Route::get('/vendorManagement/allVendors', 'Admin\VendorManagementController@allVendors')->name('admin.allVendors');
    Route::get('/vendorManagement/allVendorsSearchResult', 'Admin\VendorManagementController@allVendorsSearchResult' )->name('admin.allVendorsSearchResult');
    Route::get('/vendorManagement/bannedVendors', 'Admin\VendorManagementController@bannedVendors')->name('admin.bannedVendors');
    Route::get('/vendorManagement/bannedVendorsSearchResult', 'Admin\VendorManagementController@bannedVendorsSearchResult' )->name('admin.bannedVendorsSearchResult');
    Route::get('/vendorManagement/vendorDetails/{vendorID}', 'Admin\VendorManagementController@vendorDetails')->name('admin.vendorDetails');
    Route::post('/vendorManagement/updateVendorDetails', 'Admin\VendorManagementController@updateVendorDetails')->name('admin.updateVendorDetails');
    Route::get('/vendorManagement/addSubtractBalance/{vendorID}', 'Admin\VendorManagementController@addSubtractBalance')->name('admin.vendor.addSubtractBalance');
    Route::post('/vendorManagement/updateVendorBalance', 'Admin\VendorManagementController@updateVendorBalance')->name('admin.updateVendorBalance');
    Route::get('/vendorManagement/emailToVendor/{vendorID}', 'Admin\VendorManagementController@emailToVendor')->name('admin.emailToVendor');
    Route::post('/vendorManagement/sendEmailToVendor', 'Admin\VendorManagementController@sendEmailToVendor')->name('admin.sendEmailToVendor');







});
//***********************Routes without any auth needed ****************/
Route::get('/shop/{category?}/{subcategory?}', 'SearchController@search')->name('user.search');
Route::get('/bestsellers', 'User\PagesController@bestsellers')->name('user.bestsellers');
Route::get('/product/{slug}/{id}', 'ProductController@show')->name('user.product.details');
Route::get('/shop_page/{vendor}/{category?}/{subcategory?}', 'Vendor\VendorController@shoppage')->name('vendor.shoppage');
Route::post('review/submit', 'ProductController@reviewsubmit')->name('user.review.submit');
Route::post('/cart/getproductdetails', 'CartController@getproductdetails')->name('user.cart.getproductdetails');
Route::get('/cart/getcart', 'CartController@getcart')->name('cart.getcart');
Route::get('/cart/clearcart', 'CartController@clearcart')->name('cart.clearcart');
Route::get('/cart/remove', 'CartController@remove')->name('cart.remove');
Route::get('/cart', 'CartController@index')->name('cart.index');
Route::post('/stock/check', 'CartController@stockcheck')->name('stock.check');
Route::post('/cart/update', 'CartController@update')->name('cart.update');
Route::get('/cart/getTotal', 'CartController@getTotal')->name('cart.getTotal');
Route::get('/{id}/productratings', 'ProductController@productratings')->name('user.productratings');
Route::get('/productratings/{vendor}', 'ProductController@vendorProductratings')->name('vendor.productratings');
Route::get('/{id}/avgrating', 'ProductController@avgrating')->name('user.avgrating');
Route::get('/shop_page/{vendor}/{category?}/{subcategory?}', 'Vendor\VendorController@shoppage')->name('vendor.shoppage');
Route::get('/shopPage/{id}/reviews', 'Vendor\VendorController@viewReviews')->name('vendor.reviews');
Route::get('/contact', 'User\PagesController@contact')->name('user.contact');
Route::post('/contact/mail', 'User\PagesController@contactMail')->name('user.contactMail');

//*************User routes************* */
Route::get('/home', 'User\PagesController@home')->name('user.home')->middleware('emailVerification', 'bannedUser');

//dont need to send any parameters to the middleware
Route::group(['middleware' => 'guest'], function() {
    Route::get('/login', 'User\LoginController@login')->name('login');
    Route::post('/authenticate', 'User\LoginController@authenticate')->name('user.authenticate');

    Route::get('/register', 'User\RegController@showregform')->name('user.showregform');
    Route::post('/register', 'User\RegController@register')->name('user.register');

    // Password Reset Routes
    Route::get('/showEmailForm', 'User\ForgotPasswordController@showEmailForm')->name('user.showEmailForm');
    Route::post('/sendResetPassMail', 'User\ForgotPasswordController@sendResetPassMail')->name('user.sendResetPassMail');
    Route::get('/reset/{code}', 'User\ForgotPasswordController@resetPasswordForm')->name('user.resetPasswordForm');
    Route::post('/resetPassword', 'User\ForgotPasswordController@resetPassword')->name('user.resetPassword');
});

Route::group(['middleware' => 'auth'], function() {
    Route::get('/logout/{id?}', 'User\LoginController@logout')->name('user.logout');


    // Verification Routes...
    Route::get('/showEmailVerForm', 'User\VerificationController@showEmailVerForm')->name('user.showEmailVerForm');
    Route::post('/checkEmailVerification', 'User\VerificationController@emailVerification')->name('user.checkEmailVerification');
    Route::post('/sendVcode', 'User\VerificationController@sendVcode')->name('user.sendVcode');


    // Profile routes
    Route::get('/profile', 'User\ProfileController@profile')->name('user.profile')->middleware('emailVerification','bannedUser');
    Route::post('/infoupdate', 'User\ProfileController@infoupdate')->name('user.information.update');
    Route::get('/changepassword', 'User\ProfileController@changepassword')->name('user.changepassword')->middleware('emailVerification', 'bannedUser');
    Route::post('/update/password', 'User\ProfileController@updatePassword')->name('user.updatePassword');

    // Checkout Routes
	Route::get('/checkout', 'User\CheckoutController@index')->name('user.checkout.index')->middleware('emailVerification', 'bannedUser');
	Route::post('/coupon/apply', 'User\CheckoutController@applycoupon')->name('user.checkout.applycoupon');
	Route::post('/placeorder', 'User\CheckoutController@placeorder')->name('user.checkout.placeorder');
	Route::get('/checkout/success', 'User\CheckoutController@success')->name('user.checkout.success')->middleware('emailVerification', 'bannedUser');


	// favorit
	Route::get('/wishlist', 'User\ProfileController@wishlist')->name('user.wishlist')->middleware('emailVerification', 'bannedUser');
    Route::post('/favorit', 'ProductController@favorit')->name('user.favorit');
    Route::get('/product/{slug}/{id}/hearts', 'ProductController@showHearts')->name('user.product.detailsHearts')->middleware('emailVerification', 'bannedUser');

    // orders
    Route::get('/orders', 'User\ProfileController@orders')->name('user.orders')->middleware('emailVerification', 'bannedUser');
    Route::get('/{orderid}/orderdetails', 'User\ProfileController@orderdetails')->name('user.orderdetails')->middleware('emailVerification','bannedUser');
    Route::post('/complain', 'User\ProfileController@complain')->name('user.complain');
    Route::post('/refund', 'User\ProfileController@refund')->name('user.refund');

});

