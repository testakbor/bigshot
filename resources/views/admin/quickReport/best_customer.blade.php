@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Best Customer</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Best Customer</li>
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
           
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                Best Customer</h3>
              </div>
              <form method="get" action="">
              <div class="form-group">
                <div class="row">

        
                <div class="col-md-3"> 
                  <label>Start Date</label>
                  <input type="date" class="form-control" name="start" required>
                </div>

                <div class="col-md-3"> 
                  <label>End Date</label>
                  <input type="date" class="form-control" name="end" required>
                </div>

                <div class="col-md-3"> 
                  <label>Item Quantity</label>
                  <input type="text" class="form-control" name="item_qty" placeholder="Enter Quantity" required>
                </div>

                <button type="submit" class="btn btn-success btn-sm">Search</button>
           
                   </div>
                </div>
                </form>
              <div class="card-body">
                <table class="table table-bordered table-striped">
                  <thead class="bg-success">                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Customer Name</th>
                      <th>Mobile</th>
                      <th>Total Quantity</th>
                    </tr>
                  </thead>
                  <tbody>
                    @php $phone=''; @endphp
                     @foreach($customer as $key=>$cust)
                      @php 
                        $user_info=DB::table('usermeta')
                        ->where('user_id',$cust->customer_id)
                        ->where('meta_key','phone')
                        ->get(); 
                      @endphp
                      @foreach($user_info as $info)
                        @php $phone=$info->meta_value; @endphp
                       @endforeach
                 
                      <tr>
                        <td>{{++$key}}</td>
                        <td>{{$cust->name}}</td>
                        <td>{{$phone}}</td>
                        <td>{{$cust->tot_qty}}</td>
                      </tr>
                 
                    @endforeach
                  </tbody>
                </table>
              </div>
              <div class="d-flex justify-content-center">            
                                  
              </div>  
            </div>
          
          </div>
        

          </div>

        </div>
      
      </div>
    </section>

  </div>
@endsection