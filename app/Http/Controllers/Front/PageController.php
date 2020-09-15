<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\front\Post;
use App\Model\front\Postmeta;
use DB;
use Auth;



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
		$data=DB::SELECT("SELECT * from `term_relationships` 
		where term_taxonomy_id=$id and object_id in(select ID from `posts` 
		where `post_type`='product' 
		and post_status='publish' and ID=term_relationships.object_id)");
		
	    return view('front.Categories',compact('data'));
	}
	public function wishlist()
	{
		$wishProduct=DB::table('wishlist')
		->leftjoin('postmeta', 'postmeta.post_id', '=', 'wishlist.product_id')
		->where('user_id',auth()->user()->id)
		->groupBy('wishlist.product_id')
		->orderBy('wishlist.id','DESC')
		->paginate(3);
	    return view('front.wishlist',compact('wishProduct'));
	}
	public function wishlistProduct(Request $request)
	{
		DB::table('wishlist')
		->where('product_id',$request->id)
		->where('user_id',Auth::user()->id)
		->delete();
	    $wishlist = array(
	    	'product_id' => $request->id,
	    	'user_id' => Auth::user()->id,
	    );
	    DB::table('wishlist')->insertGetId($wishlist);


	    return back()->with('status','Product added in wishlist');
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
		$products=Post::where('post_type','product')
		->where('post_status','publish')
		->orderBy('ID','DESC')
		->limit(20)->get();
	    return view('front.recent',compact('products'));
	}
	public function brands()
	{
		  $extraInfo=array(
            'title'=>"Brands",
            'page'=>'brands'
        );

		$categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('terms.status',1)
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get();
        $products=Post::where('post_type','product')
        ->where('post_status','publish')
        ->get();
	    return view('front.brands',compact('categories','products'))->with($extraInfo);
	}
	public function faq()
	{
	    return view('front.faq');
	}
	public function profile()
	{
		$wishProduct=DB::table('wishlist')
		->leftjoin('postmeta', 'postmeta.post_id', '=', 'wishlist.product_id')
		->where('user_id',auth()->user()->id)
		->groupBy('wishlist.product_id')
		->orderBy('wishlist.id','DESC')
		->paginate(3);
	    return view('front.user-profile',compact('wishProduct'));
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

	//delete wishlist
	public function wishlistDelete($id){
	  $id=base64_decode($id);
	  $data=DB::table('wishlist')
	  ->where('product_id',$id)
	  ->where('user_id',auth()->user()->id)
	  ->delete();
	  return back()->with('status','Product delete from wishlist');
	}
}
