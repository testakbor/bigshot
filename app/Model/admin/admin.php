<?php

namespace App\Model\admin;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;


class admin extends Authenticatable
{
       use Notifiable;
       use HasRoles;

    protected $fillable=[
        'name','email','password','status','phone'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
    
}