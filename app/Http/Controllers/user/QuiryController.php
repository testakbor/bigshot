<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;
class QuiryController extends Controller
{
    //
    public function generalQuiry(Request $request){
        $info=array(
            'post_type'=>'genarel_quiry',
            'post_title'=>$request->name,
            'post_excerpt'=>$request->subject,
            'post_content'=>$request->message,
            'guid'=>$request->email
        );
        $insert=DB::table('posts')->insert($info);
        session()->flash("success","Information Insert Successfully");
        return redirect(route('profile'));

    }
}
