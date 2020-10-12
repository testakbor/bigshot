<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;
use App\Model\front\Post;
use App\Model\front\Order_item;
use App\Model\front\Postmeta;


class QuickReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function index()
    {
        $extraInfo=array(
            'title'=>"Quick Report",
            'page'=>'quickReport'
        );
        $today_pending_order=DB::table('posts')
        ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>date('Y-m-d')])
        ->count(); 
        $day_one_pending_order=DB::table('posts')
        ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>date('Y-m-01')])
        ->count();  
        $day_two_pending_order=DB::table('posts')
        ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>date('Y-m-02')])
        ->count();
        $day_three_pending_order=DB::table('posts')
        ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>date('Y-m-03')])
        ->count();
        $day_four_pending_order=DB::table('posts')
        ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>date('Y-m-04')])
        ->count();
        $all_pending_order=DB::table('posts')
        ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold'])
        ->count();  
        $product_total_stock=DB::table('posts')
        ->where(['post_type'=>'product','meta_key'=>'qty'])
        ->join('postmeta','posts.ID','=','postmeta.post_id')
        ->sum('meta_value');  
        $product=Post::where('post_type','product')->get();   
        $delivered_qty=DB::table('posts')->where(['post_type'=>'shop_order','post_status'=>'Delivered'])->count();     
        return view('admin.quickReport.index',
        compact('today_pending_order',
        'day_one_pending_order',
        'day_two_pending_order',
        'day_three_pending_order',
        'day_four_pending_order',
        'all_pending_order',
        'product_total_stock',
        'product',
        'delivered_qty'
        ))->with($extraInfo);
    }
    public function manStock()
    {
      $data=DB::table('term_relationships')
		->leftjoin('posts','term_relationships.object_id','=','posts.ID')
		->where('term_taxonomy_id',1)
		->where('posts.post_type','product')
      ->paginate(20);
    
       return view('admin.quickReport.man_stock');
    }
    public function womenStock(Request $request)
    {
       $extraInfo=array(
            'title'=>"Category Wise Stock",
            'page'=>'Report'
        );
      $categories=DB::table('term_taxonomy')
      ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
      ->where('term_taxonomy.taxonomy','product_cat')
      ->select('term_taxonomy.*','terms.name','terms.status')
      ->orderBy('term_taxonomy.term_taxonomy_id','desc')
      ->get(); 
      if($request->cat_id==''){
        $cat_pro=[];
      }else{
         $cat_pro=DB::table('term_relationships')
         ->leftjoin('posts','term_relationships.object_id','=','posts.ID')
         ->where('term_taxonomy_id',$request->cat_id)
         ->where('posts.post_type','product')
         ->get();
      }
       return view('admin.quickReport.women_stock',compact('categories','cat_pro'))->with($extraInfo);
    }
    public function salesReport(Request $request)
    {
        $extraInfo=array(
            'title'=>"Category Wise Stock",
            'page'=>'Report'
        );
       $start=$request->start;
       $end=$request->end;
       $order_item=DB::table('posts')
       ->where('post_type','shop_order')
       ->where('post_status','delivered')
       ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($start)), date('Y-m-d 23:59:59', strtotime($end))])
       ->get();
       return view('admin.quickReport.sales_report',compact('order_item'))->with($extraInfo);
    }
    public function deliveryReport(Request $request)
    {
        $extraInfo=array(
            'title'=>"Category Wise Stock",
            'page'=>'Report'
        );
      $start=$request->start;
      $end=$request->end;
      $order_item=DB::table('posts')
      ->where('post_type','shop_order')
      ->where('post_status','delivered')
      ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($start)), date('Y-m-d 23:59:59', strtotime($end))])
      ->get();
       return view('admin.quickReport.delivery_report',compact('order_item'));
    }
    public function rejectItem()
    {
        $extraInfo=array(
            'title'=>"Reject Item List",
            'page'=>'Report'
        );
     $data=Post::where(['post_type'=>'product','meta_key'=>'product_status'])
      ->join('postmeta','posts.ID','=','postmeta.post_id')
     ->get();
       return view('admin.quickReport.reject_item',compact('data'))->with($extraInfo);
    }

    public function rejectItemRemove($id){
      $meta_info=Postmeta::where('meta_key','qty')
      ->where('post_id',$id)
      ->first();
      $reject_qty=Postmeta::where('meta_key','reject_qty')
      ->where('post_id',$id)
      ->first();
      $newQty=$meta_info->meta_value+$reject_qty->meta_value;
      $relationShips=DB::table('postmeta')->where('meta_key','qty')
      ->where('post_id',$id)
      ->update(['meta_value'=>$newQty]);
      DB::table('postmeta')->where('meta_key','product_status')
      ->where('post_id',$id)
      ->delete();
        DB::table('postmeta')->where('meta_key','reject_date')
      ->where('post_id',$id)
      ->delete();
       DB::table('postmeta')->where('meta_key','reject_qty')
      ->where('post_id',$id)
      ->delete();
      session()->flash("success","Quantity has been added Successfully");
      return back();
    }

    public function rejectItemSearch(Request $request){
        $extraInfo=array(
            'title'=>"Reject Item List",
            'page'=>'Report'
        );
      $start=$request->start;
      $end=$request->end;
       $data=Post::where(['post_type'=>'product','meta_key'=>'reject_date'])
      ->join('postmeta','posts.ID','=','postmeta.post_id')
      ->whereBetween('meta_value',[$start,$end])
     ->get();
      return view('admin.quickReport.reject_item_search',compact('data'))->with($extraInfo);
    }



    public function bestSelling()
    {
        $extraInfo=array(
            'title'=>"Best Sellings Items List",
            'page'=>'Report'
        );
        $start=date('Y-m-01');
        $end=date('Y-m-t');
       $order=DB::SELECT("SELECT product_id,order_items.order_id,order_item_name,SUM(meta_value) as total_qty 
       FROM order_itemmeta JOIN order_items ON order_itemmeta.order_item_id=order_items.order_item_id 
       where meta_key='_qty' 
       and order_date Between '$start' and '$end' 
       GROUP by product_id ORDER by total_qty DESC");
       return view('admin.quickReport.best_selling',compact('order'))->with($extraInfo);;
    }
    public function bestSellingSearch(Request $request){
        $extraInfo=array(
            'title'=>"Best Sellings Items List",
            'page'=>'Report'
        );
        $start=$request->start;;
        $end=$request->end;
       $order=DB::SELECT("SELECT product_id,order_items.order_id,order_item_name,SUM(meta_value) as total_qty 
       FROM order_itemmeta JOIN order_items ON order_itemmeta.order_item_id=order_items.order_item_id 
       where meta_key='_qty' 
       and order_date Between '$start' and '$end' 
       GROUP by product_id ORDER by total_qty DESC");
       return view('admin.quickReport.best_selling',compact('order'))->with($extraInfo);;
    }
    public function cancellationItems()
    {
       return view('admin.quickReport.cancellation_items');
    }
    public function soldoutStock()
    {
       $extraInfo=array(
            'title'=>"Sold Out Stock List",
            'page'=>'Report'
        );
       $product=Post::where('post_type','product')->get();
       return view('admin.quickReport.soldout_stock',compact('product'))->with($extraInfo);
    }
    public function bestCustomer(Request $request)
    {
      $extraInfo=array(
            'title'=>"Best Customer List",
            'page'=>'Report'
        );
      $start=date('Y-m-01'); 
      $end=date('Y-m-t'); 
      $data=DB::SELECT("SELECT order_id,customer_id,SUM(meta_value) as total_qty 
      FROM order_itemmeta 
      where meta_key='_qty' and order_date Between '$start' and '$end' 
      GROUP by customer_id ORDER by total_qty DESC");
      return view('admin.quickReport.best_customer',compact('data'))->with($extraInfo);
    }

    public function bestCustomerSearch(Request $request){
      $extraInfo=array(
            'title'=>"Best Customer List",
            'page'=>'Report'
      );
      $start=$request->start; 
      $end=$request->end; 
      $data=DB::SELECT("SELECT order_id,customer_id,SUM(meta_value) as total_qty 
      FROM order_itemmeta 
      where meta_key='_qty' and order_date Between '$start' and '$end' 
      GROUP by customer_id ORDER by total_qty DESC");
      return view('admin.quickReport.best_customer_search',compact('data'))->with($extraInfo);
    }

    public function grossProfit()
    {
         $extraInfo=array(
            'title'=>"Best Customer List",
            'page'=>'Report'
      );
      $year=date('Y');
      $order=Post::where('post_type','shop_order')->whereYear('post_date',$year)->get();
      return view('admin.quickReport.gross_profit',compact('order'))->with($extraInfo);
    }
  //gross profit report show
    public function grossProfitShow(Request $request)
    {
        $extraInfo=array(
            'title'=>"Best Customer List",
            'page'=>'Report'
      );
       $start=$request->start;
       $end=$request->end;
       $order=Post::where(['post_type'=>'shop_order'])->whereBetween('post_date',[$start,$end])->get();
       return view('admin.quickReport.gross_profit_show',compact('order','start','end'))->with($extraInfo);
    }

    public function grossProfitSummary(){
       $extraInfo=array(
            'title'=>"Best Customer List",
            'page'=>'Report'
      );
      $year=date('Y');
      $order=Post::where('post_type','shop_order')->whereYear('post_date',$year)->get();
      return view('admin.quickReport.gross_profit_summary',compact('order'))->with($extraInfo);
    }
}
