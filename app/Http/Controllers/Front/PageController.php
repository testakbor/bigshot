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
	public function OrderSuccess()
	{
	    return view('front.order-success');
	}
	public function Categories()
	{
	    return view('front.Categories');
	}
	public function wishlist()
	{
	    return view('front.wishlist');
	}
	public function DailyLoginBonus()
	{
	    return view('front.daily-login-bonus');
	}
	public function rewards()
	{
	    return view('front.rewards');
	}
	public function cash()
	{
	    return view('front.cash');
	}
	public function pickupTab()
	{
	    return view('front.picku-tab');
	}
	public function recent()
	{
	    return view('front.recent');
	}
	public function brands()
	{
	    return view('front.brands');
	}
	public function faq()
	{
	    return view('front.faq');
	}
}
