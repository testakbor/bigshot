<?php

namespace App\Model\front;

use Illuminate\Database\Eloquent\Model;

class Order_item extends Model
{
    public function orderMeta(){
        return $this->hasMany('\App\Model\front\Order_itemmeta','order_item_id','meta_id');
   }
}
