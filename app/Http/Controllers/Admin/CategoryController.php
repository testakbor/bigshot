<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    
    public function index(Request $request)
    {
        if($request->user()->can('create-category')) {
            $q=$request->category;
            $extraInfo=array(
                'title'=>"Category List",
                'page'=>'category'
            );
            if($request->category==''){
                $categories=DB::table('term_taxonomy')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->where('term_taxonomy.taxonomy','product_cat')
                ->select('term_taxonomy.*','terms.name','terms.status')
                ->orderBy('term_taxonomy.term_taxonomy_id','desc')
                ->paginate(50); 
            }else{
                $categories=DB::table('term_taxonomy')
                ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                ->where('term_taxonomy.taxonomy','product_cat')
                ->where('terms.name', 'like', '%' .$q. '%')
                ->select('term_taxonomy.*','terms.name','terms.status')
                ->orderBy('term_taxonomy.term_taxonomy_id','desc')
                ->paginate(50); 
            }         

            $term_groups=DB::table('term_taxonomy')
            ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
            ->where('term_taxonomy.taxonomy','term_group')
            ->select('term_taxonomy.*','terms.name','terms.status')
            ->orderBy('term_taxonomy.term_taxonomy_id','desc')
            ->get(); 

            return view('admin.category.list',compact('categories','term_groups'))->with($extraInfo);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {      

        if($request->user()->can('create-category')) {
         $this->validate($request,[
            'categoryName'=>'required|min:3',
        ]);    

         if($request->manageTrem=='on'){
            $termInfo=array(
             'name'=>$request->categoryName,
             'status'=>$request->status,
             'slug'=>Str::slug($request->categoryName)
         );
            $term=DB::table('terms')->insertGetId($termInfo);

            $termTexonomyInfo=array(
             'term_id'=>$term,
             'taxonomy'=>'term_group',
             'description'=>'',
         );
            $term=DB::table('term_taxonomy')->insert($termTexonomyInfo);
        }else{
            $termInfo=array(
             'name'=>$request->categoryName,
             'status'=>$request->status,
             'term_group'=>$request->term_group,
             'slug'=>Str::slug($request->categoryName)
         );
            $term=DB::table('terms')->insertGetId($termInfo);

            $termTexonomyInfo=array(
             'term_id'=>$term,
             'taxonomy'=>'product_cat',
             'description'=>'',
         );
            $term=DB::table('term_taxonomy')->insert($termTexonomyInfo);
        }
        session()->flash("success","Information saved Successfully");
        return redirect(route('category.index'));
    }
}

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id,Request $request)
    {
       if($request->user()->can('create-category')) {
        $extraInfo=array(
            'title'=>"Category Edit",
            'page'=>'category'
        );
        $category=DB::table('terms')
        ->where('term_id',$id)
        ->first();
        $categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->paginate(3);

        $term_groups=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','term_group')
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get(); 



        return view('admin.category.list',compact('categories','category','term_groups'))->with($extraInfo);
    }
}

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {  
       if($request->user()->can('create-category')) {     
        $this->validate($request,[
            'categoryName'=>'required|min:3',
        ]);   

        if($request->manageTrem=='on'){
            $term_group=0;
            $taxonomy='term_group';
        }
        else{
           $term_group=$request->term_group;
            $taxonomy='product_cat';
       }
       $termInfo=array(
         'name'=>$request->categoryName,
         'status'=>$request->status,
         'term_group'=>$term_group,
         'slug'=>Str::slug($request->categoryName)
     );
       $term=DB::table('terms')
       ->where('term_id',$id)
       ->update($termInfo);



       $termTexonomyInfo=array(              
        'taxonomy'=>$taxonomy           
     );
       $term=DB::table('term_taxonomy')
       ->where('term_id',$id)
       ->update($termTexonomyInfo);


       session()->flash("success","Information Update Successfully");
       return redirect(route('category.index'));
   }
}

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
