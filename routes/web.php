<?php

use Illuminate\Support\Facades\Route;

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

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

    Route::group(['namespace'=>'Front'],function(){
        Route::get('/', 'HomeController@index')->name('home');
        Route::get('/product-page/{id}','PageController@productView')->name('product-page');
        Route::get('/pickup-tab','PageController@pickupTab')->name('pickup.tab');
        Route::get('/recent','PageController@recent')->name('recent');
        Route::get('/brands','PageController@brands')->name('brands');
        Route::get('/Categories','PageController@Categories')->name('Categories');
        Route::get('/cart','CartController@cart')->name('cart');
        Route::get('/profile','PageController@profile')->name('profile');
        Route::get('/wishlist','PageController@wishlist')->name('wishlist');
        Route::get('/order-history','PageController@OrderHistory')->name('order.history');
        Route::get('/order-success','PageController@OrderSuccess')->name('order.success');
        Route::get('/daily-login-bonus','PageController@DailyLoginBonus')->name('daily.bonus');
        Route::get('/rewards','PageController@rewards')->name('rewards');
        Route::get('/cash','PageController@cash')->name('cash');
        Route::get('/faq','PageController@faq')->name('faq');

        Route::post('/addCart','CartController@addCart')->name('addCart');
        Route::post('/checkout','CartController@checkout')->name('checkout');
    });

    Route::group(['namespace'=>'User'],function(){
        Route::get('/order-list','OrderController@OrderList')->name('order.list');
    });

    Route::group(['namespace'=>'Admin'],function(){
        Route::GET('admin-login','Auth\LoginController@showLoginForm')->name('admin.login');
        Route::POST('admin-login','Auth\LoginController@login');
        Route::get('admin/home','HomeController@index')->name('admin.home');

        Route::resource('admin/category','CategoryController');
        Route::resource('admin/tag','TagController');
        Route::resource('admin/brand','BrandController');
        Route::resource('admin/attribute','AttributeController');
        Route::resource('admin/product','ProductController');
        Route::resource('admin/order','OrderController');

        Route::get('admin/attributeValue/{id}','AttributeController@attributeValue')->name('attribute.attributeValue');
        Route::POST('admin/attributeValueSave','AttributeController@attributeValueSave')->name('attributeValue.store');
        Route::get('admin/attributeValueEdit/{id}','AttributeController@attributeValueEdit')->name('attributeValue.edit');
        Route::PATCH('admin/attributeValueUpdate/{id}','AttributeController@attributeValueUpdate')->name('attributeValue.update');

        Route::get('admin/product/arttibuteValue/{id}','ProductController@attributeValue')->name('product.arttibuteValue');
        Route::POST('admin/product/store','ProductController@store')->name('product.store');
    });

