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
            ->paginate(5); 
        }else{
            $categories=DB::table('term_taxonomy')
            ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
            ->where('term_taxonomy.taxonomy','product_cat')
            ->where('terms.name', 'like', '%' .$q. '%')
            ->select('term_taxonomy.*','terms.name','terms.status')
            ->orderBy('term_taxonomy.term_taxonomy_id','desc')
            ->paginate(10); 
        }
                    
        return view('admin.category.list',compact('categories'))->with($extraInfo);
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
       $this->validate($request,[
        'categoryName'=>'required|min:3',
        ]);    
       $termInfo=array(
           'name'=>$request->categoryName,
           'status'=>$request->status,
           'slug'=>Str::slug($request->categoryName)
       );
       $term=DB::table('terms')->insertGetId($termInfo);

       $termTexonomyInfo=array(
           'term_id'=>$term,
           'taxonomy'=>'product_cat',
           'description'=>'',
       );
       $term=DB::table('term_taxonomy')->insert($termTexonomyInfo);
       session()->flash("success","Information saved Successfully");
       return redirect(route('category.index'));
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
    public function edit($id)
    {
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
        return view('admin.category.list',compact('categories','category'))->with($extraInfo);
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
        $this->validate($request,[
            'categoryName'=>'required|min:3',
        ]);    
           $termInfo=array(
               'name'=>$request->categoryName,
               'status'=>$request->status,
               'slug'=>Str::slug($request->categoryName)
           );
           $term=DB::table('terms')
           ->where('term_id',$id)
           ->update($termInfo);
           session()->flash("success","Information Update Successfully");
           return redirect(route('category.index'));
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
