<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Front\Post;
use App\Model\Front\Postmeta;

use Auth;
class OrderController extends Controller
{
    public function OrderList()
    {
        $invoice = Postmeta::where('meta_key','_customer_user')
        ->where('meta_value', Auth::user()->id)
        ->get();
        // dd($invoice);
        $orders=Post::where('posts.post_type','shop_order')
        ->paginate(500); 
        return view('front.order-list',compact('invoice'),compact('orders'));
    }
}
