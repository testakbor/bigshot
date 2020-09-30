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
    return view('front.home');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

    Route::group(['namespace'=>'Front'],function(){
        Route::get('/', 'HomeController@index')->name('home');
        Route::get('/product-page/{id}','PageController@productView')->name('product-page');
        Route::get('/pickup-tab','PageController@pickupTab')->name('pickup.tab');
        Route::get('/recent','PageController@recent')->name('recent');
        Route::get('/brands','PageController@brands')->name('brands');
        Route::get('/popular','PageController@popular')->name('popular');
        Route::get('/categories/product/{id}','PageController@categoryProduct')->name('category.product');
        Route::get('/cart','CartController@cart')->name('cart');
        Route::get('/profile','PageController@profile')->name('profile');

        Route::get('/wishlist','PageController@wishlist')->middleware('auth');
        Route::get('/wishlist/product/{id}','PageController@wishlistProduct')->middleware('auth');
        Route::get('/wishlist/delete/{id}','PageController@wishlistDelete')->middleware('auth')->name('wishlist_delete');

        Route::get('/order-history','PageController@OrderHistory')->name('order.history');
        Route::get('/order-success','PageController@OrderSuccess')->name('order.success');
        Route::get('/daily-login-bonus','PageController@DailyLoginBonus')->name('daily.bonus');
        Route::get('/rewards','PageController@rewards')->name('rewards');
        Route::get('/cash','PageController@cash')->name('cash');
        Route::get('/faq','PageController@faq')->name('faq');
        Route::get('/privacy','PageController@privacy')->name('privacy');
        Route::get('/terms&conditions','PageController@termsconditions')->name('terms.conditions');
        Route::get('/about','PageController@about')->name('about');
        Route::get('/return-policy','PageController@returnPolicy')->name('return.policy');
        Route::get('/settings','PageController@settings')->name('settings');
        Route::get('/customer-support','PageController@customerSupport')->name('customer.support');


        Route::post('/addCart','CartController@addCart')->name('addCart');
        Route::post('/checkout','CartController@checkout')->name('checkout');
        Route::post('/cart_update','CartController@update')->name('cart.update');
        Route::get('/remove/{id}','CartController@remove')->name('remove');     
    });

    Route::group(['namespace'=>'User'],function(){
        Route::resource('/order-list','OrderController')->middleware('auth');
        Route::resource('user/profile','UserController');
        Route::get('user/profile/chnage/{id}','PageController@passwordEdit')->name('password.edit');
        Route::post('user/profile/chnage/{id}','PageController@passwordUpdate')->name('password.update');
        Route::post('quiry','QuiryController@generalQuiry')->name('genarelQuiry');
        Route::get('/customer/order/edit/{id}','OrderController@edit')->name('customer_ordere_edit');
        Route::get('/customer/order/cancel/{id}','OrderController@cancelOrder')->name('customer_ordere_cancel');
    }); 
       
    Route::group(['namespace'=>'Search'],function(){
        Route::post('/search','SearchController@nSearch')->name('search');
       
    });

    Route::group(['namespace'=>'Admin'],function(){
       
        Route::post('search/pending/order','OrderController@search_pending_order')->name('s_pending_order');
        Route::GET('admin-login','Auth\LoginController@showLoginForm')->name('admin.login');
        Route::POST('admin-login','Auth\LoginController@login');
        Route::get('admin/home','HomeController@index')->name('admin.home');
        Route::resource('admin/category','CategoryController');
        Route::resource('admin/tag','TagController');
        Route::resource('admin/brand','BrandController');
        Route::resource('admin/attribute','AttributeController');
        Route::resource('admin/product','ProductController');
        Route::resource('admin/order','OrderController');
        Route::get('admin/pendingOrder','OrderController@pendingOrder')->name('order.pendingOrder');

        Route::get('admin/todayPendingOrder','OrderController@todayPendingOrder')->name('todayPendingOrder');
        Route::get('admin/pendingOrderByDate/{day}','OrderController@todayPendingOrder')->name('pendingOrderByDate');

        Route::get('admin/pendingOrder/processing','OrderController@processing')->name('order.processing');
        Route::get('admin/pendingOrder/dispat','OrderController@dispat')->name('order.dispat');
        Route::get('admin/pendingOrder/print','OrderController@print')->name('pendingOrder.print');
        Route::get('admin/pendingOrder/cancelled','OrderController@cancelled')->name('order.cancelled');
        Route::get('admin/sendparcel','OrderController@sendParcel')->name('order.sendParcel');
        Route::get('admin/allStatus','OrderController@allStatus')->name('order.allStatus');
        Route::get('admin/deliveryInvoice','OrderController@deliveryInvoice')->name('order.deliveryInvoice');
        Route::get('admin/reject','OrderController@reject')->name('order.reject');
        Route::get('admin/stock','OrderController@stock')->name('order.stock');
        Route::get('admin/stock/lower','OrderController@lowerStock')->name('order.stock.lower');
        Route::get('admin/stock/list/old','OrderController@oldStock')->name('order.stock.old');
        Route::get('admin/grossProfit','OrderController@grossProfit')->name('order.grossProfit');
        Route::post('admin/grossProfit/report','QuickReportController@grossProfitShow')->name('order.grossProfit.report');
        Route::resource('admin/customer','CustomerController');
        Route::get('admin/attributeValue/{id}','AttributeController@attributeValue')->name('attribute.attributeValue');
        Route::POST('admin/attributeValueSave','AttributeController@attributeValueSave')->name('attributeValue.store');
        Route::get('admin/attributeValueEdit/{id}','AttributeController@attributeValueEdit')->name('attributeValue.edit');
        Route::PATCH('admin/attributeValueUpdate/{id}','AttributeController@attributeValueUpdate')->name('attributeValue.update');
        Route::get('admin/product/arttibuteValue/{id}','ProductController@attributeValue')->name('product.arttibuteValue');
        Route::POST('admin/product/store','ProductController@store')->name('product.store');
        // Route::get('admin/dispat','PageController@dispat')->name('dispat');
        Route::get('admin/quickReport','QuickReportController@index')->name('quickReport');
        Route::post('admin/order/status/update','OrderController@update')->name('update.order.status');
        Route::post('admin/order/update/qty', 'OrderController@updateOrderQty')->name('update.order.quantity');
        Route::get('admin/quickReport/man_stock','QuickReportController@manStock')->name('man.stock');
        Route::get('admin/quickReport/women_stock','QuickReportController@womenStock')->name('women.stock');
        Route::get('admin/quickReport/sales_report','QuickReportController@salesReport')
        ->name('sales.report');
        Route::get('admin/quickReport/delivery_report','QuickReportController@deliveryReport')->name('delivery.report');
        Route::get('admin/quickReport/reject_item','QuickReportController@rejectItem')->name('reject.item');
        Route::get('admin/quickReport/best_selling_items','QuickReportController@bestSelling')->name('best.selling');
        Route::get('admin/quickReport/cancellation_items','QuickReportController@cancellationItems')->name('cancellation.items');
        Route::get('admin/quickReport/soldout_stock','QuickReportController@soldoutStock')->name('sold.stock');
        Route::get('admin/quickReport/best_customer','QuickReportController@bestCustomer')->name('best.customer');
        Route::get('admin/quickReport/gross_profit','QuickReportController@grossProfit')->name('gross.profit');
        Route::get('user/{id}','CustomerController@edit');
        Route::post('user/update','CustomerController@update')->name('user_update');
        //banner image route for home page
        Route::resource('/banner','BannerController');
        //pending order route
        Route::get('pending/order/print/{id}','OrderController@pending_order_print')->name('pending_order_print');
        Route::get('pending/order/processing/{id}','OrderController@pending_order_processing')->name('pending_order_processing');
        Route::get('pending/order/cancel/{id}','OrderController@pending_order_cancel')->name('pending_order_cancel');
        Route::get('pending/order/edit/{id}','OrderController@pending_order_edit')->name('pending_order_edit');
        //pending order route
        //send parcel print route
         Route::post('send/parcel/print','OrderController@sendParcelPrint')->name('parcel_print');
        //send parcel print route

        //download shipping address
        Route::get('download/shipping/address/{id}','OrderController@downloadShippingAddress')->name('download.shipping.address');

        //excel dispatch
        Route::get('excel/dispatch', 'OrderController@excelDispatch')->name('order.excel.dispatch');
        //delivery invoice
        Route::get('delivery/invoice', 'OrderController@deliveryInvoiceOrder')->name('order.delivery.invoice');
        Route::get('delivered/order', 'OrderController@deliveredOrder')->name('order.deliver');
        Route::get('cancelled/order', 'OrderController@cancelledOrder')->name('order.cancelled');
        Route::get('processing/order/print/{id}', 'OrderController@processingOrderPrint')->name('order.processing.print');
        Route::get('processing/order/edit/{id}', 'OrderController@processingOrderEdit')->name('order.processing.edit');
        Route::get('processing/order/cancel/{id}', 'OrderController@processingOrderCancel')->name('order.processing.cancel');
        Route::post('processing/order/date/wise', 'OrderController@processingOrderdatewise')->name('process.order.date.wise');
        Route::post('processing/order/update', 'OrderController@processingOrderUpdate')->name('process.order.update');

        Route::get('dispatch/order/edit/{id}', 'OrderController@dispatchOrderEdit')->name('order.dispatch.edit');
        Route::get('dispatch/order/delivered/{id}', 'OrderController@dispatchOrderDelivered')->name('order.dispatch.delivered');
        Route::get('dispatch/order/edit/{id}', 'OrderController@dispatchOrderEdit')->name('order.dispatch.edit');

    });

