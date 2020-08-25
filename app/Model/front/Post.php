<?php

namespace App\Model\front;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
   public function productMeta(){
        return $this->hasMany('App\Model\front\Postmeta');
   }
}
