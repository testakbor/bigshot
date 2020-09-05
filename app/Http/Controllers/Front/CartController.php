<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

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
        dd($request);
        $post_date_gmt=date('Y-m-d H:i:s',strtotime('+6 hour'));
         $product=array(
            // 'post_name'=>$request->post_title,
            // 'post_content'=>$request->post_content,
            'post_excerpt'=>$request->post_excerpt,
            'post_status'=>'publish',
            // 'post_author'=>Auth::user()->id,
            'post_date'=>$post_date,
            'post_date_gmt'=>$post_date_gmt,
            'to_ping'=>'',
            'pinged'=>'',
            'post_content_filtered'=>'',
            'post_type'=>'shop_order',

        );
        $post_id=DB::table('posts')->insertGetId($product);


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
