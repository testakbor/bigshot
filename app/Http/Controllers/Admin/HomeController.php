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
 
    
    public function index(Request $request){
        $start=$request->start;
        $end = $request->end;
        $extraInfo=array(
            'title'=>"Home",
            'page'=>'home'
        );
        $total_sales=DB::table('posts')
        ->where('post_type','shop_order')
        ->where('post_status','on-hold')
        ->whereBetween('post_date',[date('Y-m-01'),date('Y-m-t')])
        ->count();
        $total_delivered = DB::table('posts')
        ->where('post_type', 'shop_order')
        ->where('post_status', 'delivered')
        ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
        ->count();
        $total_cancelled = DB::table('posts')
        ->where('post_type', 'shop_order')
        ->where('post_status', 'cancelled')
        ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
        ->count();
        $total_sale_amount=Post::where('post_type','shop_order')
        ->where('post_status','delivered')
        ->where('meta_key','_line_subtotal')
        ->whereBetween('post_date',[date('Y-m-01'), date('Y-m-t')])
        ->join('order_itemmeta','posts.ID','=', 'order_itemmeta.order_id')
        ->groupBy('order_id')
        ->sum('meta_value');
        if($start=='' && $end==''){
            $total_sale_amount_date_wise = Post::where('post_type', 'shop_order')
                ->where('post_status', 'delivered')
                ->where('meta_key', '_line_subtotal')
                ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
                ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
                ->groupBy('order_id')
                ->sum('meta_value');
            $total_delivery_amount_date_wise = Post::where('post_type', 'shop_order')
                ->where('post_status', 'delivered')
                ->where('meta_key', '_line_subtotal')
                ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
                ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
                ->groupBy('order_id')
                ->sum('meta_value');
            $total_cancel_amount_date_wise = Post::where('post_type', 'shop_order')
                ->where('post_status', 'cancelled')
                ->where('meta_key', '_line_subtotal')
                ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
                ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
                ->groupBy('order_id')
                ->sum('meta_value');
            }else{
            $total_sale_amount_date_wise= Post::where('post_type', 'shop_order')
            ->where('post_status', 'delivered')
            ->where('meta_key', '_line_subtotal')
            ->whereBetween('post_date', [$start,$end])
            ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
            ->groupBy('order_id')
            ->sum('meta_value');
            $total_delivery_amount_date_wise = Post::where('post_type', 'shop_order')
            ->where('post_status', 'delivered')
            ->where('meta_key', '_line_subtotal')
            ->whereBetween('post_date', [$start, $end])
            ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
            ->groupBy('order_id')
            ->sum('meta_value');
            $total_cancel_amount_date_wise = Post::where('post_type', 'shop_order')
            ->where('post_status', 'cancelled')
            ->where('meta_key', '_line_subtotal')
            ->whereBetween('post_date', [$start, $end])
            ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
            ->groupBy('order_id')
            ->sum('meta_value');
            }
        return view("admin.home",compact('total_sales','total_delivered','total_cancelled','total_sale_amount','total_sale_amount_date_wise','total_delivery_amount_date_wise','total_cancel_amount_date_wise','start','end'))->with($extraInfo);
    }
}
 