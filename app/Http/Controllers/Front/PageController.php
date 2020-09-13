<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\front\Post;
use App\Model\front\Postmeta;
use DB;



class PageController extends Controller
{
    public function productView($id)
    {
		$product=Post::where('post_type','product')
        ->where('ID',$id)
		->first();
		
    	return view('front.product-view',compact('product'));
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
		$categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('terms.status',1)
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get();
        // product 
        $products=Post::where('post_type','product')
        ->where('post_status','publish')
        ->get();
	    return view('front.Categories',compact('categories','products'));
	}
	public function categoryProduct($id)
	{
		$categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('terms.status',1)
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get();

        // product 
        $products=Post::where('post_type','product')
        ->where('post_status','publish')
   
        ->get();
	    return view('front.Categories',compact('categories','products'));
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
		$categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('terms.status',1)
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get();
        // product 
        $products=Post::where('post_type','product')
        ->where('post_status','publish')
        ->get();
	    return view('front.brands',compact('categories','products'));
	}
	public function faq()
	{
	    return view('front.faq');
	}
	public function profile()
	{
	    return view('front.user-profile');
	}
	public function privacy()
	{
	    return view('front.privacy');
	}
	public function termsconditions()
	{
	    return view('front.terms&conditions');
	}
	public function about()
	{
	    return view('front.about');
	}
	public function returnPolicy()
	{
	    return view('front.return-policy');
	}
	public function settings()
	{
	    return view('front.settings');
	}
	public function customerSupport()
	{
	    return view('front.customerSupport');
	}
}
