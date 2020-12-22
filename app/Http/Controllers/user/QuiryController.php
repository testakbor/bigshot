<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Session;
class QuiryController extends Controller
{
    //
    public function generalQuiry(Request $request){
        $info=array(
            'post_type'=>'genarel_quiry',           
            'post_author'=>auth()->user()->id,
            'post_title'=>$request->subject,
            'post_content'=>$request->message           
        );
        $insert=DB::table('posts')->insert($info);
        session()->flash("success","Information Insert Successfully");
        return redirect(route('profile'));

    }

     //full order cancel
     public function support_all_cancel_order(Request $request){
        if($request->cancel_option=='full'){
            $order_id=$request->customer_order_id;

            //status change from post table
            DB::table('posts')
            ->where('post_type','shop_order')
            ->where('ID',$order_id)
            ->update([
                'post_status'=>'cancelled',
                'post_modified'=>date('Y-m-d H:i:s'),
                'post_content'=>$request->c_reason
            ]);

            //update stock from postmeta table
            if($request->pro_id!=null){
              for($i=0;$i<count($request->pro_id);$i++){
                 $order_qty=$request->quantity[$i]; 

                 $d_stock=DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','default_qty')
                 ->first();
                if(isset($d_stock)){
                 $ac_qty_default=$d_stock->meta_value+$order_qty;
                 DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','default_qty')
                 ->update([
                   'meta_value' =>$ac_qty_default
                 ]);
                }

                 $a_stock=DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','attribute_stock')
                 ->first();

                 if(isset($a_stock)){
                   $at_update_stock=$a_stock->meta_value+$order_qty;
                   DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','attribute_stock')
                 ->update([
                   'meta_value' =>$at_update_stock
                 ]);
                 }
              }
            }
            //cancel all quantity from order item meta table 
            $order_data=DB::table('order_itemmeta')
            ->where('order_id',$order_id) 
            ->where('meta_key','_qty')
            ->update([
                'meta_value' =>0
            ]);
        }

        if($request->cancel_option=='partial'){
            $order_id=$request->customer_orders_id;

            //status change from post table
            DB::table('posts')
            ->where('post_type','shop_order')
            ->where('ID',$order_id)
            ->update([
                'post_status'=>'cancelled',
                'post_modified'=>date('Y-m-d H:i:s'),
                'post_content'=>$request->c_reason
            ]);
            if($request->check_id!=null){
                  for($i=0;$i<count($request->check_id);$i++){
                 $order_qty=$request->quantity[$i]; 

                 $d_stock=DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','default_qty')
                 ->first();
                if(isset($d_stock)){
                 $ac_qty_default=$d_stock->meta_value+$order_qty;
                 DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','default_qty')
                 ->update([
                   'meta_value' =>$ac_qty_default
                 ]);
                }

                 $a_stock=DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','attribute_stock')
                 ->first();

                 if(isset($a_stock)){
                   $at_update_stock=$a_stock->meta_value+$order_qty;
                   DB::table('postmeta')
                 ->where('post_id',$request->pro_id[$i])
                 ->where('meta_key','attribute_stock')
                 ->update([
                   'meta_value' =>$at_update_stock
                 ]);
                 }
              }
              DB::table('order_itemmeta')
            ->where('order_id',$order_id) 
            ->where('meta_key','_qty')
            ->update([
                'meta_value' => $order_qty
            ]);
            }
        }
        session()->flash("success","Order has been cancel Successfully");
        return back();
        
     }


}
