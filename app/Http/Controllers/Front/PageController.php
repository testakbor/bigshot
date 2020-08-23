<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function productView()
    {
    	return view('front.product-view');
	}

    public function cart()
    {
    	return view('front.cart');
	}
	public function OrderHistory()
	{
	    return view('front.order-history');
	}
	public function Categories()
	{
	    return view('front.Categories');
	}public function wishlist()
	{
	    return view('front.wishlist');
	}
}
