<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Model\admin\attribute_taxonomie;

use DB;
use Session;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function index()
    {
        $extraInfo=array(
            'title'=>"Product List",
            'page'=>'product'
        );

        $products=DB::table('posts')
        ->where('posts.post_type','product')
        ->paginate(10);                
        return view('admin.product.list',compact('products'))->with($extraInfo);
    }

    public function create()
    {        
        $extraInfo=array(
            'title'=>"New Product",
            'page'=>'product'
        );
        // for bands
        $brands=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->leftJoin('ecommerce_termmeta', 'ecommerce_termmeta.ecommerce_term_id', '=', 'terms.term_id')
        ->leftJoin('postmeta', 'ecommerce_termmeta.meta_value', '=', 'postmeta.post_id')
        ->where('term_taxonomy.taxonomy','product_brand')
        ->select('term_taxonomy.*','terms.name','terms.status','postmeta.meta_value')
        ->get();
        // categories
        $categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->get();   

        // tag
        $tags=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_tag')
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->get();          
        // attribute 

        $attributes=attribute_taxonomie::where('status',1)->get();
        return view('admin.product.create',compact('brands','categories','tags','attributes'))->with($extraInfo);
    }

    public function store(Request $request){        
        $year=$request->year;
        $month=$request->month;
        $day=$request->day;
        $H=$request->HH;
        $min=$request->min;

        $post_date=date('Y-m-d H:i:00',strtotime($year.'-'.$month.'-'.$day.' '.$H.':'.$min.':00'));
        $post_date_gmt=date('Y-m-d H:i:s',strtotime($post_date.'+6 hour'));
      
        $product=array(
            'post_title'=>$request->post_title,
            'post_content'=>$request->post_content,
            'post_excerpt'=>$request->post_excerpt,
            'post_status'=>'publish',
            'post_author'=>Auth::user()->id,
            'post_date'=>$post_date,
            'post_date_gmt'=>$post_date_gmt,
            'to_ping'=>'',
            'pinged'=>'',
            'post_content_filtered'=>'',
            'post_type'=>'product',

        );
        $post_id=DB::table('posts')->insertGetId($product);
        dd($post_id);

    }

    public function attributeValue($id){        
     $attribute=attribute_taxonomie::where('attribute_id',$id)->first();
     $attributeValues=DB::table('term_taxonomy')
     ->join('terms','terms.term_id','=','term_taxonomy.term_id')
     ->where('taxonomy','pa_'.$attribute->attribute_label)
     ->get();  

     echo json_encode($attributeValues);

 }

}
