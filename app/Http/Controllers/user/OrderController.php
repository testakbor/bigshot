<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Model\front\Post;
use App\Model\front\Postmeta;
use App\Model\front\Order_item;
use Auth;
use DB;
class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

       $shop_order=Post::
        where('post_type','shop_order')
       ->where('post_author',auth()->user()->id)
       ->select('ID','post_date','post_status','post_modified')
       ->orderBy('ID','DESC')
       ->paginate(20);
       return view('front.order.list',compact('shop_order'));
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
        //
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
        $order=Post::find($id);
        $products=Order_item::where('order_items.order_id',$id)   
        ->whereNotNull('product_id')
        ->get();
        $extraInfo=array(
            'title'=>"Order Edit",
            'page'=>'order'
        );
        $order_info=DB::table('postmeta')
        ->where('post_id',$id)
        ->get();
        $status=DB::table('posts')->where('ID',$id)->select('post_status')->first();
        return view('front.order.edit',compact('order','products','order_info','status'))->with($extraInfo);
    }

 

    //cancel order
    public function cancelOrder($id){
      $check=DB::table('posts')
            ->where('post_type', 'shop_order')
            ->where('ID', $id)
            ->where('post_status', 'on-hold')  
            ->count();
     if($check>0){
      $status=DB::table('posts')
      ->where('post_type','shop_order')
      ->where('ID',$id)->update([
       'post_status'=> 'Cancelled'
      ]);
      session()->flash("success", "Your Order Has Been Cancelled");
      return back();
     }else{
     session()->flash("error", "Your Can't Change the order Status because the order has already been Processing");
     return back();
     }
    }

    public function cancel_order_details($id){
        $order = Post::find($id);
        $order_item=Order_item::where('order_id',$id)->get();
        return view('front.order.cancel_data', compact('order','order_item'));
    }

    public function single_item_cancel($id){

        $orderQty=DB::table('order_itemmeta')
            ->where('order_item_id',$id)
            ->where('meta_key', '_qty')
            ->first();
        $orderDetails = DB::table('order_itemmeta')
        ->where('order_item_id', $id)
        ->first();
        $find_product_id=DB::table('order_items')->where('order_item_id',$id)->first();
        $product_qty=DB::table('postmeta')
        ->where(['post_id'=>$find_product_id->product_id,'meta_key'=>'qty'])
        ->first();
        $update_qty=$orderQty->meta_value+$product_qty->meta_value;
        DB::table('postmeta')
        ->where(['post_id' => $find_product_id->product_id, 'meta_key' => 'qty'])
        ->update([
            'meta_value'=>$update_qty
        ]);
        DB::table('order_itemmeta')->insert([
            'order_item_id'=>$id,
            'meta_key'=>'product_status',
            'meta_value'=>'cancel',
            'order_id' => $orderDetails->order_id,
            'order_date' => $orderDetails->order_date,
            'customer_id' => $orderDetails->customer_id,
        ]);
       session()->flash("success", "Item has been Cancelled Successfully");
       return back();
    }

    public function cancel_order_item(Request $request){
      if($request->request_qty>$request->ac_qty){
       session()->flash("error", "Your cancel quantity must be less than or equal your order quantity");
       return back();
      }
       if($request->request_qty==0){
       session()->flash("error", "Quantity must be greater than zero");
       return back();
      }
      $cancel_qty=$request->request_qty;

      //stock increase
      $product_current_qty=DB::table('postmeta')
      ->where('post_id',$request->product_id)
      ->where('meta_key','qty')
      ->first();
      $product_update_stock=$product_current_qty->meta_value+$cancel_qty;
      DB::table('postmeta')
      ->where('post_id',$request->product_id)
      ->where('meta_key','qty')
      ->update([
         'meta_value' => $product_update_stock
       ]);

      //order item cancel quantity update with price
        $cancel_quantity=DB::table('order_itemmeta')
      ->where('order_id',$request->cancel_order_id)
      ->where('order_item_id',$request->cancel_item_id)
      ->where('meta_key','cancel_quantity')
      ->count();
      $order_date=DB::table('order_itemmeta')
      ->where('order_id',$request->cancel_order_id)
      ->first();
      if($cancel_quantity==0){
        DB::table('order_itemmeta')->insert([
            'order_item_id' =>$request->cancel_item_id,
            'order_id' =>$request->cancel_order_id,
            'meta_key' =>'cancel_quantity',
            'meta_value' =>$request->request_qty,
            'customer_id' =>auth()->user()->id,
            'order_date' =>$order_date->meta_value
        ]);
      }else{
        $ac_cancel_quantity=DB::table('order_itemmeta')
      ->where('order_id',$request->cancel_order_id)
      ->where('order_item_id',$request->cancel_item_id)
      ->where('meta_key','cancel_quantity')
      ->count()+$request->request_qty;
       DB::table('order_itemmeta')
      ->where('order_id',$request->cancel_order_id)
      ->where('order_item_id',$request->cancel_item_id)
      ->where('meta_key','cancel_quantity')
      ->update([
          'meta_value' =>$ac_cancel_quantity
       ]);
      }
       session()->flash("success", "Order has been cancelled Successfully");
       return back();
        
    }


    public function cancel_order_item_full(Request $request){
       DB::table('posts')
       ->where('post_type','shop_order')
       ->where('ID',$request->order_id)
       ->update([
          'post_status' =>'cancel',
          'post_content' =>$request->reason,
          'post_modified' =>date('Y-m-d H:i:s'),
       ]);
       $count_product_id=$request->pro_id;
       for($i=0;$i<count($count_product_id);$i++){
         $q=$request->quantity[$i];
         $pro_id=$count_product_id[$i];
         $pro_qty=DB::table('postmeta')
         ->where('post_id',$pro_id)
         ->where('meta_key','qty')
         ->first();
         $update_qty=$pro_qty->meta_value+$q;
         DB::table('postmeta')
         ->where('post_id',$pro_id)
         ->where('meta_key','qty')
         ->update([
             'meta_value' => $update_qty
         ]);
       }
       DB::table('order_itemmeta')
      ->whereIn('order_item_id',$request->item_id)
      ->where('meta_key','_qty')
      ->update([
          'meta_value' =>0
       ]);

       DB::table('order_itemmeta')
      ->whereIn('order_item_id',$request->item_id)
      ->where('meta_key','_line_subtotal')
      ->update([
          'meta_value' =>0
       ]);

      DB::table('order_itemmeta')
      ->whereIn('order_item_id',$request->item_id)
      ->where('meta_key','_line_total')
      ->update([
          'meta_value' =>0
       ]);
       DB::table('order_itemmeta')
      ->whereIn('order_item_id',$request->item_id)
      ->where('meta_key','delivery_charge')
      ->update([
          'meta_value' =>0
       ]);
       session()->flash("success", "Order has been cancelled Successfully");
       return redirect()->route('order-list.index');
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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
