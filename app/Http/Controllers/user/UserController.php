<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

use DB;
use Session;
use Auth;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        //
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
        $user=DB::table('users')->where('id',$id)->first();
        $user_info=DB::table('usermeta')->where('user_id',$id)->get();
        return view('user.profile.edit',compact('user','user_info'));
        
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
        if($request->user_image==''){
         $image_name=$request->d_image;
        }else{
            $image_name = time() . '.' . $request->user_image->getClientOriginalExtension();
            $request->user_image->move(('assets/front/user/'), $image_name);
        }
        $user=DB::table('users')
        ->where('id',$id)
        ->update(
            [
                'name'=>$request->first_name,
                'password'=>$request->n_password,
                'status'=>$request->status
            ]
        );
        $user_count=DB::table('usermeta')->where('user_id',$id)->count();
        if($user_count==0){
        $user_info=array(
            'meta_key'=>'first_name',
            'meta_value'=>$request->first_name,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'last_name',
            'meta_value'=>$request->last_name,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);    
        $user_info=array(
            'meta_key'=>'address_one',
            'meta_value'=>$request->address_one,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'address_two',
            'meta_value'=>$request->address_two,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'phone',
            'meta_value'=>$request->phone,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'country',
            'meta_value'=>$request->country,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'state',
            'meta_value'=>$request->state,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'city',
            'meta_value'=>$request->city,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'zip',
            'meta_value'=>$request->zip,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
       }else{
          DB::table('usermeta')->where('user_id',$id)->delete();
          $user_info=array(
            'meta_key'=>'first_name',
            'meta_value'=>$request->first_name,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'last_name',
            'meta_value'=>$request->last_name,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);    
        $user_info=array(
            'meta_key'=>'address_one',
            'meta_value'=>$request->address_one,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'address_two',
            'meta_value'=>$request->address_two,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'phone',
            'meta_value'=>$request->phone,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'country',
            'meta_value'=>$request->country,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'state',
            'meta_value'=>$request->state,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'city',
            'meta_value'=>$request->city,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);
        $user_info=array(
            'meta_key'=>'zip',
            'meta_value'=>$request->zip,
            'user_id'=>$id
        );
        DB::table('usermeta')->insert($user_info);

        $user_info = array(
                'meta_key' => 'user_image',
                'meta_value' =>$image_name,
                'user_id' => $id
            );
        DB::table('usermeta')->insert($user_info);
       }

       if($request->status==0){
            Auth::logout();
            return Redirect::route('home');
        }

        session()->flash("success","Information Update Successfully");
        return redirect(url('profile'));

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
