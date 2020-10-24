<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\admin\admin;
use App\Model\Role;
use Session;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
      public function __construct()
    {
        $this->middleware('auth:admin');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
  
        $user=admin::orderBy('id','DESC')->paginate(10);
        $role=Role::all();
        return view('role_management.user.index',compact('user','role'));
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
        $create= new admin();
        $create->name=$request->name;
        $create->email=$request->email;
        $create->password=Hash::make($request->password);
        $create->role_id=$request->role_id;
        $create->save();
        session()->flash("success","User has been created successfully");
        return redirect(route('user.index'));
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
        $user=admin::find($id);
        $data=admin::orderBy('id','DESC')->paginate(10);
        $role=Role::all();
        return view('role_management.user.edit',compact('user','role','data'));
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
        admin::where('id',$id)->update([
        'name'=>$request->name,
        'password'=>Hash::make($request->password),
        'role_id'=>$request->role_id,
        ]);
        session()->flash("success","User has been update successfully");
        return redirect(route('user.index'));
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
