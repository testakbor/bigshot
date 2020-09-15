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
    public function manStock()
    {
       return view('admin.quickReport.man_stock');
    }
    public function womenStock()
    {
       return view('admin.quickReport.women_stock');
    }
    public function salesReport()
    {
       return view('admin.quickReport.sales_report');
    }
    public function deliveryReport()
    {
       return view('admin.quickReport.delivery_report');
    }
    public function rejectItem()
    {
       return view('admin.quickReport.reject_item');
    }
    public function bestSelling()
    {
       return view('admin.quickReport.best_selling');
    }
    public function cancellationItems()
    {
       return view('admin.quickReport.cancellation_items');
    }
    public function soldoutStock()
    {
       return view('admin.quickReport.soldout_stock');
    }
    public function bestCustomer()
    {
       return view('admin.quickReport.best_customer');
    }
    public function grossProfit()
    {
       return view('admin.quickReport.gross_profit');
    }
}
