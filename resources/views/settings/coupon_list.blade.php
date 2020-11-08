@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Coupon List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Coupon List</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        @include('admin.includes.messages')
        <div class="row">
          <div class="col-md-5">
            <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">{{isset($category)?'Edit Coupon':'Add Coupon'}}</h3>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                @if(isset($category))
                <form role="form" method="POST" action="{{route('coupon.update',$category->id)}}" >
                  {{ csrf_field() }}
                  {{ method_field('PATCH') }}
                  <div class="card-body">
                     <div class="form-group">
                      <label for="categoryName">Coupon Code</label>
                      <input type="text" name="coupon_code" class="form-control" id="categoryName" value="{{$category->coupon_code}}" placeholder="Enter Code" required>
                    </div>    
                    
                     <div class="form-group">
                      <label for="categoryName">Coupon Amount</label>
                      <input type="text" name="coupon_amount" class="form-control" id="categoryName" value="{{$category->coupon_amount}}" placeholder="Enter Amount" required>
                    </div>

                     <div class="form-group">
                      <label for="categoryName">Expire Date</label>
                      <input type="date" name="expire_date" class="form-control" value="{{$category->expire_date}}" value="{{$category->expire_date}}" id="categoryName" required>
                    </div> 

                      <div class="form-group">
                      <label for="categoryName">Status</label>
                      <select class="form-control" name="status">
                        @if($category->status==1) 
                          <option value="1" selected>Active</option>
                           <option value="0">Inactive</option>
                          @else
                          <option value="0" selected>Inactive</option>
                          <option value="1">Active</option>
                        @endif
                       
                      </select>
                    </div>
                  </div>
                  <!-- /.card-body -->
                  <div class="card-footer">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>  Update</button>
                  </div>
                </form>
                @else
                <form role="form" method="POST" action="{{route('coupon.store')}}" >
                  {{csrf_field()}}
                  <div class="card-body">
                    <div class="form-group">
                      <label for="categoryName">Coupon Code</label>
                      <input type="text" name="coupon_code" class="form-control" id="categoryName" placeholder="Enter Code" required>
                    </div>    
                    
                     <div class="form-group">
                      <label for="categoryName">Coupon Amount</label>
                      <input type="text" name="coupon_amount" class="form-control" id="categoryName" placeholder="Enter Amount" required>
                    </div>

                     <div class="form-group">
                      <label for="categoryName">Expire Date</label>
                      <input type="date" name="expire_date" class="form-control" value="{{date('Y-m-d')}}" id="categoryName" required>
                    </div>     
                  </div>
                  <!-- /.card-body -->
                  <div class="card-footer">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Add Coupon</button>
                  </div>
                </form>
                @endif
              </div>     
        </div>  
          <div class="col-md-7">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Coupon List</h3>
                 <form method="get" action="{{route('coupon.index')}}"> 
                    <input type="text" name="coupon" class="form-control" placeholder="Search Coupon" autocomplete="off">
                    <button class="btn btn-primary btn-sm" type="submit"><i class="fa fd-search"></i> Search</button>
                 </form>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                @if($categories->count()==0) No Data Found @endif
                <table class="table table-bordered table-striped">
                  <thead class="bg-info">                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Coupon Code</th>
                      <th>Coupon Amount</th>
                      <th>Expire Date</th>
                      <th>Status</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @php 
                    $i=1;
                    @endphp
                   @foreach($categories as $value)
                    <tr>
                      <td>{{$i}}</td>
                      <td>{{$value->coupon_code}}</td>
                      <td>{{$value->coupon_amount}}</td>
                      <td>{{$value->expire_date}}</td>
                      <td>@if($value->status==1) Active @else Inactive @endif</td>
                      <td>
                        <a href="{{route('coupon.edit',$value->id)}}" class="btn btn-primary"> <i class="fa fa-edit"></i> Edit</a>
                      </td>
                    </tr>
                    @php 
                    $i++;
                    @endphp
                   @endforeach
                  </tbody>
                </table>
              </div>
              <div class="d-flex justify-content-center">            
                {{$categories->links()}}                  
              </div>  
            </div>
            <!-- /.card -->
           

          </div>
        

          </div>
          <!-- /.col -->
        </div>
      
      
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
@endsection