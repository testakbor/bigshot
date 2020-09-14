<?php

namespace App\Http\Controllers\Search;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;



class SearchController extends Controller
{

    public function nSearch(Request $request)
    {
    $q = $request->q;
    dd($q);
    }
}
