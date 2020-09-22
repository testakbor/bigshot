<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;
use App\Model\front\Post;


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
      $data=DB::table('term_relationships')
		->leftjoin('posts','term_relationships.object_id','=','posts.ID')
		->where('term_taxonomy_id',1)
		->where('posts.post_type','product')
      ->paginate(20);
    
       return view('admin.quickReport.man_stock');
    }
    public function womenStock(Request $request)
    {
      $categories=DB::table('term_taxonomy')
      ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
      ->where('term_taxonomy.taxonomy','product_cat')
      ->select('term_taxonomy.*','terms.name','terms.status')
      ->orderBy('term_taxonomy.term_taxonomy_id','desc')
      ->get(); 
      if($request->cat_id==''){
        $cat_pro=[];
      }else{
         $cat_pro=DB::table('term_relationships')
         ->leftjoin('posts','term_relationships.object_id','=','posts.ID')
         ->where('term_taxonomy_id',$request->cat_id)
         ->where('posts.post_type','product')
         ->get();
      }
       return view('admin.quickReport.women_stock',compact('categories','cat_pro'));
    }
    public function salesReport(Request $request)
    {
       $start=$request->start;
       $end=$request->end;
       $data=DB::table('posts')
       ->where('post_type','shop_order')
       ->where('post_status','Completed')
       ->whereBetween('post_date',[$start,$end])
       ->get();
       return view('admin.quickReport.sales_report',compact('data'));
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
       $product=Post::where('post_type','product')->get();
       return view('admin.quickReport.soldout_stock',compact('product'));
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
