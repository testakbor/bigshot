@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Best Selling Items</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Best Selling Items</li>
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
                Best Selling Items</h3>
              </div>

              <div class="card-body">
                <table class="table table-bordered table-striped">
                  <thead class="bg-success">                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Product Name</th>
                      <th>Quantity</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                   @php $qty=0; @endphp 
                   @foreach($order as $key=>$orders)
                     @php $order_data=DB::table('order_itemmeta')
                     ->where(['order_id'=>$orders->ID,'meta_key'=>'_qty'])
                     ->sum('meta_value'); @endphp
                    <tr>
                      <td>{{++$key}}</td>
                      <td>ddd</td>
                      <td>{{$order_data}}</td>
                      <td></td>
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