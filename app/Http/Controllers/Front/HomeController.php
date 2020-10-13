<?php

namespace App\Http\Controllers\Front;

use DB;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Model\front\Post;
use App\Model\front\Postmeta;

class HomeController extends Controller
{
    public function index(Request $request){
        // product 
        $products  = Post::where('post_type','product')
        ->where('post_status','publish')
        ->orderBy('ID','DESC')
        ->paginate(10);
        if ($request->ajax()) {
    		$view = view('front.product_ajax_data',compact('products'))->render();
            return response()->json(['html'=>$view]);
        }
    	return view('front.home',compact('products'));
    }




}
