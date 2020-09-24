<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;
use App\Model\front\Post;
use App\Model\front\Order_item;


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
       return view('admin.quickReport.women_stock',compact('categories','cat_pro'));
    }
    public function salesReport(Request $request)
    {
       $start=$request->start;
       $end=$request->end;
       $order_item=DB::table('posts')
       ->where('post_type','shop_order')
       ->where('post_status','Completed')
       ->whereBetween('post_date',[$start,$end])
       ->get();
       return view('admin.quickReport.sales_report',compact('order_item'));
    }
    public function deliveryReport(Request $request)
    {
      $start=$request->start;
      $end=$request->end;
      $order_item=DB::table('posts')
      ->where('post_type','shop_order')
      ->where('post_status','Delivered')
      ->whereBetween('post_date',[$start,$end])
      ->get();
       return view('admin.quickReport.delivery_report',compact('order_item'));
    }
    public function rejectItem()
    {
       return view('admin.quickReport.reject_item');
    }
    public function bestSelling()
    {
       $order=Post::where(['post_type'=>'shop_order','post_status'=>'Completed'])->get();
       return view('admin.quickReport.best_selling',compact('order'));
    }
    public function cancellationItems()
    {
       return view('admin.quickReport.cancellation_items');
    }
    public function soldoutStock()
    {
       $product=Post::where('post_type','product')->get();
       return view('admin.quickReport.soldout_stock',compact('product'));
    }
    public function bestCustomer(Request $request)
    {
      $start=$request->start; 
      $end=$request->end; 
       $customer=DB::SELECT("SELECT SUM(order_itemmeta.meta_value) as tot_qty,customer_id,users.name 
       FROM order_itemmeta LEFT JOIN users ON customer_id=users.id 
       WHERE order_itemmeta.meta_key='_qty' AND order_date BETWEEN '$start' AND '$end'
       GROUP BY order_itemmeta.customer_id
       order by max(order_itemmeta.meta_value) desc");
       return view('admin.quickReport.best_customer',compact('customer'));
    }

    public function grossProfit()
    {
       return view('admin.quickReport.gross_profit');
    }
  //gross profit report show
    public function grossProfitShow(Request $request)
    {
       $start=$request->start;
       $end=$request->end;
       $order=Post::where(['post_type'=>'shop_order','post_status'=>'Completed'])->whereBetween('post_date',[$start,$end])->get();
       $order_id=[];
       foreach($order as $orders){
         $order_id[]=$orders->ID;
       }
       $id=$order_id;
       $id_array=implode(',', $id);
       $cities=explode(',', $id_array);
       $order_item=Order_item::select("*")
       ->whereIn('order_id', $cities)
       ->whereNotNull('product_id')
       ->get();
       return view('admin.quickReport.gross_profit_show',compact('order_item'));
    }
}
