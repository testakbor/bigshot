<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use DB;
use Session;
use Auth;
class PageController extends Controller
{
     public function passwordEdit($id)
    {
        $user=DB::table('users')->where('id',$id)->first();
        return view('user.profile.password-change',compact('user'));
        
    }
    public function passwordUpdate(Request $request, $id)
    {
        $user=DB::table('users')
        ->where('id',$id)
        ->update(
            [
                'name'=>$request->first_name,
                'password'=>$request->n_password,
                'status'=>$request->status
            ]
        );


        session()->flash("success","Information Update Successfully");
        return redirect(url('profile'));

    }
}
