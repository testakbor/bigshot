<?php

namespace App\Http\Controllers\Search;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SearchController extends Controller
{

    public function nSearch()
    {
    $q = Input::get ( 'q' );
    $user = users::where ( 'name', 'LIKE', '%' . $q . '%' )->orWhere ( 'email', 'LIKE', '%' . $q . '%' )->get ();
    if (count ( $user ) > 0)
        return view ( 'front.home' )->withDetails ( $user )->withQuery ( $q );
    else
        return view ( 'front.home' )->withMessage ( 'No Details found. Try to search again !' );
    }
}
