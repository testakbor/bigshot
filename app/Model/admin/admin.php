<?php

namespace App\Model\admin;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;


class admin extends Authenticatable
{
       use Notifiable,HasRoles;
       protected $guard_name='admin';      

    protected $fillable=[
        'name','email','password','status','phone','role_id'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
    
    public function role(){
        return $this->belongsTo('App\Model\Role');
    }
}