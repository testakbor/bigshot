<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Session;
class SettingsController extends Controller
{
    public function index(){
     $district=DB::table('term_taxonomy')->where('taxonomy','district')
        ->join('terms','terms.term_id','=', 'term_taxonomy.term_id')
        ->select('terms.term_id','terms.name as district')
        ->get();
      return view('settings.district',compact('district'));  
    }

    public function districtStore(Request $request){
       $terms=DB::table('terms')->insert([
         'name' =>$request->district,
         'slug' =>lcfirst($request->district),
         'term_group' =>0,
         'status' =>1,
       ]);
       $id=DB::getPdo()->lastInsertId();
       DB::table('term_taxonomy')->insert([
         'taxonomy' =>'district',
         'term_id' =>$id,
         'parent' =>0, 
       ]);
       session()->flash("success","Information saved Successfully");
       return back();
    }

    public function thanaStore(Request $request){
       DB::table('terms')->insert([
         'name' =>$request->thana,
         'slug' =>lcfirst($request->thana),
         'term_group' =>0,
         'status' =>1,
       ]);
      $term_id=DB::getPdo()->lastInsertId();
      DB::table('term_taxonomy')->insert([
         'taxonomy' =>'city',
         'term_id' =>$term_id,
         'parent' =>$request->dist_id, 
       ]); 
       DB::table('term_taxonomy')->insert([
         'taxonomy' =>'postcode',
         'term_id' =>$term_id,
         'parent' =>$term_id, 
         'description' =>$request->postcode, 
       ]);
       session()->flash("success","Information saved Successfully");
       return back();
    }

    public function districtEdit($id){
        $district=DB::table('term_taxonomy')->where('taxonomy','district')
        ->join('terms','terms.term_id','=', 'term_taxonomy.term_id')
        ->select('terms.term_id','terms.name as district')
        ->get();
         $dist_name=DB::table('terms')->where('term_id',$id)->first();
         return view('settings.district_edit',compact('district','dist_name'));
    }

    public function districtUpdate(Request $request,$id){
       DB::table('terms')->where('term_id',$id)->update([
         'name' =>$request->district,
         'slug' =>lcfirst($request->district),
       ]);
       session()->flash("success","Information update Successfully");
       return back();
    }

    public function thanaEdit($dist_id,$thana_id){
       $district=DB::table('term_taxonomy')->where('taxonomy','district')
        ->join('terms','terms.term_id','=', 'term_taxonomy.term_id')
        ->select('terms.term_id','terms.name as district')
        ->get();
         $thana=DB::table('terms')->where('term_id',$thana_id)->first();
         $postcode=DB::table('term_taxonomy')->where(['taxonomy'=>'postcode','term_id'=>$thana_id])->first();
         $dist_name=DB::table('terms')->where('term_id',$dist_id)->first();
         return view('settings.thana_edit',compact('district','thana','postcode','dist_name'));
    }

    public function districtThanaPostcodeUpdate(Request $request,$thana_id){
       DB::table('term_taxonomy')->where(['taxonomy'=>'postcode','term_id'=>$thana_id])->update([
         'description' =>$request->postcode,
       ]);
         DB::table('terms')->where(['term_id'=>$thana_id])->update([
         'name' =>$request->thana,
         'slug' =>lcfirst($request->thana),
       ]);
      session()->flash("success","Information update Successfully");
       return back();
    }
}
