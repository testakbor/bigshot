<?php

namespace App\Http\Controllers\Search;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\front\Post;



class SearchController extends Controller
{

    public function nSearch(Request $request)
    {
    $q = $request->q;
    $products=Post::where('post_type','product')
    ->where('post_status','publish')
    ->where('post_title', 'like', '%' .$q. '%')
    ->get();
    return view('front.search',compact('products'));
    }
}
