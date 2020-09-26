<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\admin\attribute_taxonomie;
use DB;
use Session;
use Illuminate\Support\Facades\Auth;
use DataTables;

class ProductController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function index(Request $request)
    {
        $extraInfo=array(
            'title'=>"Product List",
            'page'=>'product'
        );
        if ($request->ajax()) {
        $data=DB::table('posts')
        ->where('posts.post_type','product')
        ->orderBy('ID','DESC')
        ->get(); 
        return Datatables::of($data)
        ->addIndexColumn()
        ->addColumn('action', function($row){
            $btn = '<a target="_blank" class="btn btn-primary" title="View Profile" href="'.route('product.edit',$row->ID).'"> <i class="fa fa-edit"></i> Edit</a>';
            return $btn;
        })
        ->rawColumns(['action'])
        ->make(true);       
        }        
        return view('admin.product.list')->with($extraInfo);
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
            $attributes=json_encode($attribute);
            $attributeMeta=array(
                'post_id'=>$post_id,
                'meta_key'=>'default_attribute',
                'meta_value'=> $attributes
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
    DB::table('postmeta')->insert(['post_id'=>$post_id,'meta_key'=>'product_stock','meta_value'=>$request->product_stock]);
    
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

// product edit
public function edit($id)
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

        $product=DB::table('posts')
                ->where('ID',$id)
                ->first();

        // product categorys                
        $texonomoys=DB::table('term_relationships')
                  ->join('term_taxonomy', 'term_taxonomy.term_taxonomy_id', '=', 'term_relationships.term_taxonomy_id')
                  ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                  ->where('object_id',$id)
                  ->where('term_taxonomy.taxonomy','product_cat')
                  ->select('terms.name')
                  ->get();
        $nameTaxonomy=array();
            foreach ($texonomoys as  $value) {
            array_push($nameTaxonomy,$value->name);
        }      
          // product tag                
        $texonomoys=DB::table('term_relationships')
                  ->join('term_taxonomy', 'term_taxonomy.term_taxonomy_id', '=', 'term_relationships.term_taxonomy_id')
                  ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                  ->where('object_id',$id)
                  ->where('term_taxonomy.taxonomy','product_tag')
                  ->select('terms.name')
                  ->get();
        $tagTaxonomy=array();
            foreach ($texonomoys as  $value) {
            array_push($tagTaxonomy,$value->name);
        }                  
       
          // product band                
        $texonomoys=DB::table('term_relationships')
                  ->join('term_taxonomy', 'term_taxonomy.term_taxonomy_id', '=', 'term_relationships.term_taxonomy_id')
                  ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                  ->where('object_id',$id)
                  ->where('term_taxonomy.taxonomy','product_brand')
                  ->select('terms.name')
                  ->get();
        $bandTaxonomy=array();
            foreach ($texonomoys as  $value) {
            array_push($bandTaxonomy,$value->name);
        }                  
       
        // product image 
        $image=DB::table('postmeta')
                ->where('post_id',$id)
                ->where('meta_key','attached_file')
                ->first();

        // product pice 
        $image=DB::table('postmeta')
                ->where('post_id',$id)
                ->where('meta_key','attached_file')
                ->first();

    $stock_status=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'stock_status'])->first();
    $regular_price=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'regular_price'])->first();
    $sale_price=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'sale_price'])->first();
    $weight=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'weight'])->first();
    $length=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'length'])->first();
    $width=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'width'])->first();
    $height=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'height'])->first();
    $qty=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'qty'])->first();
    $alert_qty=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'alert_qty'])->first();
    $stock=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'product_stock'])->first();
    $allAttribute=DB::table('postmeta')->where(['post_id'=>$id,'meta_key'=>'default_attribute'])->first();
    if($allAttribute){ 
    $arributeArray=json_decode($allAttribute->meta_value);
    }
    else{
        $arributeArray=array();
    }


    $attributes=attribute_taxonomie::where('status',1)->get();
    return view('admin.product.edit',compact('brands','categories','tags','attributes',
    'product','nameTaxonomy','tagTaxonomy','bandTaxonomy','image',
    'stock_status','regular_price','sale_price','weight',
    'length','width','height','qty','alert_qty','arributeArray','stock'
    ))->with($extraInfo);

    }

    public function update(Request $request,$id){

        $postDelete=DB::table('posts')->where('ID',$id)->delete();
        $postmetaDelete=DB::table('postmeta')->where('post_id',$id)->delete();
        $term_relationships=DB::table('term_relationships')->where('object_id',$post_id)->delete();
        dd($request);
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
            $attributes=json_encode($attribute);
            $attributeMeta=array(
                'post_id'=>$post_id,
                'meta_key'=>'default_attribute',
                'meta_value'=> $attributes
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
else{
    
     $porductImage=array(
        'post_id'=>$post_id,
        'meta_key'=>'attached_file',
        'meta_value'=>$request->oldImage
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

session()->flash("success","Information saved Updated");
return redirect(route('product.index'));
    }

}
