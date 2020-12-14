<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Model\front\Post;
use App\Model\front\Postmeta;
use App\Model\front\Order_item;
use Carbon\Carbon;
use DB;
use Session;
use App;
use Auth;
use PDF;
use App\Exports\DispatchExcel;
use Excel;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
      $this->middleware('auth:admin');
    }


    public function index(Request $request)
    {
      if($request->user()->can('order-history')) {
      $extraInfo=array(
        'title'=>"Order List",
        'page'=>'order'
      );
      $pending_order=Post::where(['posts.post_type'=>'shop_order','post_status'=>'on-hold'])
      ->count();
      $processing_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'processing'])
      ->count();
      $dispatch_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'dispatch'])
      ->count();
      $delivered_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'delivered'])
      ->count();
      $cancelled_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'cancelled'])
      ->count();
      $reject_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'failed'])
      ->count();
      $total_order_status=$pending_order+$processing_order+$dispatch_order+$delivered_order+$cancelled_order+$reject_order;     
      return view('admin.order.list',compact('pending_order','processing_order','delivered_order','cancelled_order', 'dispatch_order','total_order_status'))->with($extraInfo);
    }
    }

    public function pendingOrder(){
      $extraInfo=array(
        'title'=>"Pending Order List",
        'page'=>'pendingOrder'
      );


      $orders=Post::where('posts.post_type','shop_order')
      ->where('post_status','on-hold')
      ->whereBetween('post_date',[date('Y-m-01'), date('Y-m-t')])
      ->orderBy('ID','DESC')
      ->paginate(10); 
        $or=Post::where('posts.post_type','shop_order')
      ->where('post_status','on-hold')
      ->whereBetween('post_date',[date('Y-m-01'), date('Y-m-t')])
      ->orderBy('ID','DESC')
      ->get(); 
      $total_orders=Post::where('posts.post_type','shop_order')
      ->where('post_status','on-hold')
      ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
      ->count();  

       $total_item=DB::table('order_itemmeta')
       ->join('posts','posts.ID','=','order_itemmeta.order_id')
       ->where('posts.post_type','shop_order')
       ->where('post_status','on-hold')
       ->where('meta_key','_qty')
       ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
       ->sum('meta_value');

        $total_amount=DB::table('order_itemmeta')
       ->join('posts','posts.ID','=','order_itemmeta.order_id')
       ->where('posts.post_type','shop_order')
       ->where('post_status','on-hold')
       ->where('meta_key','_line_subtotal')
       ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
       ->sum('meta_value');

      return view('admin.order.pendingOrder',compact('orders','total_orders','total_item','total_amount','or'))->with($extraInfo);
    }
    public function todayPendingOrder(){
      $extraInfo=array(
        'title'=>"Today Pending order List",
        'page'=>'todayPendingOrder'
      );
      $orders=Post::where('posts.post_type','shop_order')
      ->where('post_status','on-hold')         
      ->whereBetween('post_date', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
      ->orderBy('ID','DESC')
      ->paginate(10); 
      $total_orders=Post::where('posts.post_type','shop_order')
      ->where('post_status','on-hold')
      ->whereBetween('post_date', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
      ->count();  
      return view('admin.order.todayPendingOrder',compact('orders','total_orders'))->with($extraInfo);
    }
    public function pendingOrderByDate($day){

     $date = \Carbon\Carbon::today()->subDays($day)->toDateString();
     $starDate=date('Y-m-d 00:00:00',strtotime($date));
     $endDate=date('Y-m-d 23:59:59',strtotime($date));
     $extraInfo=array(
      'title'=>$day." Pending order List",
      'page'=>'todayPendingOrder'
    );
     $orders=Post::where('posts.post_type','shop_order')
     ->where('post_status','on-hold')      
     ->whereBetween('post_date', [$starDate, $endDate])  
     ->orderBy('ID','DESC')
     ->paginate(10);         

     $total_orders=Post::where('posts.post_type','shop_order')
     ->where('post_status','on-hold')
     ->whereBetween('post_date', [$starDate, $endDate])  
     ->count();  
     return view('admin.order.pendingOrderByDate',compact('orders','total_orders'))->with($extraInfo);
   }

   public function search_pending_order(Request $request){
    $extraInfo = array(
      'title' => "Panding Order List",
      'page' => 'pendingOrder'
    );
    $start=Carbon::parse($request->start)
    ->toDateString();
    $end=Carbon::parse($request->end)
    ->toDateString();
    $orders=Post::where('posts.post_type','shop_order')
    ->where('post_status','on-hold')
    ->whereBetween('post_date',array([$start,$end]))
    ->orderBy('ID','DESC')
    ->get();
    $total_orders=Post::where('posts.post_type','shop_order')
    ->where('post_status','on-hold')
    ->whereBetween('post_date',array([$start,$end])) 
    ->count();  
    return view('admin.order.searchOrder',compact('orders','total_orders'))->with($extraInfo);
  }

  public function processing()
  {
    $extraInfo = array(
      'title' => "Order List",
      'page' => 'order'
    );
     $order=Post::where('post_type','shop_order')
    ->where('post_status','processing')
     ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')]) 
    ->paginate(20);
    $total_order=Post::where('post_type', 'shop_order')
    ->where('post_status', 'processing')
    ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
    ->count();
    return view('admin.order.processing',compact('order','total_order'))->with($extraInfo);
  }

  public function processingOrderByDate($day)
  {
    $extraInfo = array(
      'title' => "Order List",
      'page' => 'order'
    );
    $date = \Carbon\Carbon::today()->subDays($day)->toDateString();
    $starDate=date('Y-m-d 00:00:00',strtotime($date));
    $endDate=date('Y-m-d 23:59:59',strtotime($date));
    
    $order=Post::where('post_type','shop_order')
    ->where('post_status','processing')
    ->whereBetween('post_modified', [$starDate, $endDate])  
    ->paginate(20);
    $total_order=Post::where('post_type', 'shop_order')
    ->where('post_status', 'processing')
    ->whereBetween('post_modified', [$starDate, $endDate])  
    ->count();
    return view('admin.order.processing',compact('order','total_order'))->with($extraInfo);
  } 
  public function print()
  {   
    return view('admin.order.pendingOrder_print');
  }

  public function dispat()
  {
    $extraInfo = array(
      'title' => "Order List",
      'page' => 'order'
    );
    $order = Post::where('post_type', 'shop_order')
    ->where('post_status', 'dispatch')
    ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
    ->paginate(20);
    $total_order = Post::where('post_type', 'shop_order')
    ->where('post_status', 'dispatch')
    ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
    ->count();
    return view('admin.order.dispat', compact('order','total_order'))->with($extraInfo); 
  }

  public function allDispatchcomplete(){
      $extraInfo = array(
      'title' => "Order List",
      'page' => 'order'
    );
     $order = Post::where('post_type', 'shop_order')
    ->where('post_status', 'dispatch_complete')
    ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
    ->paginate(20);

      $total_complete=Post::where('post_type','shop_order')
      ->where('post_status','dispatch_complete')
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->count();
         $total_qty=Post::where('post_type','shop_order')
      ->where('post_status','dispatch_complete')
      ->where('meta_key','_qty')
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->join('order_itemmeta','posts.ID','=','order_itemmeta.order_id')
      ->sum('meta_value');
      return view('admin.order.all_complete_dispatch', compact('order','total_complete','total_qty'))->with($extraInfo); 
  }

  public function dispatchByDate($day)
  {

    $date = \Carbon\Carbon::today()->subDays($day)->toDateString();

    $starDate=date('Y-m-d 00:00:00',strtotime($date));
    $endDate=date('Y-m-d 23:59:59',strtotime($date));

    $extraInfo = array(
      'title' => "Order List",
      'page' => 'order'
    );    
    $order = Post::where('post_type', 'shop_order')
    ->where('post_status', 'dispatch')
    ->whereBetween('post_modified', [$starDate, $endDate])  
    ->paginate(20);
    $total_order = Post::where('post_type', 'shop_order')
    ->where('post_status', 'dispatch')
    ->whereBetween('post_modified', [$starDate, $endDate])  
    ->count();
    return view('admin.order.dispat', compact('order','total_order'))->with($extraInfo); 
  }

  public function cancelled()
  {   
   $extraInfo=array(
    'title'=>"Cancel List",
    'page'=>'cancelled'
  ); 

   $order = Post::where('post_type', 'shop_order')
   ->where('post_status', 'cancelled')
   ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
   ->paginate(20);

   $total_order = Post::where('post_type', 'shop_order')
   ->where('post_status', 'cancelled')
   ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
   ->count();

   return view('admin.order.cancelled', compact('order','total_order'))->with($extraInfo);
 }

 public function allStatus()
 {
     $extraInfo = array(
    'title' => "Order List",
    'page' => 'order'
    );
      $order = Post::where('post_type','shop_order')
       ->whereBetween('post_date', [date('Y-m-01'), date('Y-m-t')])
      ->orderBy('ID', 'DESC')
      ->paginate(20);
  return view('admin.order.allStatus',compact('order'))->with($extraInfo);
}



public function allStatusPrint($id)
{    
$order = Post::where('ID', $id)->first();
$name = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'first_name')->first();
$phone = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'phone')->first();
$city = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'city')->first();
$products = Order_item::where('order_id', $id)->whereNotNull('product_id')->get();
$order_info = DB::table('postmeta')->where('post_id', $order->ID)->get();

$pdf = PDF::loadView('admin.order.allStatusPrint', array(
  'order' => $order, 'name' => $name, 'phone' => $phone,
  'city' => $city, 'products' => $products, 'order_info' => $order_info
));
return $pdf->download('allStatusPrint.pdf');
}

public function downloadShipAddress($id){
  dd($id);
}


public function sendParcel(Request $request)
{   
    if($request->user()->can('send-parcel')) {
 $extraInfo=array(
  'title'=>"Brand List",
  'page'=>'sendParcel'
); 
 $orders=Post::where('posts.post_type','shop_order')
 ->where('post_status','processing')
 ->paginate(10); 
 $total_orders=Post::where('posts.post_type','shop_order')
 ->where('post_status','processing')
 ->count();  
 return view('admin.order.sendParcel',compact('orders','total_orders'))->with($extraInfo);
}
}

public function sendParcelSearch(Request $request){
 $extraInfo=array(
  'title'=>"Brand List",
  'page'=>'sendParcel'
); 

 $orders=Post::where(['posts.post_type'=>'shop_order','post_status'=>'processing','ID'=>$request->order_id])
 ->paginate(10); 
 $total_orders=Post::where(['posts.post_type'=>'shop_order','post_status'=>'processing','ID'=>$request->order_id])
 ->count(); 
 return view('admin.order.send_parcel_search',compact('orders','total_orders'))->with($extraInfo);
}

public function deliveryInvoice()
{    
  $extraInfo=array(
    'title'=>"Brand List",
    'page'=>'sendParcel'
  ); 
  return view('admin.order.deliveryInvoice')->with($extraInfo);
}
// public function reject()
// {    
//     $extraInfo=array(
//         'title'=>"Brand List",
//         'page'=>'reject'
//     ); 
//     $reject_order=DB::table('posts')
//     ->where('post_type','shop_order')
//     ->where('post_status','reject')
//     ->get();
//     return view('admin.order.reject',compact('reject_order'))->with($extraInfo);
// }
public function reject(Request $request)
{   
    if($request->user()->can('manage-reject')) { 
  $extraInfo=array(
    'title'=>"Reject item",
    'page'=>'reject'
  ); 
  $sku=$request->sku;
  if($sku==''){
   return view('admin.order.reject')->with($extraInfo);
 }else{
   $count=Postmeta::where('meta_key','_sku')->where('meta_value',$sku)->count();
   if($count==0){
    session()->flash("error", "No Sku Found");
    return back();
  }
  $meta_info=Postmeta::where('meta_key','_sku')->where('meta_value',$sku)->first();
  $img=Postmeta::where('meta_key','attached_file')->where('post_id',$meta_info->post_id)->first();

  $attribute=DB::table('posts')
  ->where('post_parent',$meta_info->post_id)
  ->where('post_type','product_varient')
  ->where('meta_key','attribute')
  ->join('postmeta','postmeta.post_id','=','posts.ID')
  ->select('meta_value','post_id')
  ->get();
 

  if($meta_info==NULL){
    session()->flash("error", "No Sku Found");
    return back();
  }
  $post=Post::where('ID',$meta_info->post_id)->first();
  $relationShips=DB::table('term_relationships')
  ->join('term_taxonomy','term_taxonomy.term_taxonomy_id','=','term_relationships.term_taxonomy_id')
  ->where('object_id',$post->ID)
  ->where('taxonomy','product_cat')
  ->get();
  return view('admin.order.reject_qty',compact('meta_info','post','relationShips','img','attribute'))->with($extraInfo);
}
}

}

public function rejectProductSearh(Request $request)
{    
  $extraInfo=array(
    'title'=>"Reject item",
    'page'=>'reject'
  ); 
  $sku=$request->sku;
  $count=Postmeta::where('meta_key','_sku')->where('meta_value',$sku)->count();
  if($count==0){
    session()->flash("error", "No Sku Found");
    return back();
  }
  $meta_info=Postmeta::where('meta_key','_sku')->where('meta_value',$sku)->first();
  $qty_current=Postmeta::where('meta_key','qty')->where('post_id',$meta_info->post_id)->first();
  if($meta_info==NULL){
    session()->flash("error", "No Sku Found");
    return back();
  }
  $post=Post::where('ID',$meta_info->post_id)->first();
  $relationShips=DB::table('term_relationships')
  ->join('term_taxonomy','term_taxonomy.term_taxonomy_id','=','term_relationships.term_taxonomy_id')
  ->where('object_id',$post->ID)
  ->where('taxonomy','product_cat')
  ->get();
  return view('admin.order.reject_search',compact('meta_info','post','relationShips','qty_current'))->with($extraInfo);
}
public function rejectProductUpdate(Request $request)
{    
  
   $extraInfo=array(
    'title'=>"Reject item",
    'page'=>'reject'
  );

  for($i=0;$i<count($request->post_id);$i++){

     $default_stock=DB::table('postmeta')
     ->where('post_id',$request->post_id[$i])
     ->where('meta_key','default_qty')
     ->first();
     
    if(isset($default_stock)){
       $update_qty=$default_stock->meta_value-$request->stock[$i];
       DB::table('postmeta')
       ->where('post_id',$request->post_id[$i])
       ->where('meta_key','default_qty')
       ->update([
         'meta_value' =>$update_qty
       ]);
     }

     $attribute_stock=DB::table('postmeta')
     ->where('post_id',$request->post_id[$i])
     ->where('meta_key','attribute_stock')
     ->first();

     if(isset($attribute_stock)){
       $update_qty=$attribute_stock->meta_value-$request->stock[$i];
       DB::table('postmeta')
       ->where('post_id',$request->post_id[$i])
       ->where('meta_key','attribute_stock')
       ->update([
         'meta_value' =>$update_qty
       ]);
      }

      DB::table('postmeta')->insert([
       'post_id'=>$request->post_id[$i],
       'meta_key'=>'product_status',
       'meta_value'=>'reject',
      ]);

      DB::table('postmeta')->insert([
       'post_id'=>$request->post_id[$i],
       'meta_key'=>'reject_date',
       'meta_value'=> date('Y-m-d')
      ]);

      DB::table('postmeta')->insert([
       'post_id'=>$request->post_id[$i],
       'meta_key'=>'reject_date',
       'meta_value'=> date('Y-m-d')
      ]);

      DB::table('postmeta')->insert([
       'post_id'=>$request->post_id[$i],
       'meta_key'=>'reject_qty',
       'meta_value'=> $request->stock[$i]
      ]);
  }
 session()->flash("success","Quantity has been reject Successfully");
 return view('admin.order.reject')->with($extraInfo);
}
public function stock(Request $request)
{

  if($request->user()->can('manage-stock')) {     
  $extraInfo=array(
    'title'=>"Stock List",
    'page'=>'stock'
  ); 
  $products=DB::table('posts')
  ->where('post_type','product')
  ->where('post_status','!=','deleted')
  ->paginate(10);

  $data=Post::
  where('post_type','product')
  ->where('post_status','!=','deleted')
  ->get(); 


  $total_stock_attribute=DB::table('posts')
  ->where('post_type','product_varient')
  ->join('postmeta','posts.ID','=','postmeta.post_id')
  ->where('meta_key','attribute_stock')
  ->sum('meta_value');

  $total_stock_default=DB::table('posts')
  ->where(['post_type'=>'product','meta_key'=>'default_qty'])
  ->where('meta_value','>',0)
  ->join('postmeta','posts.ID','=','postmeta.post_id')
  ->sum('meta_value'); 


  return view('admin.order.stock',compact('products','data','total_stock_attribute','total_stock_default'))->with($extraInfo);
}
}

public function stockMove($day)
{       
  if($day==7){    
   $starDate = \Carbon\Carbon::today()->subDays(7)->toDateString();
   $endDate = \Carbon\Carbon::today()->subDays(14)->toDateString();
  }
  if($day==15){    
   $starDate = \Carbon\Carbon::today()->subDays(15)->toDateString();
   $endDate = \Carbon\Carbon::today()->subDays(29)->toDateString();
  }
  if($day==30){    
   $starDate = \Carbon\Carbon::today()->subDays(30)->toDateString();
   $endDate = \Carbon\Carbon::today()->subDays(59)->toDateString();
  } 
  if($day==60){    
   $starDate = \Carbon\Carbon::today()->subDays(60)->toDateString();
   $endDate = \Carbon\Carbon::today()->subDays(90)->toDateString();
  }
  if($day==90){    
   $starDate = \Carbon\Carbon::today()->subDays(90)->toDateString();
   $endDate = \Carbon\Carbon::today()->subDays(120)->toDateString();
  }

   $starDate=date('Y-m-d 00:00:00',strtotime($starDate));
   $endDate=date('Y-m-d 23:59:59',strtotime($endDate));

  $extraInfo=array(
    'title'=>"Stock List",
    'page'=>'stock'
  ); 

  $products=DB::table('posts')
  ->where('post_type','product')
  ->whereBetween('post_date', [$endDate,$starDate])  
  ->where('meta_key', 'qty')
  ->where('meta_value','>',0)
  ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
  ->paginate(10);


  $data=Post::
  where('post_type','product')
  ->whereBetween('post_date', [$endDate,$starDate])  
  ->where('meta_key', 'qty')
  ->where('meta_value','>',0)
  ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
  ->get();

  $product_total_stock=DB::table('posts')
  ->whereBetween('post_date', [$endDate,$starDate])  
  ->where('meta_key', 'qty')
  ->where('meta_value','>',0)
  ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
  ->sum('meta_value'); 
  return view('admin.order.stockMove',compact('products','data','product_total_stock'))->with($extraInfo);
}

public function soldStock(Request $request)
{
   if($request->user()->can('manage-stock')) {  
    $extraInfo = array(
      'title' => "Sold Stock List",
      'page' => 'oldstock'
    );
     $default_product=DB::table('postmeta')  
                    ->where('meta_key','default_qty') 
                    ->where('meta_value','<=',0)
                    ->get();

     $attribute_product=DB::table('postmeta')  
                    ->where('meta_key','attribute_stock') 
                    ->where('meta_value','<=',0)
                    ->get();   
         
     return view('admin.order.stock_sold',compact('default_product','attribute_product'))->with($extraInfo);
    }
}

public function lowerStock(Request $request){
     if($request->user()->can('manage-stock')) {  
  $extraInfo=array(
    'title'=>"Brand List",
    'page'=>'lowerstock'
  ); 
  $products=Post::
  where('post_type','product')
  ->get(); 
  return view('admin.order.stock_lower',compact('products'))->with($extraInfo);
  }
}

public function grossProfit()
{    
  $extraInfo=array(
    'title'=>"Brand List",
    'page'=>'grossProfit'
  ); 
  return view('admin.order.grossProfit')->with($extraInfo);
}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
      $extraInfo=array(
        'title'=>"Order Edit",
        'page'=>'order'
      );
      $order=Post::find($id);
      $products=Order_item::where('order_id',$id)->whereNotNull('product_id')->get();
      $order_info=DB::table('postmeta')->where('post_id',$order->ID)->get();
      return view('admin.order.edit',compact('order','products','id','order_info'))->with($extraInfo);     
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
      $id=$request->id;
      $status=$request->status;
      $data=DB::table('posts')->where('post_type','shop_order')
      ->where('ID',$id)
      ->update([
        'post_status'=>$status
      ]);
      session()->flash("success","Status has been update");
      return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    //pending order print
    public function pending_order_print($id){
      $total_qty=DB::table('order_itemmeta')->where(['order_id'=>$id,'meta_key'=>'_qty'])->sum('meta_value');
      $total_due=DB::table('order_itemmeta')->where(['order_id'=>$id,'meta_key'=>'_line_subtotal'])->sum('meta_value');
      $customer_info=Postmeta::where('post_id',$id)->get();
      $pdf = PDF::loadView('admin.order.pendingOrder_print', array('total_qty' => $total_qty,'total_due'=>$total_due,'customer_info'=>$customer_info,'id'=>$id));
      return $pdf->download('shipping.pdf');
    }

    public function pending_order_processing($id){
      DB::table('posts')->where('ID',$id)->update([
        'post_status' =>'processing',
        'post_modified' => date('Y-m-d H:i:s'),
      ]);
        //check if already have meta value
      $check=DB::table('postmeta')->where('post_id',$id)->where('meta_key','processing_date')->count();
      if($check>0){
        $check = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'processing_date')->delete();
        DB::table('postmeta')->insert([
          'post_id' => $id,
          'meta_key' => 'processing_date',
          'meta_value' => date('Y-m-d')
        ]);
      }else{
        DB::table('postmeta')->insert([
          'post_id' => $id,
          'meta_key' => 'processing_date',
          'meta_value' => date('Y-m-d')
        ]);
      }
      session()->flash("success","Status has been changed Successfully");
      return back();
    }

    public function pending_order_cancel($id){
      DB::table('posts')->where('ID',$id)->update([
        'post_status' =>'cancelled'
      ]);
      session()->flash("success","Status has been changed Successfully");
      return back();
    }

    public function pending_order_edit($id){
      $extraInfo = array(
        'title' => "Order Edit",
        'page' => 'order'
      );
      $order = Post::find($id);
      $products = Order_item::where('order_id', $id)->whereNotNull('product_id')->get();
      $order_info = DB::table('postmeta')->where('post_id', $order->ID)->get();
      $delivery_charge=DB::table('order_itemmeta')->where('meta_key','delivery_charge')->first();
      return view('admin.order.edit', compact('order', 'products', 'id', 'order_info','delivery_charge'))->with($extraInfo);     
    }

    public function sendParcelPrint(Request $request){
      $current = Carbon::now()->toDateTimeString();
      $company_name=$request->delivery_company;
      $id=$request->order;
      $orders = Post::where(['posts.post_type'=>'shop_order','post_status'=>'processing'])->whereIn('ID',$id)->get();
      // DB::table('posts')->where(['posts.post_type'=>'shop_order','post_status'=>'processing'])->whereIn('ID',$id)->update([
      //   'post_status'=>'dispatch',
      //   'post_modified'=>$current,
      // ]);
       $delivery=DB::table('order_itemmeta')->where('order_id',$id)
      ->where('meta_key','delivery_charge')->first();
       if(isset($delivery)){ 
       $charge=$delivery->meta_value;
      } else{
       $charge=0;
      } 
      $pdf = PDF::loadView('admin.order.parcel_print',array('company_name'=>$company_name,'orders'=>$orders,'charge'=>$charge));
      return $pdf->download('delivery_invoice.pdf');
        //return view('admin.order.parcel_print',compact('orders','company_name'));
    }

    public function sendParcelRemove($id){
      DB::table('posts')->where('ID',$id)->update([
        'post_status' => 'on-hold'
      ]);
      return redirect()->route('order.sendParcel');
    }

    public function downloadShippingAddress($id){
      $order = Post::find($id);
      $products = Order_item::where('order_id', $id)
      ->whereNotNull('product_id')
      ->get();
      $name = DB::table('postmeta')->where('post_id', $order->ID)->where('meta_key','first_name')->first();
      $address = DB::table('postmeta')->where('post_id', $order->ID)->where('meta_key','address_one')->first();
      $phone = DB::table('postmeta')->where('post_id', $order->ID)->where('meta_key','phone')->first();
      $total_qty=DB::table('order_itemmeta')->where('order_id',$id)->where('meta_key','_qty')->sum('meta_value');
      $total_due=DB::table('order_itemmeta')->where('order_id',$id)->where('meta_key','_line_subtotal')->sum('meta_value');
      $pdf = PDF::loadView('admin.pdf.order.shipping_address',array('order'=>$order,'name'=>$name,'address'=>$address,'phone'=>$phone,'total_qty'=>$total_qty,'total_due'=>$total_due));
      return $pdf->download('shipping.pdf');
    }

    //excel dispatch
    public function excelDispatch(){
      $extraInfo = array(
        'title' => "Dispatch Order List",
        'page' => 'order'
      ); 
      $order = Post::where('post_type','shop_order')
      ->where('post_status','dispatch')
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->paginate(500);
      $total_complete=Post::where('post_type','shop_order')
      ->where('post_status','dispatch_complete')
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->count();
       $total_qty=Post::where('post_type','shop_order')
      ->where('post_status','dispatch_complete')
      ->where('meta_key','_qty')
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->join('order_itemmeta','posts.ID','=','order_itemmeta.order_id')
      ->sum('meta_value');
      return view('admin.order.excelDispatch', compact('order','total_complete','total_qty'))->with($extraInfo); 
    }

    public function excelDispatchDownload(Request $request){
          DB::table('posts')->whereIn('ID',$request->check_id)->update([
            'post_status'=>'dispatch_complete'
          ]);
          $data=Post::whereIn('ID',$request->check_id)->get();
          return Excel::download(new DispatchExcel($data),'dispatch_excel.xlsx');
    }

    public function deliveryInvoiceOrder(){
      $extraInfo = array(
        'title' => "Order List",
        'page' => 'order'
      );
      $order=Post::where(['post_type'=>'shop_order','post_status'=>'delivered'])
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->get();
      return view('admin.order.deliveryInvoiceOrder',compact('order'))->with($extraInfo); 
    }

    public function deliveredOrder(){
      $extraInfo = array(
        'title' => "Order List",
        'page' => 'order'
      ); 
      $order = Post::where('post_type', 'shop_order')
      ->where('post_status','=','delivered')
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->paginate(20);
      $total_order = Post::where('post_type', 'shop_order')
      ->where('post_status','=','delivered')
      ->whereBetween('post_modified', [date('Y-m-01 00:00:00'), date('Y-m-t 23:59:59')])
      ->count();
      return view('admin.order.delivery', compact('order','total_order'))->with($extraInfo); 
    }

    public function deliveredSearch(Request $request){
      $start=$request->start;
      $end=$request->end;
      $extraInfo = array(
        'title' => "Delivery List",
        'page' => 'processing'
      );
      $order = Post::where('post_type', 'shop_order')
      ->where('post_status', 'delivered')
      ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($start)), date('Y-m-d 23:59:59', strtotime($end))])
      ->paginate(20);
      $total_order = Post::where('post_type', 'shop_order')
      ->where('post_status', 'delivered')
      ->whereBetween('post_modified', [date('Y-m-d 00:00:00',strtotime($start)), date('Y-m-d 23:59:59',strtotime($end))])
      ->count();
      return view('admin.order.delivery_search', compact('order', 'total_order'))->with($extraInfo); 
    }



    public function cancelledOrder()
    {
      $extraInfo = array(
        'title' => "Order List",
        'page' => 'order'
      );
      $date = \Carbon\Carbon::today()->subDays(30);
      $order = Post::where('post_type', 'shop_order')
      ->where('post_status', 'cancelled')
      ->where('post_modified', '>=', $date)
      ->paginate(20);   
      $total_order = Post::where('post_type', 'shop_order')
      ->where('post_status', 'cancelled')
      ->where('post_modified', '>=', $date)
      ->count();
      return view('admin.order.cancelled', compact('order','total_order'))->with($extraInfo);
    } 

    public function cancelledOrderSearch(Request $request){
      $start = $request->start;
      $end = $request->end;
      $extraInfo = array(
        'title' => "Delivery List",
        'page' => 'processing'
      );
      $order = Post::where('post_type', 'shop_order')
      ->where('post_status', 'cancelled')
      ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($start)), date('Y-m-d 23:59:59', strtotime($end))])
      ->paginate(20);
      $total_order = Post::where('post_type', 'shop_order')
      ->where('post_status', 'cancelled')
      ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($start)), date('Y-m-d 23:59:59', strtotime($end))])
      ->count();
      return view('admin.order.cancelled_search', compact('order', 'total_order'))->with($extraInfo);
    }

    public function cancelledOrderPrint($id)
    {
      $order = Post::where('ID', $id)->first();
      $name = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'first_name')->first();
      $phone = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'phone')->first();
      $city = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'city')->first();
      $products = Order_item::where('order_id', $id)->whereNotNull('product_id')->get();
      $order_info = DB::table('postmeta')->where('post_id', $order->ID)->get();
      $pdf = PDF::loadView('admin.order.concelled_order_pdf', array(
        'order' => $order, 'name' => $name, 'phone' => $phone,
        'city' => $city, 'products' => $products, 'order_info' => $order_info
      ));
      return $pdf->download('cancelledorder.pdf');
    }

    public function updateOrderQty(Request $request){
      $count=count($request->qty);
        for($i=0;$i<$count;$i++){

        $oldQty=DB::table('order_itemmeta')
        ->where('order_id',$request->order_id)
        ->where('order_item_id',$request->order_item_id[$i])
        ->where('meta_key','_qty')
        ->first();



        $stuTotal=DB::table('order_itemmeta')
        ->where('order_id',$request->order_id)
        ->where('order_item_id',$request->order_item_id[$i])
        ->where('meta_key','_line_subtotal')
        ->first();
        
        $unitPrice=$stuTotal->meta_value/$oldQty->meta_value;

      //   dd($unitPrice);

        $term=DB::table('order_itemmeta')
        ->where('order_id',$request->order_id)
        ->where('order_item_id',$request->order_item_id[$i])
        ->where('meta_key','_qty')
        ->update(['meta_value'=>$request->qty[$i]]);

        $term=DB::table('order_itemmeta')
        ->where('order_id',$request->order_id)
        ->where('order_item_id',$request->order_item_id[$i])
        ->where('meta_key','_line_subtotal')
        ->update(['meta_value'=>$request->qty[$i]*$unitPrice]);

        $term=DB::table('order_itemmeta')
        ->where('order_id',$request->order_id)
        ->where('order_item_id',$request->order_item_id[$i])
        ->where('meta_key','_line_total')
        ->update(['meta_value'=>$request->qty[$i]*$unitPrice]);

        //decrement stock from attribute
        $attribute_stock=DB::table('postmeta')
        ->where('post_id',$request->att_id[$i])
        ->where('meta_key','attribute_stock')
        ->first();

        if(isset($attribute_stock)){
           $tot_stock=$attribute_stock->meta_value-$request->qty[$i];
           DB::table('postmeta')
           ->where('post_id',$request->att_id[$i])
           ->where('meta_key','attribute_stock')
           ->update([
             'meta_value' => $tot_stock
           ]);
        }

        //decrement stock from default
        $default_stock=DB::table('postmeta')
        ->where('post_id',$request->product_id[$i])
        ->where('meta_key','default_qty')
        ->first();
          if(isset($default_stock)){
           $tot_stock=$default_stock->meta_value-$request->qty[$i];
           DB::table('postmeta')
           ->where('post_id',$request->product_id[$i])
           ->where('meta_key','default_qty')
           ->update([
             'meta_value' => $tot_stock
           ]);
        }
      }
      session()->flash("success","Order quantity and stock has been update successfully");
      return back();
    }

    public function processingOrderPrint($id){
      $order = Post::where('post_type','shop_order')
      ->where('ID',$id) 
      ->get();
      $pdf = PDF::loadView('admin.order.processing_order_pdf', array('order' => $order));
      return $pdf->download('processingorder.pdf');
    }

    public function processingOrderEdit($id)
    {
      $order = Post::where('post_type', 'shop_order')
      ->where('ID', $id)
      ->get();
      return view('admin.order.processing_order_edit',compact('order'));
    }

    public function processingOrderCancel($id)
    {
      DB::table('posts')->where('ID',$id)->update([
        'post_status' => 'cancelled',
        'post_modified' => date('Y-m-d H:i:s'),
      ]);
      session()->flash("success", "Order has been cancel");
      return back();
    }

    public function processingOrderDispatch($id)
    {
      DB::table('posts')->where('ID',$id)->update([
        'post_status' => 'dispatch',
        'post_modified' => date('Y-m-d H:i:s'),
      ]);
      session()->flash("success", "Order has been dispatch");
      return back();
    }

    public function processingOrderUpdate(Request $request){

      DB::table('postmeta')->where('post_id',$request->order_id)->where('meta_key','first_name')->update([
        'meta_value'=>$request->first_name
      ]);
      DB::table('postmeta')->where('post_id', $request->order_id)->where('meta_key', 'last_name')->update([
        'meta_value' => $request->last_name
      ]);
      DB::table('postmeta')->where('post_id', $request->order_id)->where('meta_key', 'address_one')->update([
        'meta_value' => $request->address
      ]);
      session()->flash("success", "Information update successfully");
      return back();

    }

    public function processingOrderdatewise(Request $request){
     $start=$request->start;
     $end=$request->end;
     $extraInfo = array(
      'title' => "Brand List",
      'page' => 'processing'
    );
     $date = \Carbon\Carbon::today()->subDays(30);
     $order = Post::where('post_type', 'shop_order')
     ->whereBetween('post_date',[$start,$end])
     ->where('post_status', 'processing')
     ->where('post_modified', '>=', $date)
     ->paginate(20);
     $total_order = Post::where('post_type', 'shop_order')
     ->whereBetween('post_date', [$start, $end])
     ->where('post_status', 'processing')
     ->where('post_modified', '>=', $date)
     ->count();
     return view('admin.order.processing_date_wise', compact('order', 'total_order'))->with($extraInfo);

   }

   public function dispatchOrderDelivered($id){
    DB::table('posts')->where('ID',$id)->update([
      'post_status' =>'delivered',
      'post_modified' => date('Y-m-d H:i:s'),
    ]);
    session()->flash("success", "Order has been delivered");
    return redirect()->route('order.dispat');
  }

// public function dispatchOrderEdit($id){
//     $order=Post::where('ID',$id)->first();
//     $order_item = Post::where('ID', $id)->get();
//     return view('admin.order.dispatch_order_edit',compact('order','order_item'));
// }


  public function dispatchOrderdatewise(Request $request)
  {
    $extraInfo = array(
      'title' => "Brand List",
      'page' => 'processing'
    );
    $date = \Carbon\Carbon::today()->subDays(30);
    $order = Post::where('post_type', 'shop_order')
    ->where('ID', $request->order_id)
    ->where('post_status', 'dispatch')
    ->where('post_modified', '>=', $date)
    ->paginate(20);
    $total_order = Post::where('post_type', 'shop_order')
    ->where('ID', $request->order_id)
    ->where('post_status', 'dispatch')
    ->where('post_modified', '>=', $date)
    ->count();
    return view('admin.order.dispatch_date_wise', compact('order', 'total_order'))->with($extraInfo);
  }


  public function dispatchOrderEdit($id)
  {
    $order = Post::where('ID', $id)->first();
    $orders_data = Post::where('ID', $id)->get();
    $order_item = Post::where('ID', $id)->get();
    return view('admin.order.dispatch_order_edit', compact('order', 'order_item', 'orders_data'));
  }


  public function dispatchOrdercancel(Request $request)
  {


    if ($request->full_order == 'full') {
      $status_change = DB::table('posts')->where('ID', $request->order_id)->update([
        'post_status' => 'cancelled',
        'post_modified' => date('Y-m-d'),
      ]);
      $order_items= DB::table('order_items')->where('order_id', $request->order_id)->get();

      foreach ($order_items as $items) {

        $itemQty=DB::table('order_itemmeta')
        ->where('order_id', $items->order_id)
        ->where('order_item_id', $items->order_item_id)
        ->where('meta_key', '_qty')
        ->first();


     // old stock
        $oldQty=DB::table('postmeta')->where('post_id', $items->product_id)->where('meta_key','qty')->first();

        $newQty=$oldQty->meta_value+$itemQty->meta_value;
        DB::table('postmeta')->where('post_id', $items->product_id)->where('meta_key','qty')->update([
          'meta_value'=>$newQty]);

      }

    } else {
      dd($request->partial_cancel);
    }
    return redirect(route('order.dispat'));
  }
  public function testpdf($id=1){    

    if($id==1){
      $data=[];
      $pdf = PDF::loadView('admin.pdf.order.test',array('order' => $data));
      return $pdf->download('testpdf.pdf');
    }
    else{
     return view('admin.pdf.order.test');
   }

 }

 public function exceldispatchOrderdate(Request $request){
  $start=$request->start;
  $end = $request->end;
  $extraInfo = array(
    'title' => "Brand List",
    'page' => 'processing'
  );
        //   $date = \Carbon\Carbon::today();
  $order = Post::where('post_type', 'shop_order')
  ->where('post_status', 'dispatch')
  ->whereBetween('post_modified',[$start,$end])
  ->paginate(20);
  return view('admin.order.excelDispatchdate', compact('order'))->with($extraInfo); 
}


public function deliveryInvoiceData(Request $request){
  $order_id=$request->order_id;
  $date = $request->order_date;
  if($order_id=='' && $date==''){
    session()->flash("error", "Enter Invoice No Or Date");
    return redirect()->back();
  }
  if($order_id!=NULL){
    $order = Post::where('post_type', 'shop_order')
    ->where('post_status', 'delivered')
    ->where('ID',$order_id)
    ->get();
  }
  if($date!=NULL){
    $order = Post::where('post_type', 'shop_order')
    ->where('post_status', 'delivered')
    ->whereBetween('post_modified', [date('Y-m-d 00:00:00', strtotime($date)), date('Y-m-d 23:59:59', strtotime($date))])
    ->get();
  }
  return view('admin.order.deliveryInvoiceData',compact('order'));

}

public function deliveredOrderEdit($id){        
 $extraInfo = array(
  'title' => "Order Edit",
  'page' => 'order'
);
 $order = Post::find($id);
 $products = Order_item::where('order_id', $id)->whereNotNull('product_id')->get();
 $order_info = DB::table('postmeta')->where('post_id', $order->ID)->get();
 return view('admin.order.deliveryEdit', compact('order', 'products', 'id', 'order_info'))->with($extraInfo);   

}

public function updateDeliveryOrder(Request $request){
  $count=count($request->qty);

  for($i=0;$i<$count;$i++){

    $oldQty=DB::table('order_itemmeta')
    ->where('order_id',$request->order_id)
    ->where('order_item_id',$request->order_item_id[$i])
    ->where('meta_key','_qty')
    ->first();

    $stuTotal=DB::table('order_itemmeta')
    ->where('order_id',$request->order_id)
    ->where('order_item_id',$request->order_item_id[$i])
    ->where('meta_key','_line_subtotal')
    ->first();
    if($oldQty && $stuTotal){    
      $unitPrice=$stuTotal->meta_value/$oldQty->meta_value;
    }
    else{
      $startPrice=DB::table('postmeta')
      ->where('post_id',$request->product_id[$i])
      ->where('meta_key','sale_price')
      ->first();
      $unitPrice=$startPrice->meta_value;
    }
    $term=DB::table('order_itemmeta')
    ->where('order_id',$request->order_id)
    ->where('order_item_id',$request->order_item_id[$i])
    ->where('meta_key','_qty')
    ->update(['meta_value'=>$request->qty[$i]]);

    $term=DB::table('order_itemmeta')
    ->where('order_id',$request->order_id)
    ->where('order_item_id',$request->order_item_id[$i])
    ->where('meta_key','_line_subtotal')
    ->update(['meta_value'=>$request->qty[$i]*$unitPrice]);

    $term=DB::table('order_itemmeta')
    ->where('order_id',$request->order_id)
    ->where('order_item_id',$request->order_item_id[$i])
    ->where('meta_key','_line_total')
    ->update(['meta_value'=>$request->qty[$i]*$unitPrice]);
  }
  return redirect(route('order.deliver'));
}

public function deliveredOrderPrint($id){
  $order=Post::where('ID',$id)->first();
  $total_parcel=Order_item::where('order_id', $id)->count();
  $name =DB::table('postmeta')->where('post_id',$id)->where('meta_key','first_name')->first();
  $address =DB::table('postmeta')->where('post_id',$id)->where('meta_key','address_one')->first();
  $phone = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'phone')->first();
  $city = DB::table('postmeta')->where('post_id', $id)->where('meta_key', 'city')->first();
  $products = Order_item::where('order_id', $id)->whereNotNull('product_id')->get();
  $order_info = DB::table('postmeta')->where('post_id',$order->ID)->get();
  $pdf = PDF::loadView('admin.order.deliveryInvoice',array('order' => $order, 'name' => $name,'phone'=>$phone,
    'city'=>$city,'products'=>$products,'order_info'=> $order_info,'address'=>$address,'total_parcel'=>$total_parcel));
  return $pdf->download('delivery_invoice.pdf');
}
public function deliveredOrderCancel($id){
  DB::table('posts')->where('ID',$id)->update([
    'post_status' =>'cancelled'
  ]);
  session()->flash("success","Status has been changed Successfully");
  return back();

}

public function deliveryInvoiceDataDetails($id){
  $order = Post::find($id);
  $products = Order_item::where('order_id', $id)->whereNotNull('product_id')->get();
  $order_info = DB::table('postmeta')->where('post_id', $order->ID)->get();
  return view('admin.order.deliveryInvoiceDataDetails', compact('order', 'products', 'id', 'order_info'));   
}

public function allStatusSearch(Request $request){
  $extraInfo = array(
    'title' => "Order List",
    'page' => 'order'
  );
  $order_id=$request->order_id;
  $email = $request->email;
  $mobile = $request->mobile;

  if($order_id=='' && $email=='' && $mobile==''){
    session()->flash("error", "Please enter some keyword to search");
    return redirect()->back();
  }

  if($order_id!=NULL){
    $order = Post::where('posts.post_type', 'shop_order')
    ->where('ID', '=', $order_id)
    ->orderBy('ID', 'DESC')
    ->paginate(20);
  }
  if($email!=NULL){
    $order = Post::where(['meta_key' => 'email', 'meta_value' => $email, 'post_type' => 'shop_order'])
    ->join('postmeta', 'posts.ID', '=', 'postmeta.post_id')
    ->orderBy('ID', 'DESC')
    ->paginate(20);
  }
  if($mobile!=NULL){
    $order = Post::where(['meta_key'=>'phone','meta_value'=>$mobile,'post_type'=>'shop_order'])
    ->join('postmeta','posts.ID','=', 'postmeta.post_id')
    ->orderBy('ID', 'DESC')
    ->paginate(20);
  }
  return view('admin.order.search_order_id', compact('order'))->with($extraInfo);
}

}
