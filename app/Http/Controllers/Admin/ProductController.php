<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Model\admin\attribute_taxonomie;

use DB;
use Session;

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
        // attribute 

        $attributes=attribute_taxonomie::where('status',1)->get();
        return view('admin.product.create',compact('brands','categories','attributes'))->with($extraInfo);
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
