<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\front\Post;
use App\Model\front\Postmeta;
use App\Model\front\Order_item;
use DB;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(){
        $extraInfo=array(
            'title'=>"Home",
            'page'=>'home'
        );
        $total_sales=DB::table('posts')
        ->where('post_type','shop_order')
        ->where('post_status','Completed')
        ->whereBetween('post_date',[date('Y-m-01'),date('Y-m-t')])
        ->count();
        $total_delivered = DB::table('posts')
        ->where('post_type', 'shop_order')
        ->where('post_status', 'Delivered')
        ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
        ->count();
        $total_cancelled = DB::table('posts')
        ->where('post_type', 'shop_order')
        ->where('post_status', 'Cancelled')
        ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
        ->count();
        $sales_order =Post::where('post_type','shop_order')
        ->where('post_status','Completed')
        ->whereBetween('post_date',[date('Y-m-01'), date('Y-m-t')])
        ->select('ID')
        ->get();
        dd($sales_order);
        return view("admin.home",compact('total_sales','total_delivered','total_cancelled'))->with($extraInfo);
    }
}
 