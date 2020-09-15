<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Model\Front\Post;
use App\Model\Front\Postmeta;
use App\Model\front\Order_item;
use Carbon\Carbon;
use DB;
use Session;

use Auth;
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
         $orders=Post::where('posts.post_type','shop_order')
        ->paginate(10);       
         return view('admin.order.list',compact('orders'))->with($extraInfo);
    }

    public function pendingOrder(){
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'pendingOrder'
        );
         $orders=Post::where('posts.post_type','shop_order')
         ->where('post_status','on-hold')
         ->paginate(10); 
        $total_orders=Post::where('posts.post_type','shop_order')
            ->where('post_status','on-hold')
        ->count();  
         return view('admin.order.pendingOrder',compact('orders','total_orders'))->with($extraInfo);
    }
    
    public function search_pending_order(Request $request){
        $start=Carbon::parse($request->start)
                 ->toDateString();
        $end=Carbon::parse($request->end)
                 ->toDateString();
        $orders=Post::where('posts.post_type','shop_order')
        ->where('post_status','on-hold')
        ->whereBetween('post_date',array([$start,$end]))
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
        return view('admin.order.processing')->with($extraInfo);
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
        ->where('post_status','reject')
        ->get();
        return view('admin.order.reject',compact('reject_order'))->with($extraInfo);
    }
    public function stock()
    {    
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'stock'
        ); 
        $products=Post::where('post_type','product')
        // ->where('post_status','publish')
        ->paginate(5); 
        return view('admin.order.stock',compact('products'))->with($extraInfo);
    }
    public function lowerStock(){
        $extraInfo=array(
            'title'=>"Brand List",
            'page'=>'lowerstock'
        ); 
        $products=Post::where('post_type','product')
        // ->where('post_status','publish')
        ->paginate(5); 
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
       $products=Order_item::where('order_id',$id)->get();
       $order_info=DB::table('postmeta')
       ->where('post_id',$id)
       ->get();
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


}
