<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Cart;
use auth;
use Mail;
use Redirect;
use App\Http\Requests\CheckoutValidateRequest;

class CartController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function cart() {

        $info = Cart::getContent();
        if (Auth::check()) {
            $user_info = DB::table('usermeta')
                    ->where('user_id', auth()->user()->id)
                    ->get();
        } else {
            $user_info = [];
        }
        $district = DB::table('term_taxonomy')->where('taxonomy', 'district')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->select('terms.term_id', 'terms.name as district')
                ->get();
        return view('front.cart', compact('info', 'user_info', 'district'));
    }

    public function cart_new() {

        $info = Cart::getContent();
        if (Auth::check()) {
            $user_info = DB::table('usermeta')
                    ->where('user_id', auth()->user()->id)
                    ->get();
        } else {
            $user_info = [];
        }
        $district = DB::table('term_taxonomy')->where('taxonomy', 'district')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->select('terms.term_id', 'terms.name as district')
                ->get();
        return view('front.cart_new', compact('info', 'user_info', 'district'));
    }

    public function districtCityAjax($id) {
        $data = DB::table('term_taxonomy')->where(['taxonomy' => 'city', 'parent' => $id])
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->select('terms.name as city_name', 'terms.term_id')
                ->get();
        $charge=DB::table('term_taxonomy')->where('term_id',$id)->where('taxonomy','district')->get();
        return response()->json(['data'=>$data,'charge'=>$charge]);
    }

    public function districtCityPostcode($id) {
        $data = DB::table('term_taxonomy')->where(['taxonomy' => 'postcode', 'parent' => $id])
                ->select('description as zip')
                ->get();
        return response()->json($data);
    }

    public function addCart(Request $request) {
        if ($request->quantity > $request->main_qty) {
            return back()->with('status', 'Quantity limit Exists');
            exit();
        } else {
            Cart::add(array(
                array(
                    'id' => $request->id,
                    'price' => $request->price,
                    'quantity' => $request->quantity,
                    'name' => $request->name,
                    'options' => array()
                )
                    )
            );
            return redirect()->back()->with('status', 'Product added in Cart');
        }
    }

    public function index() {
        //
    }

    public function checkout(CheckoutValidateRequest $request) {
        if($request->coupon_taka==null){
           $coupon_taka=0;
        }else{
            $coupon_taka=$request->coupon_taka;
        }
        if ($request->paymentMethod == 'DeliveryChargeOnly') {
            $dcharge = 0;
        } else {
            $delivery_charge = DB::table('term_taxonomy')->where('term_id', $request->state)->where('taxonomy', 'district')->select('description')->first();
            $dcharge = $delivery_charge->description;
        }
        if (\Auth::check()) {
            $id = auth()->user()->id;
        } else {
            $id = 0;
        }
        $user_address = DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'address_one')->count();
        $user_district = DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'district')->count();
        $user_city = DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'city')->count();
        $user_postcode = DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'zip')->count();


        if ($user_address == 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'address_one',
                'meta_value' => $request->address_one,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'address_one')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'address_one',
                'meta_value' => $request->address_one,
            ]);
        }


        if ($user_district == 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'district',
                'meta_value' => $request->state,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'district')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'district',
                'meta_value' => $request->state,
            ]);
        }
        if ($user_city == 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'city',
                'meta_value' => $request->city,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'city')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'city',
                'meta_value' => $request->city,
            ]);
        }

        if ($user_postcode == 0) {
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'zip',
                'meta_value' => $request->zip,
            ]);
        } else {
            DB::table('usermeta')->where('user_id', $id)->where('meta_key', 'zip')->delete();
            DB::table('usermeta')->insert([
                'user_id' => $id,
                'meta_key' => 'zip',
                'meta_value' => $request->zip,
            ]);
        }
        $state = DB::table('terms')->where('term_id', $request->state)->select('name')->first();
        $city = DB::table('terms')->where('term_id', $request->city)->select('name')->first();
        $info = Cart::getContent();
        $post_date = date('Y-m-d 0:0:0)');
        $post_date_gmt = date('Y-m-d H:i:s', strtotime('+6 hour'));
        $order = array(
            'post_title' => 'Order' . date('Y-m-d H:i:s'),
            'post_status' => 'on-hold',
            'post_name' => 'order-' . date('M-d-Y-Hm'),
            'post_password' => 'order_1247',
            'post_date' => $post_date,
            'post_date_gmt' => $post_date_gmt,
            'post_type' => 'shop_order',
            'post_author' => $id,
        );
        $order_id = DB::table('posts')->insertGetId($order);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'first_name',
            'meta_value' => $request->first_name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'last_name',
            'meta_value' => $request->last_name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'address_one',
            'meta_value' => $request->address_one,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'address_two',
            'meta_value' => $request->address_two,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'phone',
            'meta_value' => $request->phone,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'email',
            'meta_value' => $request->email,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'country',
            'meta_value' => $request->country,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'state',
            'meta_value' => $state->name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'city',
            'meta_value' => $city->name,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'zip',
            'meta_value' => $request->zip,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_customer_user',
            'meta_value' => $id,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_postcode',
            'meta_value' => $request->zip,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_company',
            'meta_value' => $request->_billing_company,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_last_name',
            'meta_value' => $request->lastName,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => '_billing_first_name',
            'meta_value' => $request->firstName,
        );
        DB::table('postmeta')->insert($order_post);
        $order_post = array(
            'post_id' => $order_id,
            'meta_key' => 'payment_method',
            'meta_value' => $request->paymentMethod,
        );
        DB::table('postmeta')->insert($order_post);
        $info = Cart::getContent();
        //     foreach ($info as  $value) {
        //        $order_item=array(
        //         'order_item_name'=>$value->name,
        //         'order_item_type'=>'line-item',
        //         'order_id'=>$order_id,
        //     );
        //     DB::table('order_items')->insert($order_item); 
        //    }
        foreach ($info as $item) {
            $pro = DB::table('postmeta')->where('post_id', $item->id)->where('meta_key', 'qty')->get();
            foreach ($pro as $pros) {
                $ac_qty = $pros->meta_value;
                $customer_qty = $item->quantity;
                $tot_qty = $ac_qty - $customer_qty;
                DB::table('postmeta')->where('post_id', $item->id)->where('meta_key', 'qty')->update([
                    'meta_value' => $tot_qty,
                ]);
            }
            $order_item = array(
                'order_item_name' => $item->name,
                'order_item_type' => 'line-item',
                'order_id' => $order_id,
                'product_id' => $item->id
            );
            $order_item_id = DB::table('order_items')->insertGetId($order_item);

            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_tax_class',
                'meta_value' => '',
                'customer_id' => $id,
                'order_id' => $order_id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_qty',
                'meta_value' => $item->quantity,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_product_id',
                'meta_value' => $item->id,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_variation_id',
                'meta_value' => '',
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_subtotal',
                'meta_value' => $item->quantity * $item->price,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_total',
                'meta_value' => $item->quantity * $item->price,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_subtotal_tax',
                'meta_value' => '',
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_tax',
                'meta_value' => '',
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            // $_line_tax_data=date('Y-m-d H:i:s');
            $_line_tax_data_gmt = date('Y-m-d H:i:s', strtotime('+6 hour'));
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => '_line_tax_data',
                'meta_value' => $_line_tax_data_gmt,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);
            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'delivery_charge',
                'meta_value' => $dcharge,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);

            $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'coupon_code',
                'meta_value' => $request->promo_code,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);

             $order_item_details = array(
                'order_item_id' => $order_item_id,
                'meta_key' => 'coupon_taka',
                'meta_value' => $coupon_taka,
                'order_id' => $order_id,
                'customer_id' => $id,
                'order_date' => date('Y-m-d'),
            );
            DB::table('order_itemmeta')->insert($order_item_details);


            // if($request->paymentMethod=='DeliveryChargeOnly'){
            //    $order_item_details=array(
            //     'order_item_id'=>$order_item_id,
            //     'meta_key'=>'customer_pay_delivery_charge',
            //     'meta_value'=>$dcharge,
            //     'order_id'=>$order_id,
            //     'customer_id'=>$id,
            //     'order_date'=>date('Y-m-d'),
            //   );
            //  DB::table('order_itemmeta')->insert($order_item_details);
            // }
        }
        Cart::clear();
        // $name = $request->first_name;
        // $order_id = $order_id;
        // $user_email = $request->email;
        // Mail::send('mail', ['name' => $name, 'order_id' => $order_id], function ($m) use ($user_email) {
        //     $m->to($user_email)->subject('Order Confirmation');
        // });
        return redirect()->route('order.success');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request) {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request) {
        $qty = $request->quantity;
        $product_id = $request->product_id;
        Cart::update($product_id, ['quantity' =>
            ['relative' => false,
                'value' => $qty]
        ]);
        return back()->with('status', 'Item quantity has been update');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        //
    }

    public function remove($id) {
        // dd('id');
        Cart::remove($id);
        return redirect(route('cart'))->with('status', 'Item deleted from cart');
    }

        //promo code ajax
    public function applyPromocode($code){
       $data=DB::table('coupons')
       ->where('coupon_code',$code)
       ->where('status',1)
       ->where('expire_date','>=',date('Y-m-d'))
       ->select('coupon_code','coupon_amount')
       ->get(); 
        return response()->json($data);
    }

}
