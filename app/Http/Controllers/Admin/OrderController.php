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
class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $extraInfo=array(
            'title'=>"Order List",
            'page'=>'order'
        );
        $pending_order=Post::where(['posts.post_type'=>'shop_order','post_status'=>'on-hold'])
        ->count();
        $processing_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'Processing'])
        ->count();
        $dispatch_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'Dispatch'])
        ->count();
        $delivered_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'Delivered'])
        ->count();
        $cancelled_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'Cancelled'])
        ->count();
        $reject_order = Post::where(['posts.post_type' => 'shop_order', 'post_status' => 'Failed'])
        ->count();
        $total_order_status=$pending_order+$processing_order+$dispatch_order+$delivered_order+$cancelled_order+$reject_order;     
        return view('admin.order.list',compact('pending_order','processing_order','delivered_order','cancelled_order', 'dispatch_order','total_order_status'))->with($extraInfo);
    }

    public function pendingOrder(){
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'pendingOrder'
        );
         $date = \Carbon\Carbon::today()->subDays(30);
         $orders=Post::where('posts.post_type','shop_order')
         ->where('post_status','on-hold')
         ->where('post_date','>=',$date)
         ->orderBy('ID','DESC')
        ->paginate(10); 
        
        $total_orders=Post::where('posts.post_type','shop_order')
            ->where('post_status','on-hold')
            ->where('post_date', '>=', $date)
        ->count();  
         return view('admin.order.pendingOrder',compact('orders','total_orders'))->with($extraInfo);
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
        $extraInfo=array(
            'title'=>$date." processing order List",
            'page'=>'todayPendingOrder'
        );
         $orders=Post::where('posts.post_type','shop_order')
        ->join('post_meta','posts.ID','=','post_meta.post_id')
         ->where('post_status','porcessing')
        
         ->orderBy('ID','DESC')
        ->paginate(10); 
        dd($orders);
        $total_orders=Post::where('posts.post_type','shop_order')
            ->where('post_status','on-hold')
            ->whereBetween('post_date', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])
        ->count();  
         return view('admin.order.pendingOrderByDate',compact('orders','total_orders'))->with($extraInfo);
    }
    
    public function search_pending_order(Request $request){
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
       return view('admin.order.searchOrder',compact('orders','total_orders'));
    }

    public function processing()
    {   
     $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'processing'
        );
        $date = \Carbon\Carbon::today()->subDays(30);
        $order=Post::where('post_type','shop_order')
        ->where('post_status','Processing')
        ->where('post_modified','>=',$date) 
        ->paginate(20);
        $total_order=Post::where('post_type', 'shop_order')
        ->where('post_status', 'Processing')
        ->where('post_modified', '>=', $date)
        ->count();
        return view('admin.order.processing',compact('order','total_order'))->with($extraInfo);
    } 
    public function print()
    {   
        return view('admin.order.pendingOrder_print');
    }
    public function dispat()
    {   
     $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'dispat'
        ); 
        return view('admin.order.dispat')->with($extraInfo);
    }
    public function cancelled()
    {   
     $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'cancelled'
        ); 
        return view('admin.order.cancelled')->with($extraInfo);
    }

    public function allStatus()
    {   
     $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'allStatus'
        );
        $date = \Carbon\Carbon::today()->subDays(30);
        $orders = Post::where('posts.post_type','shop_order')
        ->where('post_date','>=', $date)
        ->orderBy('ID', 'DESC')
        ->get();
        return view('admin.order.allStatus')->with($extraInfo);
    }
    public function sendParcel()
    {   
     $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'sendParcel'
        ); 
        $orders=Post::where('posts.post_type','shop_order')
        ->where('post_status','Processing')
       ->paginate(10); 
       $total_orders=Post::where('posts.post_type','shop_order')
       ->where('post_status','Processing')
       ->count();  
        return view('admin.order.sendParcel',compact('orders','total_orders'))->with($extraInfo);
    }

     public function deliveryInvoice()
    {    
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'sendParcel'
        ); 
        return view('admin.order.deliveryInvoice')->with($extraInfo);
    }
    public function reject()
    {    
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'reject'
        ); 
        $reject_order=DB::table('posts')
        ->where('post_type','shop_order')
        ->where('post_status','Cancelled')
        ->get();
        return view('admin.order.reject',compact('reject_order'))->with($extraInfo);
    }
    public function stock()
    {    
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'stock'
        ); 
        $products=DB::table('posts')
        ->where('post_type','product')
        ->paginate(10); 
        return view('admin.order.stock',compact('products'))->with($extraInfo);
    }
    public function lowerStock(){
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'lowerstock'
        ); 
        $products=DB::table('posts')
        ->where('post_type','product')
        ->paginate(10); 
        return view('admin.order.stock_lower',compact('products'))->with($extraInfo);
    }
    public function oldStock(){
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'oldstock'
        ); 
        $products=Post::where('post_type','product')
        // ->where('post_status','publish')
        ->paginate(5); 
        return view('admin.order.stock_old',compact('products'))->with($extraInfo);
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
        $orders=Post::where('posts.post_type','shop_order')
        ->where('post_status','on-hold')
        ->where('ID',$id)
       ->get();
        $pdf = PDF::loadView('admin.order.pendingOrder_print', array('orders' => $orders));
        return $pdf->download('shipping.pdf');
    }

    public function pending_order_processing($id){
        DB::table('posts')->where('ID',$id)->update([
          'post_status' =>'Processing',
          'post_modified'   =>date('Y-m-d')
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
          'post_status' =>'Cancel'
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
        return view('admin.order.edit', compact('order', 'products', 'id', 'order_info'))->with($extraInfo);     
    }

    public function sendParcelPrint(){
        $orders=Post::where('posts.post_type','shop_order')
        ->where('post_status','Processing')
       ->paginate(10); 
       $total_orders=Post::where('posts.post_type','shop_order')
       ->where('post_status','Processing')
       ->count();  
        return view('admin.order.parcel_print',compact('orders','total_orders'));
    }

    public function downloadShippingAddress($id){
        $order = Post::find($id);
        $products = Order_item::where('order_id', $id)
        ->whereNotNull('product_id')
        ->get();
        $order_info = DB::table('postmeta')->where('post_id', $order->ID)->get();
        $pdf = PDF::loadView('admin.pdf.order.shipping_address', $order_info);
        return $pdf->download('shipping.pdf');
    }

    //excel dispatch
    public function excelDispatch(){

    }

    public function deliveryInvoiceOrder(){

    }

    public function deliveredOrder(){

    }

    public function cancelledOrder()
    {

    }

    public function updateOrderQty(Request $request){

        // dd($request);
        $count=count($request->qty);
      
        for($i=0;$i<$count;$i++){
            $term=DB::table('order_itemmeta')
           ->where('order_id',$request->order_id)
           ->where('order_item_id',$request->order_item_id[$i])
           ->where('meta_key','_qty')
           ->update(['meta_value'=>$request->qty[$i]]);
        }
        return redirect(route('order.pendingOrder'));
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
            'post_status' => 'Cancelled',
            'post_modified' => date('Y-m-d'),
        ]);
        session()->flash("success", "Order has been cancel");
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
        ->where('post_status', 'Processing')
        ->where('post_modified', '>=', $date)
        ->paginate(20);
        $total_order = Post::where('post_type', 'shop_order')
        ->whereBetween('post_date', [$start, $end])
        ->where('post_status', 'Processing')
        ->where('post_modified', '>=', $date)
        ->count();
        return view('admin.order.processing_date_wise', compact('order', 'total_order'))->with($extraInfo);

    }


}
