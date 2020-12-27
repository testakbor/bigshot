<?php
namespace App\Http\Controllers\Front;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\front\Post;
use App\Model\front\Postmeta;
use DB;
use Auth;
class PageController extends Controller
{
    public function productView($id,$title)
    {
        $product=Post::where('post_type','product')
        ->where('ID',$id)
        ->first();
        $category = DB::table('term_relationships')
        ->where('object_id',$id)
        ->where('taxonomy', 'product_cat')
        ->join('term_taxonomy','term_relationships.term_taxonomy_id','=','term_taxonomy.term_id')
        ->join('terms','terms.term_id','=','term_taxonomy.term_id')
        ->select('terms.term_id as cat_id')
        ->first();
        $product_related=DB::table('term_relationships')
        ->where('term_taxonomy_id',$category->cat_id)
        ->where('posts.post_type','product')
        ->where('posts.post_status','publish')
        ->join('posts','term_relationships.object_id','=','posts.ID')
		->limit(10)->get();
        $gallery_images=DB::table('postmeta')
        ->where('post_id',$product->ID)
        ->where('meta_key','gallery_file')
        ->select('meta_key','meta_value','meta_id')
        ->get();
        $allAttribute = DB::table('postmeta')->where(['post_id' => $id, 'meta_key' => 'default_attribute'])->first();
        if ($allAttribute) {
            $arributeArray = json_decode($allAttribute->meta_value);
        } else {
            $arributeArray = array();
        }
        $lists=DB::table('posts')
                            ->where('post_parent',$id)
                            ->where('meta_key','attribute')
                            ->join('postmeta','posts.ID','=','postmeta.post_id')
                            ->select('meta_value','post_id')
                            ->get(); 
        $attributes=DB::table('product_attibutes')
        ->where('post_id',$product->ID)
        ->where('parent_id',0)
        ->where('status',1)
        ->groupBy('term_id')
        ->get();        
       
        return view('front.productDetails',compact('product','product_related','gallery_images', 'arributeArray','lists','attributes'));
    }
    public function cart()
    {
        return view('front.cart');
    }
    public function OrderHistory()
    {
        return view('front.order-history');
    }
    public function OrderSuccess()
    {
        return view('front.order-success');
    }
    public function popular()
    {
        $categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('terms.status',1)
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get();
        // product 
        $products=Post::where('post_type','product')
        ->where('post_status','publish')
        ->get();
        return view('front.popular',compact('categories','products'));
    }
    public function categoryProduct($id)
    {
        $data=DB::table('term_relationships')
        ->leftjoin('posts','term_relationships.object_id','=','posts.ID')
        ->where('term_taxonomy_id',$id)
        ->where('posts.post_type','product')
        ->paginate(20);
        return view('front.Categories',compact('data'));
    }
    public function wishlist()
    {
        $wishProduct=DB::table('wishlist')
        ->leftjoin('postmeta', 'postmeta.post_id', '=', 'wishlist.product_id')
        ->where('user_id',auth()->user()->id)
        ->groupBy('wishlist.product_id')
        ->orderBy('wishlist.id','DESC')
        ->paginate(3);
        return view('front.wishlist',compact('wishProduct'));
    }
    public function wishlistProduct(Request $request)
    {
        $count=DB::table('wishlist')
        ->where('product_id',$request->id)
        ->where('user_id',Auth::user()->id)
        ->count();
        if($count>0){
          return back()->with('status_error','This item already exists in your wishlist');
        }else{
         $wishlist = array(
            'product_id' => $request->id,
            'user_id' => Auth::user()->id,
        );
        DB::table('wishlist')->insertGetId($wishlist);
        return back()->with('status_success','Product added in wishlist');
        }
    }
    public function DailyLoginBonus()
    {
        return view('front.daily-login-bonus');
    }
    public function rewards()
    {
        return view('front.rewards');
    }
    public function cash()
    {
        return view('front.cash');
    }
    public function pickupTab()
    {
        return view('front.picku-tab');
    }
    public function recent()
    {
        $products=Post::where('post_type','product')
        ->where('post_status','publish')
        ->orderBy('ID','DESC')
        ->limit(20)->get();
        return view('front.recent',compact('products'));
    }
    public function brands()
    {
          $extraInfo=array(
            'title'=>"Brands",
            'page'=>'brands'
        );
        $brands=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->leftJoin('ecommerce_termmeta', 'ecommerce_termmeta.ecommerce_term_id', '=', 'terms.term_id')
        ->leftJoin('postmeta', 'ecommerce_termmeta.meta_value', '=', 'postmeta.post_id')
        ->where('term_taxonomy.taxonomy','product_brand')
        ->select('term_taxonomy.*', 'terms.name', 'terms.status', 'postmeta.meta_value as image')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->paginate(5);
        return view('front.brands',compact('brands'))->with($extraInfo);
    }
    public function faq()
    {
        return view('front.faq');
    }
    public function profile()
    {
        $id=auth()->user()->id;
        $wishProduct=DB::table('wishlist')
        ->leftjoin('postmeta', 'postmeta.post_id', '=', 'wishlist.product_id')
        ->where('user_id',auth()->user()->id)
        ->groupBy('wishlist.product_id')
        ->orderBy('wishlist.id','DESC')
        ->paginate(3);
        $profile_image=DB::table('usermeta')->where(['user_id'=>$id,'meta_key'=>'user_image'])->first();
        return view('front.user-profile',compact('wishProduct', 'profile_image'));
    }
    public function privacy()
    {
        return view('front.privacy');
    }
    public function termsconditions()
    {
        return view('front.terms&conditions');
    }
    public function about()
    {
        return view('front.about');
    }
    public function returnPolicy()
    {
        return view('front.return-policy');
    }
    public function settings()
    {
        return view('front.settings');
    }
    public function customerSupport()
    {
        //customer order list
        $order_list=DB::table('order_itemmeta')
        ->where('customer_id',auth()->user()->id)
        ->select('order_id')
        ->groupBy('order_id')
        ->get();
        return view('front.customerSupport',compact('order_list'));
    }

    //partial cancel ajax
    public function p_cancel_ajax($id){
       $product_name=DB::table('order_items')
       ->where('order_items.order_id',$id)
       ->where('postmeta.meta_key','attribute')
       ->where('order_itemmeta.meta_key','_qty')
       ->select('order_items.order_item_id as items_id','order_item_name as product_name','postmeta.meta_value as att','order_itemmeta.meta_value as qt','order_items.product_id')
       ->leftjoin('postmeta','postmeta.post_id','=','order_items.product_id')
       ->leftjoin('order_itemmeta','order_itemmeta.order_item_id','=','order_items.order_item_id')
       ->get();  
       return response()->json(['product_name'=>$product_name]);
    }

     //full cancel ajax
    public function f_cancel_ajax($id){
       $product_name_full=DB::table('order_items')
       ->where('order_items.order_id',$id)
       ->where('postmeta.meta_key','attribute')
       ->where('order_itemmeta.meta_key','_qty')
       ->select('order_items.product_id as product_id','order_itemmeta.meta_value as qt')
       ->leftjoin('postmeta','postmeta.post_id','=','order_items.product_id')
       ->leftjoin('order_itemmeta','order_itemmeta.order_item_id','=','order_items.order_item_id')
       ->get();  
       return response()->json(['product_name_full'=>$product_name_full]);
    }

    //delete wishlist
    public function wishlistDelete($id){
      $id=base64_decode($id);
      $data=DB::table('wishlist')
      ->where('product_id',$id)
      ->where('user_id',auth()->user()->id)
      ->delete();
      return back()->with('status','Product delete from wishlist');
    }

    public function tagProduct($id){
       $product=DB::table('term_relationships')
       ->where('term_taxonomy_id',$id)
       ->where('posts.post_type','product')
       ->join('posts', 'term_relationships.object_id','=','posts.ID')
       ->get();
        return view('front.tag_product',compact('product'));
    }




    public function att_value($id,$product_id){    
      $data=DB::table('product_attibutes')
      ->where('id',$id)
      ->where('post_id',$product_id)
      ->select('term_id','term','product_parent','id')
      ->first();
      $terms=DB::table('product_attibutes')
      ->where('term_id',$data->term_id) 
         ->where('post_id',$product_id)
      ->get();
       $info=[];
      foreach($terms as $tcheck){
        $parent=$tcheck->id;

      $count=DB::table('product_attibutes')
      ->where('parent_id',$parent) 
       ->where('post_id',$product_id)
      ->count();

      if($count>0){
             $child=DB::table('product_attibutes')
      ->where('parent_id',$parent) 
       ->where('post_id',$product_id)
      ->first();
       $info[]=$child;
      }else{
           $info=0;
      }
      }
      return response()->json($info);
    }

      public function atts_value($id,$product_id){    
      $data=DB::table('product_attibutes')
      ->where('term_id',$id)
      ->where('post_id',$product_id)
      ->select('product_parent')->get();
      return response()->json($data);
    }

    public function only($id,$product_id){
      $data=DB::table('product_attibutes')
      ->where('id',$id)
      ->where('post_id',$product_id)
      ->select('product_parent')
      ->get();
      return response()->json($data);
    }

}