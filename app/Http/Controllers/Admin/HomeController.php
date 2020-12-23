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
        ->where('post_status','on-hold')
        ->where('meta_key','_line_subtotal')
        ->whereBetween('post_date',[date('Y-m-01'), date('Y-m-t')])
        ->join('order_itemmeta','posts.ID','=', 'order_itemmeta.order_id')
        ->sum('meta_value');  

        $delivery_charge=Post::where('post_type','shop_order')
        ->where('post_status','on-hold')
        ->where('meta_key','delivery_charge')
        ->whereBetween('post_date',[date('Y-m-01'), date('Y-m-t')])
        ->join('order_itemmeta','posts.ID','=', 'order_itemmeta.order_id')
        ->select('meta_value as d_charge')
        ->groupBy('order_id')
        ->get();
        foreach($delivery_charge as $charge){
           $total_sale_amount=$total_sale_amount+$charge->d_charge;
        }
  
 
  
       

        if($start=='' && $end==''){
            $sale_charge=Post::where('post_type','shop_order')
            ->where('post_status','on-hold')
            ->where('meta_key','delivery_charge')
            ->whereBetween('post_date',[date('Y-m-01'), date('Y-m-t')])
            ->join('order_itemmeta','posts.ID','=', 'order_itemmeta.order_id')
            ->select('meta_value as d_charge')
            ->groupBy('order_id')
            ->get();
             $deliver_charge=Post::where('post_type','shop_order')
            ->where('post_status','delivered')
            ->where('meta_key','delivery_charge')
            ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
            ->join('order_itemmeta','posts.ID','=', 'order_itemmeta.order_id')
            ->select('meta_value as d_charge')
            ->groupBy('order_id')
            ->get();
             $cancel_charge=Post::where('post_type','shop_order')
            ->where('post_status','cancelled')
            ->where('meta_key','delivery_charge')
            ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
            ->join('order_itemmeta','posts.ID','=', 'order_itemmeta.order_id')
            ->select('meta_value as d_charge')
            ->groupBy('order_id')
            ->get();
            $total_sale_amount_date_wise=Post::where('post_type', 'shop_order')
                ->where('post_status', 'on-hold')
                ->where('meta_key', '_line_subtotal')
                ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
                ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
                ->sum('meta_value');

             foreach($sale_charge as $charge){
                 $total_sale_amount_date_wise=$total_sale_amount_date_wise+$charge->d_charge;
             }

            $total_delivery_amount_date_wise = Post::where('post_type', 'shop_order')
                ->where('post_status', 'delivered')
                ->where('meta_key', '_line_subtotal')
                 ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
                ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
                ->sum('meta_value');
                  foreach($deliver_charge as $charge){
                  $total_delivery_amount_date_wise=$total_delivery_amount_date_wise+$charge->d_charge;
             }
            $total_cancel_amount_date_wise = Post::where('post_type', 'shop_order')
                ->where('post_status', 'cancelled')
                ->where('meta_key', '_line_subtotal')
                 ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
                ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
                ->sum('meta_value');
               foreach($cancel_charge as $charge){
                  $total_cancel_amount_date_wise=$total_cancel_amount_date_wise+$charge->d_charge;
               }
            }else{
               $sale_charge=Post::where('post_type','shop_order')
            ->where('post_status','on-hold')
            ->where('meta_key','delivery_charge')
            ->whereBetween('post_date',[$start, $end])
            ->join('order_itemmeta','posts.ID','=', 'order_itemmeta.order_id')
            ->select('meta_value as ds_charge')
            ->groupBy('order_id')
            ->get();
             $deliver_charge=Post::where('post_type','shop_order')
            ->where('post_status','delivered')
            ->where('meta_key','delivery_charge')
             ->whereBetween('post_modified', [date('Y-m-d 00:00:00',strtotime($start)), date('Y-m-d 23:59:59',strtotime($end))])
            ->join('order_itemmeta','posts.ID','=','order_itemmeta.order_id')
            ->select('meta_value as dc_charge')
            ->groupBy('order_id')
            ->get();
             $cancel_charge=Post::where('post_type','shop_order')
            ->where('post_status','cancelled')
            ->where('meta_key','delivery_charge')
             ->whereBetween('post_modified', [date('Y-m-d 00:00:00',strtotime($start)), date('Y-m-d 23:59:59',strtotime($end))])
            ->join('order_itemmeta','posts.ID','=','order_itemmeta.order_id')
            ->select('meta_value as cd_charge')
            ->groupBy('order_id')
            ->get();
            $total_sale_amount_date_wise= Post::where('post_type', 'shop_order')
            ->where('post_status', 'on-hold')
            ->where('meta_key', '_line_subtotal')
            ->whereBetween('post_date', [$start,$end])
            ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
            ->sum('meta_value');
             foreach($sale_charge as $charge){
                 $total_sale_amount_date_wise=$total_sale_amount_date_wise+$charge->ds_charge;
             }
            $total_delivery_amount_date_wise = Post::where('post_type', 'shop_order')
            ->where('post_status', 'delivered')
            ->where('meta_key', '_line_subtotal')
             ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($start)), date('Y-m-d 23:59:59', strtotime($end))])
            ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
            ->sum('meta_value');

             foreach($deliver_charge as $charge){
                  $total_delivery_amount_date_wise=$total_delivery_amount_date_wise+$charge->dc_charge;
             }
            $total_cancel_amount_date_wise = Post::where('post_type', 'shop_order')
            ->where('post_status', 'cancelled')
            ->where('meta_key', '_line_subtotal')
            ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($start)), date('Y-m-d 23:59:59', strtotime($end))])
            ->join('order_itemmeta', 'posts.ID', '=', 'order_itemmeta.order_id')
            ->sum('meta_value');
             foreach($cancel_charge as $charge){
                  $total_cancel_amount_date_wise=$total_cancel_amount_date_wise+$charge->cd_charge;
             }
            }
           return view("admin.home",compact('total_sales','total_delivered','total_cancelled','total_sale_amount','total_sale_amount_date_wise','total_delivery_amount_date_wise','total_cancel_amount_date_wise','start','end'))->with($extraInfo);
        }
    }
 