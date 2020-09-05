<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Cart;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function cart()
    {
        $info= Cart::getContent();
        
    	return view('front.cart',compact('info'));
    }

    public function addCart(Request $request){    
        
        Cart::add(array(
            array(
                'id' => $request->id,
                'price' =>$request->price,
                'quantity' => $request->quantity,
                'name' => $request->name,
                'options' => array()
            )
                )
            );
      return redirect(route('product-page',$request->id));
    }
    
    public function index()
    {
        //
    }

    public function checkout(Request $request){
        $post_date=date('Y-m-d H:i:s');
        $post_date_gmt=date('Y-m-d H:i:s',strtotime('+6 hour'));
         $order=array(
            'post_title'=>'Order'.date('Y-m-d H:i:s'),
            'post_status'=>'on-hold',
            'post_name'=>'order-'.date('M-d-Y-Hm'),
            'post_password'=>'order_1247',
            'post_date'=>$post_date,
            'post_date_gmt'=>$post_date_gmt,
            'post_type'=>'shop_order',

        );
        $order_id=DB::table('posts')->insertGetId($order);
        // dd($order_id);
        

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_postcode',
            'meta_value'=>'khilkhat',
        );
        DB::table('postmeta')->insert($order_post); 

        dd($order_post);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        
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
        //
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
