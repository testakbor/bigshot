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

    public function orderItemMeta()
    {
        return $this->hasManyThrough(
            'App\Model\front\Order_item',
            'App\Model\front\Order_itemmeta',
            'order_item_id', // Foreign key on cars table...
            'order_id', // Foreign key on owners table...
            'ID', // Local key on mechanics table...
            'order_item_id' // Local key on cars table...
        );
    }


}
