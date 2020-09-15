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
            'page'=>'products'
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
            'post_name'=>$request->post_title,
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
        
// product attributes
        if($request->valueName  !=null ){
            $attribute=[];
            foreach($request->valueName as $value){

                $detailVal= DB::table('term_taxonomy')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->where('term_taxonomy.term_id',$value)
                ->select('term_taxonomy.*','terms.name')
                ->first();

                $attribute[]=array(
                    'taxonomy'=>$detailVal->taxonomy,
                    'term'=>$detailVal->name
                );

            }
            $attribute=json_encode($attribute);
            $attributeMeta=array(
                'post_id'=>$post_id,
                'meta_key'=>'default_attribute',
                'meta_value'=> $attribute
            );
            DB::table('postmeta')->insert($attributeMeta);
        }       

        // product categories
        if($request->category !=null){
            foreach ($request->category as  $value) {
             DB::table('term_relationships')->insert(['object_id'=>$post_id,'term_taxonomy_id'=>$value]); 
         }
     }


     // product tag
     if(count($request->tag) > 0){
        foreach ($request->tag as  $value) {
         DB::table('term_relationships')->insert(['object_id'=>$post_id,'term_taxonomy_id'=>$value]); 
     }
 }

     // brand
 if($request->brand){
    DB::table('term_relationships')->insert(['object_id'=>$post_id,'term_taxonomy_id'=>$request->brand]); 
}

     // sale price and reqgular price
// $productPrice=[
//     'regular_price'=>$request->regular_price,
//     'sale_price'=>$request->sale_price,
//     'weight'=>$request->weight,
//     'length'=>$request->length,
//     'width'=>$request->width,
//     'height'=>$request->height
// ];
// DB::table('postmeta')->insert($productPrice);  

    // sale price and reqgular price
    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'stock_status','meta_value'=>$request->stock_status]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'regular_price','meta_value'=>$request->regular_price]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'sale_price','meta_value'=>$request->sale_price]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'weight','meta_value'=>$request->weight]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'length','meta_value'=>$request->length]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'width','meta_value'=>$request->width]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'height','meta_value'=>$request->height]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'qty','meta_value'=>$request->stockQuality]);

    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'alert_qty','meta_value'=>$request->lowStockThreshold]);
    
    // product image 
$image_name=null;
if($request->hasFile('product_image')){
    $image_name = time().'.'.$request->product_image->getClientOriginalExtension();
    $request->product_image->move(('backend/products'), $image_name);

    $porductImage=array(
        'post_id'=>$post_id,
        'meta_key'=>'attached_file',
        'meta_value'=>$image_name
    );

    $postmeta=DB::table('postmeta')->insert($porductImage);
}
        // gallery image
if($request->hasFile('galleryImage'))
{
    $galleryImage = [];
    foreach($request->file('galleryImage') as $image)
    {
        $filename = $image->getClientOriginalName();
        $image->move(('backend/products'), $filename);

      
        $porductGalleryImage=array(
            'post_id'=>$post_id,
            'meta_key'=>'gallery_file',
            'meta_value'=>$filename
        );
    
        $postmeta=DB::table('postmeta')->insert($porductGalleryImage);
    }

}

session()->flash("success","Information saved Successfully");
return redirect(route('product.index'));

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
