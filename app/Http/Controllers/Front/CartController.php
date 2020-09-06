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
            'meta_key'=>'_shipping_address_1',
            'meta_value'=>$request->address1,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_shipping_country',
            'meta_value'=>$request->_shipping_country,
        );
        DB::table('postmeta')->insert($order_post); 
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_shipping_last_name',
            'meta_value'=>$request->lastName,
        );
        DB::table('postmeta')->insert($order_post);  
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_shipping_first_name',
            'meta_value'=>$request->firstName,
        );
        DB::table('postmeta')->insert($order_post); 
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_postcode',
            'meta_value'=>$request->zip,
        );
        DB::table('postmeta')->insert($order_post); 
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_state',
            'meta_value'=>$request->state,
        );
        DB::table('postmeta')->insert($order_post); 

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_city',
            'meta_value'=>$request->city,
        );
        DB::table('postmeta')->insert($order_post); 
        
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_address_2',
            'meta_value'=>$request->address2,
        );
        DB::table('postmeta')->insert($order_post); 

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_address_1',
            'meta_value'=>$request->address1,
        );
        DB::table('postmeta')->insert($order_post);   

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_address_2',
            'meta_value'=>$request->address2,
        );
        DB::table('postmeta')->insert($order_post); 

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_country',
            'meta_value'=>$request->_billing_country,
        );
        DB::table('postmeta')->insert($order_post);

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_phone',
            'meta_value'=>$request->phone,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_email',
            'meta_value'=>$request->_billing_email,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_company',
            'meta_value'=>$request->_billing_company,
        );
        DB::table('postmeta')->insert($order_post); 

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_last_name',
            'meta_value'=>$request->lastName,
        );
        DB::table('postmeta')->insert($order_post); 

        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_billing_first_name',
            'meta_value'=>$request->firstName,
        );
     
        DB::table('postmeta')->insert($order_post); 

        $info= Cart::getContent();

        foreach ($info as  $value) {
           $order_item=array(
            'order_item_name'=>$value->name,
            'order_item_type'=>'line-item',
            'order_id'=>$order_id,
        );

        DB::table('order_items')->insert($order_item); 
 

       }

        foreach ($info as $item){

        $order_item=array(
            'order_item_name'=>$item->name,
            'order_item_type'=>'line-item',
            'order_id'=>$order_id,
        );

        $order_item_id=DB::table('order_items')->insertGetId($order_item);


           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_tax_class',
            'meta_value'=>'',
        );
           DB::table('order_itemmeta')->insert($order_item_details);

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_qty',
            'meta_value'=>$item->quantity,
        );
           DB::table('order_itemmeta')->insert($order_item_details);

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_product_id',
            'meta_value'=>'',
        );
           DB::table('order_itemmeta')->insert($order_item_details);

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_variation_id',
            'meta_value'=>'',
        );
           DB::table('order_itemmeta')->insert($order_item_details);

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_subtotal',
            'meta_value'=>$item=Cart::getSubTotal(),
        );
           DB::table('order_itemmeta')->insert($order_item_details);

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_total',
            'meta_value'=>$item=Cart::getTotal(),
        );
           DB::table('order_itemmeta')->insert($order_item_details);  

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_subtotal_tax',
            'meta_value'=>'',
        );
           DB::table('order_itemmeta')->insert($order_item_details);   

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_tax',
            'meta_value'=>'',
        );
           DB::table('order_itemmeta')->insert($order_item_details);


        // $_line_tax_data=date('Y-m-d H:i:s');
        $_line_tax_data_gmt=date('Y-m-d H:i:s',strtotime('+6 hour'));

           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_tax_data',
            'meta_value'=>$_line_tax_data_gmt,
        );
           DB::table('order_itemmeta')->insert($order_item_details);

        }
       

        // return redirect(route('order.success'));
       // dd($order_post);
       dd($order_item_details);

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
