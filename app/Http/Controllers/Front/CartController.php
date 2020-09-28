<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Cart;
use auth;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function cart()
    {;
        $info= Cart::getContent();
        if(Auth::check()){
            $user_info=DB::table('usermeta')
            ->where('user_id',auth()->user()->id)
            ->get();
        }else{
            $user_info=[];
        }
        return view('front.cart',compact('info','user_info'));
    }

    public function addCart(Request $request){   
    if ($request->quantity>$request->main_qty) {
          return back()->with('status','Quantity limit Exists');
          exit();
     }else{
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
        return redirect(route('product-page',$request->id))->with('status','Product added in Cart');
     }
        
        
    }
    
    public function index()
    {
        //
    }

    public function checkout(Request $request){
        if(\Auth::check()){
             $id=auth()->user()->id;
        }else{
            $id=0;
        }
        $post_date=date('Y-m-d 0:0:0)');
        $post_date_gmt=date('Y-m-d H:i:s',strtotime('+6 hour'));
        $order=array(
            'post_title'=>'Order'.date('Y-m-d H:i:s'),
            'post_status'=>'on-hold',
            'post_name'=>'order-'.date('M-d-Y-Hm'),
            'post_password'=>'order_1247',
            'post_date'=>$post_date,
            'post_date_gmt'=>$post_date_gmt,
            'post_type'=>'shop_order',
            'post_author'=>$id,
        );
        $order_id=DB::table('posts')->insertGetId($order);
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'first_name',
            'meta_value'=>$request->first_name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'last_name',
            'meta_value'=>$request->last_name,
        );
        DB::table('postmeta')->insert($order_post); 
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'address_one',
            'meta_value'=>$request->address_one,
        );
        DB::table('postmeta')->insert($order_post);  
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'address_two',
            'meta_value'=>$request->address_two,
        );
        DB::table('postmeta')->insert($order_post);  
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'phone',
            'meta_value'=>$request->phone,
        );
        DB::table('postmeta')->insert($order_post); 
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'country',
            'meta_value'=>$request->country,
        );
        DB::table('postmeta')->insert($order_post); 
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'state',
            'meta_value'=>$request->state,
        );
        DB::table('postmeta')->insert($order_post); 
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'city',
            'meta_value'=>$request->city,
        );
        DB::table('postmeta')->insert($order_post);   
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'zip',
            'meta_value'=>$request->zip,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post=array(
            'post_id'=>$order_id,
            'meta_key'=>'_customer_user',
            'meta_value'=>$id,
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
        $pro=DB::table('postmeta')->where('post_id',$item->id)->where('meta_key','qty')->get();
        foreach($pro as $pros){
           $ac_qty=$pros->meta_value;
           $customer_qty=$item->quantity;
           $tot_qty=$ac_qty-$customer_qty;
           DB::table('postmeta')->where('post_id',$item->id)->where('meta_key','qty')->update([
               'meta_value' => $tot_qty,
           ]);
        }
        $order_item=array(
            'order_item_name'=>$item->name,
            'order_item_type'=>'line-item',
            'order_id'=>$order_id,
            'product_id'=>$item->id
        );
        $order_item_id=DB::table('order_items')->insertGetId($order_item);
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_tax_class',
            'meta_value'=>'',
            'customer_id'=>$id,
            'order_id' => $order_id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_qty',
            'meta_value'=>$item->quantity,
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_product_id',
            'meta_value'=>$item->id,
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_variation_id',
            'meta_value'=>'',
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_subtotal',
            'meta_value'=>$item=Cart::getSubTotal(),
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_total',
            'meta_value'=>$item=Cart::getTotal(),
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);  
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_subtotal_tax',
            'meta_value'=>'',
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);   
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_tax',
            'meta_value'=>'',
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);
        // $_line_tax_data=date('Y-m-d H:i:s');
        $_line_tax_data_gmt=date('Y-m-d H:i:s',strtotime('+6 hour'));
           $order_item_details=array(
            'order_item_id'=>$order_item_id,
            'meta_key'=>'_line_tax_data',
            'meta_value'=>$_line_tax_data_gmt,
            'order_id'=>$order_id,
            'customer_id'=>$id,
            'order_date'=>date('Y-m-d'),
        );
           DB::table('order_itemmeta')->insert($order_item_details);
        }
        Cart::clear();
        return redirect(route('order.success'));
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
    public function update(Request $request)
    {
       

        $qty=$request->quantity;
        $product_id=$request->product_id;
        
         Cart::update($product_id, 
            ['quantity' => 
            ['relative' => false,
             'value' => $qty ]
            ]);
         return back()->with('status','Item update done');

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
    public function remove($id)
    {
        // dd('id');
        Cart::remove($id);
        return redirect(route('cart'))->with('status','Product delete from cart');
    }
}
