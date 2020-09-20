<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(){
        $extraInfo=array(
            'title'=>"Home",
            'page'=>'home'
        );
        $total_order=DB::table('posts')->where('post_type','shop_order')->count();
        $total_product=DB::table('posts')->where('post_type','product')->count();
        $total_registration=DB::table('users')->count();
        return view("admin.home",compact('total_order','total_product','total_registration'))->with($extraInfo);
    }
}
 