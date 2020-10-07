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
       ->paginate(2);
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
        $products=Order_item::where('order_id',$id)
        ->whereNotNull('product_id')
        ->get();
        $extraInfo=array(
            'title'=>"Order Edit",
            'page'=>'order'
        );
        $order_info=DB::table('postmeta')
        ->where('post_id',$id)
        ->get();
         return view('front.order.edit',compact('order','products','order_info'))->with($extraInfo);
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


    public function cancel_order_item(Request $request){
        $count = count($request->submit_quantity);
        for ($i = 0; $i < $count; $i++) {
            $oldQty = DB::table('order_itemmeta')
                ->where('order_id', $request->order_id)
                ->where('order_item_id',$request->order_item_id[$i])
                ->where('meta_key','_qty')
                ->first();
                $p=DB::table('postmeta')->where('post_id',$request->product_id[$i])->where('meta_key','qty')->select('post_id','meta_value')->first();
                $stock_update_qty = $oldQty->meta_value-$request->submit_quantity[$i]+$p->meta_value;
                $stuTotal = DB::table('order_itemmeta')
                    ->where('order_id', $request->order_id)
                    ->where('order_item_id', $request->order_item_id[$i])
                    ->where('meta_key', '_line_subtotal')
                    ->first();
                $unitPrice = $stuTotal->meta_value / $oldQty->meta_value;
                //    dd($unitPrice);
                $term = DB::table('order_itemmeta')
                    ->where('order_id',$request->order_id)
                    ->where('order_item_id', $request->order_item_id[$i])
                    ->where('meta_key','_qty')
                    ->update(['meta_value' => $request->submit_quantity[$i]]);
                $term = DB::table('order_itemmeta')
                    ->where('order_id', $request->order_id)
                    ->where('order_item_id', $request->order_item_id[$i])
                    ->where('meta_key', '_line_subtotal')
                    ->update(['meta_value' => $request->submit_quantity[$i] * $unitPrice]);
                $term = DB::table('order_itemmeta')
                    ->where('order_id', $request->order_id)
                    ->where('order_item_id', $request->order_item_id[$i])
                    ->where('meta_key', '_line_total')
                    ->update(['meta_value' => $request->submit_quantity[$i] * $unitPrice]);
                $postmeta = DB::table('postmeta')
                    ->where('post_id', $request->product_id[$i])
                    ->where('meta_key', 'qty')
                    ->update(['meta_value' => $stock_update_qty]);
                $status = DB::table('posts')->where('ID', $request->order_id)->update([
                    'post_status' => 'cencelled',
                    'post_modified' => date('Y-m-d H:i:s'),
                ]);
                session()->flash("success", "Quantity has been cancelled Successfully");
                return back();
        }
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
