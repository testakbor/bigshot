<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\Permission;
use App\Model\Role;
use App\Model\RolePermission;
use Session;
use Illuminate\Support\Facades\Hash;

class RoleController extends Controller
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
  
        $user=Role::orderBy('id','DESC')->paginate(10);
        $role=Permission::all();
        return view('role_management.role.index',compact('user','role'));
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
        $create= new Role();
        $create->name=$request->name;
        $create->save();
        $id=$create->id;

        for($i=0;$i<count($request->role_id);$i++){
          $role_permission=new RolePermission();
           $role_permission->role_id=$id;
           $role_permission->permission_id=$request->role_id[$i];
           $role_permission->save();
        }
        session()->flash("success","Role & permission has been created successfully");
        return redirect(route('role.index'));
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
        $role=Role::find($id);
        $assign_permission=RolePermission::where('role_id',$id)
        ->join('permissions','role_permissions.permission_id','=','permissions.id')
        ->select('permissions.name')
        ->get();
        $all_role=Role::orderBy('id','DESC')->paginate(10);
        $permission=Permission::all();
        return view('role_management.role.edit',compact('role','all_role','permission','assign_permission'));
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
        Role::where('id',$id)->update([
        'name'=>$request->name,
        ]);
        RolePermission::where('role_id',$id)->delete();
          for($i=0;$i<count($request->permission_id);$i++){
          $role_permission=new RolePermission();
           $role_permission->role_id=$id;
           $role_permission->permission_id=$request->permission_id[$i];
           $role_permission->save();
        }
        session()->flash("success","Role & permission has been update successfully");
        return redirect(route('role.index'));
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
