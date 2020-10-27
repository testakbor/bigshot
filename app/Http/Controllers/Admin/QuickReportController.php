<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;
use App\Model\front\Post;
use App\Model\front\Order_item;
use App\Model\front\Postmeta;
use App\Mail\systemMail;
use Mail;
use Carbon\Carbon;


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

    $current_date=date('Y-m-d');
    $day_one_date=date('Y-m-d', strtotime('-1 day', strtotime($current_date)));
    $day_two_date=date('Y-m-d', strtotime('-2 day', strtotime($current_date)));
    $day_three_date=date('Y-m-d', strtotime('-3 day', strtotime($current_date)));
    $day_four_date=date('Y-m-d', strtotime('-4 day', strtotime($current_date)));
    $day_five_date=date('Y-m-d', strtotime('-5 day', strtotime($current_date)));
    $today_pending_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>date('Y-m-d')])
    ->count(); 
    $day_one_pending_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>$day_one_date])
    ->count();  
    $day_two_pending_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>$day_two_date])
    ->count();
    $day_three_pending_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>$day_three_date])
    ->count();
    $day_four_pending_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>$day_four_date])
    ->count();
    $day_five_pending_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold','post_date'=>$day_five_date])
    ->count();
    $all_pending_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'on-hold'])
    ->count();
    $today_processing_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','processing')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($current_date)),date('Y-m-d 23:59:59',strtotime($current_date))])
    ->count();
    $day_one_processing_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','processing')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_one_date)),date('Y-m-d 23:59:59',strtotime($day_one_date))])
    ->count();
    $day_two_processing_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','processing')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_two_date)),date('Y-m-d 23:59:59',strtotime($day_two_date))])
    ->count();
    $day_three_processing_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','processing')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_three_date)),date('Y-m-d 23:59:59',strtotime($day_three_date))])
    ->count();
    $day_four_processing_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','processing')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_four_date)),date('Y-m-d 23:59:59',strtotime($day_four_date))])
    ->count();
    $day_five_processing_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','processing')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_five_date)),date('Y-m-d 23:59:59',strtotime($day_five_date))])
    ->count();
    $all_processing_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'processing'])
    ->count();
    $today_dispatch_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','dispatch')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($current_date)),date('Y-m-d 23:59:59',strtotime($current_date))])
    ->count();
    $day_one_dispatch_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','dispatch')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_one_date)),date('Y-m-d 23:59:59',strtotime($day_one_date))])
    ->count();
    $day_two_dispatch_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','dispatch')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_two_date)),date('Y-m-d 23:59:59',strtotime($day_two_date))])
    ->count();
    $day_three_dispatch_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','dispatch')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_three_date)),date('Y-m-d 23:59:59',strtotime($day_three_date))])
    ->count();
    $day_four_dispatch_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','dispatch')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_four_date)),date('Y-m-d 23:59:59',strtotime($day_four_date))])
    ->count();
    $day_five_dispatch_order=DB::table('posts')
    ->where('post_type','shop_order')
    ->where('post_status','dispatch')
    ->whereBetween('post_modified',[date('Y-m-d 00:00:00', strtotime($day_five_date)),date('Y-m-d 23:59:59',strtotime($day_five_date))])
    ->count();
    $all_dispatch_order=DB::table('posts')
    ->where(['posts.post_type'=>'shop_order','post_status'=>'dispatch'])
    ->count();

    
    // * start product stock move *//

    $starDate = \Carbon\Carbon::today()->subDays(7)->toDateString();
    $endDate = \Carbon\Carbon::today()->subDays(14)->toDateString();

    $starDate=date('Y-m-d 00:00:00',strtotime($starDate));
    $endDate=date('Y-m-d 23:59:59',strtotime($endDate)); 

    $week1=DB::table('posts')
    ->where('post_type','product')
    ->whereBetween('post_date', [$endDate,$starDate])  
    ->where('meta_key', 'qty')
    ->where('meta_value','>',0)
    ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
    ->get();

    $starDate = \Carbon\Carbon::today()->subDays(15)->toDateString();
    $endDate = \Carbon\Carbon::today()->subDays(29)->toDateString();

    $starDate=date('Y-m-d 00:00:00',strtotime($starDate));
    $endDate=date('Y-m-d 23:59:59',strtotime($endDate)); 

    $week2=DB::table('posts')
    ->where('post_type','product')
    ->whereBetween('post_date', [$endDate,$starDate])  
    ->where('meta_key', 'qty')
    ->where('meta_value','>',0)
    ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
    ->get();


    $starDate = \Carbon\Carbon::today()->subDays(30)->toDateString();
    $endDate = \Carbon\Carbon::today()->subDays(59)->toDateString();

    $starDate=date('Y-m-d 00:00:00',strtotime($starDate));
    $endDate=date('Y-m-d 23:59:59',strtotime($endDate)); 

    $month1=DB::table('posts')
    ->where('post_type','product')
    ->whereBetween('post_date', [$endDate,$starDate])  
    ->where('meta_key', 'qty')
    ->where('meta_value','>',0)
    ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
    ->get();


     $starDate = \Carbon\Carbon::today()->subDays(60)->toDateString();
    $endDate = \Carbon\Carbon::today()->subDays(90)->toDateString();

    $starDate=date('Y-m-d 00:00:00',strtotime($starDate));
    $endDate=date('Y-m-d 23:59:59',strtotime($endDate)); 

    $month2=DB::table('posts')
    ->where('post_type','product')
    ->whereBetween('post_date', [$endDate,$starDate])  
    ->where('meta_key', 'qty')
    ->where('meta_value','>',0)
    ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
    ->get(); 


    $starDate = \Carbon\Carbon::today()->subDays(90)->toDateString();
    $endDate = \Carbon\Carbon::today()->subDays(120)->toDateString();

    $starDate=date('Y-m-d 00:00:00',strtotime($starDate));
    $endDate=date('Y-m-d 23:59:59',strtotime($endDate)); 

    $month3=DB::table('posts')
    ->where('post_type','product')
    ->whereBetween('post_date', [$endDate,$starDate])  
    ->where('meta_key', 'qty')
    ->where('meta_value','>',0)
    ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
    ->get();

    $stcokMove=array(
      'week1'=>count($week1),
      'week2'=>count($week2),
      'month1'=>count($month1),
      'month2'=>count($month2),
      'month3'=>count($month3)
    );


    $product_total_stock=DB::table('posts')
    ->where(['post_type'=>'product','meta_key'=>'qty'])
    ->where('meta_value','>',0)
    ->join('postmeta','posts.ID','=','postmeta.post_id')
    ->sum('meta_value');  
    $data=Post::
    where('post_type','product')
    ->where('post_status','!=','deleted')
    ->where('meta_key', 'qty')
    ->where('meta_value','>',0)
    ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
    ->get();
    $product=Post::where('post_type','product')->get();   
    $pro=Post::where('post_type','product')
    ->where('post_status', '!=', 'deleted')
    ->get();   
    $delivered_qty=DB::table('posts')->where(['post_type'=>'shop_order','post_status'=>'delivered'])->count(); 
    $delivered_order=Post::where('post_type','shop_order')->where('post_status','delivered')
    ->get();  
    $s=date('Y-m-01');
    $e=date('Y-m-t');
    $year=date('Y');
    $order_gross_profit_month=Post::where('post_type','shop_order')->whereBetween('post_date',[$s,$e])->get();
    $order_gross_profit_yearly=Post::where('post_type','shop_order')->whereYear('post_date',$year)->get();
    $stock_product=Post::where(['post_type'=>'product','meta_key'=>'qty'])
    ->where('meta_value','>',0)
    ->select('post_date','ID','meta_value as quantity')
    ->join('postmeta','posts.ID','=','postmeta.post_id')
    ->get();
    $yearly_total_sold_out_product=Post::where(['post_type'=>'product','meta_key'=>'qty'])
    ->where('meta_value','=',0)
    ->whereYear('post_date',date('Y'))
    ->join('postmeta','posts.ID','=','postmeta.post_id')
    ->count();

    $yearly_best_sell_item=DB::SELECT("SELECT order_date,SUM(meta_value) as total_qty 
      FROM order_itemmeta JOIN order_items ON order_itemmeta.order_item_id=order_items.order_item_id
      where meta_key='_qty' and YEAR(order_date)='$year' 
      GROUP by product_id ORDER by total_qty DESC");

    return view('admin.quickReport.index',
      compact(
        'today_pending_order',
        'day_one_pending_order',
        'day_two_pending_order',
        'day_three_pending_order',
        'day_four_pending_order',
        'day_five_pending_order',
        'all_pending_order',
        'today_processing_order',
        'day_one_processing_order',
        'day_two_processing_order',
        'day_three_processing_order',
        'day_four_processing_order',
        'day_five_processing_order',
        'all_processing_order',
        'today_dispatch_order',
        'day_one_dispatch_order',
        'day_two_dispatch_order',
        'day_three_dispatch_order',
        'day_four_dispatch_order',
        'day_five_dispatch_order',
        'all_dispatch_order',
        'stcokMove',
        'product_total_stock',
        'product',
        'pro',
        'delivered_qty',
        'delivered_order',
        'order_gross_profit_month',
        'order_gross_profit_yearly',
        'data',
        'stock_product',
        'yearly_total_sold_out_product',
        'yearly_best_sell_item'
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
   GROUP by product_id ORDER by total_qty DESC LIMIT 10 ");
  return view('admin.quickReport.best_selling',compact('order'))->with($extraInfo);
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
    GROUP by customer_id ORDER by total_qty DESC LIMIT 10");
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
    GROUP by customer_id ORDER by total_qty DESC LIMIT 10");
  return view('admin.quickReport.best_customer_search',compact('data'))->with($extraInfo);
}

public function bestCustomerSendEmail($email){
  return view('emails.best_customer_email')->with(['email'=>$email]);
}

public function bestCustomerSendEmailData(Request $request){
  $email=$request->email;
  $message=$request->message;
  $title=$request->title;
  $details = [
    'title' => $title,
    'body' => $message,
  ];
  Mail::to($email)->send(new systemMail($details));
  session()->flash("success", "Email has been sent successfully");
  return back();
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
    'title'=>"Gross Profit List",
    'page'=>'Report'
  );
  $start=$request->start;
  $end=$request->end;
  $order=Post::where(['post_type'=>'shop_order'])->whereBetween('post_date',[$start,$end])->get();
  return view('admin.quickReport.gross_profit_show',compact('order','start','end'))->with($extraInfo);
}

public function gross_profit_monthly(){
 $extraInfo=array(
  'title'=>"Gross Profit List",
  'page'=>'Report'
);
 $start=date('Y-m-01');
 $end=date('Y-m-t');
 $order=Post::where(['post_type'=>'shop_order'])->whereBetween('post_date',[$start,$end])->get();
 return view('admin.quickReport.gross_profit_show_monthly',compact('order','start','end'))->with($extraInfo);
}

public function best_sell_yearly(){
 $year=date('Y');
 $order=DB::SELECT("SELECT order_date,product_id,order_item_name,SUM(meta_value) as total_qty 
   FROM order_itemmeta JOIN order_items ON order_itemmeta.order_item_id=order_items.order_item_id
   where meta_key='_qty' and YEAR(order_date)='$year' 
   GROUP by product_id ORDER by total_qty DESC");
 return view('admin.quickReport.best_selling_yearly',compact('order'));
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
