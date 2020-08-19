<?php

namespace App\Http\Controllers\Front;

use DB;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index(){

        $categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('terms.status',1)
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->get();
        return view('front.home',compact('categories'));
    }
}
