<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

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
        return view("admin/home")->with($extraInfo);
    }
}
 