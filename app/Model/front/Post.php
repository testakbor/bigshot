<?php

namespace App\Model\front;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
   public function productMeta(){
        return $this->hasMany('\App\Model\front\Postmeta','post_id','ID');
   }
   public function orderItem(){
        return $this->hasMany('App\Model\front\Order_item','order_id','ID');
   }
 

  

    // public function orderItemMeta()
    // {
    //     return $this->hasManyThrough(
    //         'App\Model\front\Order_item',
    //         'App\Model\front\Order_itemmeta',
    //         'order_item_id',
    //         'order_id', 
    //         'ID', 
    //         'order_item_id'
    //     );
    // }


}
