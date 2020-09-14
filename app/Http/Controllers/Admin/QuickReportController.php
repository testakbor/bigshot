<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;

class QuickReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function index()
    {
        $extraInfo=array(
            'title'=>"Quick Report",
            'page'=>'quickReport'
        );
        $products=DB::table('posts')
        ->where('posts.post_type','product')
        ->paginate(10);                
        return view('admin.quickReport.index',compact('products'))->with($extraInfo);
    }
}
