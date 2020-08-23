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
    }
);


Route::group(['namespace'=>'Admin'],function(){
    Route::GET('admin-login','Auth\LoginController@showLoginForm')->name('admin.login');
    Route::POST('admin-login','Auth\LoginController@login');
    Route::get('admin/home','HomeController@index')->name('admin.home');

    Route::resource('admin/category','CategoryController');
    Route::resource('admin/tag','TagController');
    Route::resource('admin/brand','BrandController');
    Route::resource('admin/attribute','AttributeController');
    Route::resource('admin/product','ProductController');

    Route::get('admin/attributeValue/{id}','AttributeController@attributeValue')->name('attribute.attributeValue');
    Route::POST('admin/attributeValueSave','AttributeController@attributeValueSave')->name('attributeValue.store');
    Route::get('admin/attributeValueEdit/{id}','AttributeController@attributeValueEdit')->name('attributeValue.edit');
    Route::PATCH('admin/attributeValueUpdate/{id}','AttributeController@attributeValueUpdate')->name('attributeValue.update');

    Route::get('admin/product/arttibuteValue/{id}','ProductController@attributeValue')->name('product.arttibuteValue');
    Route::POST('admin/product/store','ProductController@store')->name('product.store');
});
Route::get('/product-page','Front\PageController@productView')->name('product-page');
Route::get('/Categories','Front\PageController@Categories')->name('Categories');
Route::get('/cart','Front\PageController@cart')->name('cart');
Route::get('/wishlist','Front\PageController@wishlist')->name('wishlist');
Route::get('/order-history','Front\PageController@OrderHistory')->name('order.history');
Route::get('/daily-login-bonus','Front\PageController@DailyLoginBonus')->name('daily.bonus');
Route::get('/rewards','Front\PageController@rewards')->name('rewards');
Route::get('/cash','Front\PageController@cash')->name('cash');
