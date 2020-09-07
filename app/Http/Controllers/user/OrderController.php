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
        ->first();
        // dd($invoice);
        $orders=Post::where('ID',$invoice->post_id)->get();    
        return view('front.order-list',compact('invoice'),compact('orders'));
    }
}
