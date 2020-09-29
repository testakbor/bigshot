@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Order List</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Order History</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <ul class="nav" style="background: gray;">
        <li class="nav-item " style="border-right: 1px solid white;">
          <a class="nav-link " href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">Pending Order</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">Processing</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">Dispatch</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">Excel Dispatch</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">Delivery Invoice</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">Delivered</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">Cancelled</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="#" style="color: aliceblue" tabindex="-1" aria-disabled="true">All Status</a>
        </li>
      </ul>

      <div class="row">

        <div class="col-md-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Order</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table class="table table-bordered table-striped">
                <thead class="bg-info">
                  <tr>
                    <th style="width: 10px">#</th>
                    <th>Order</th>
                    <th>Date</th>
                    <th>Status</th>
                    <!-- <th>Total</th> -->
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  @php
                  $i=1;
                  @endphp
                  @foreach($orders as $value)
                  @foreach ($value->productMeta as $meta)
                  @if($meta['meta_key']=='_order_total')
                  @php
                  $total=$meta['meta_value'];
                  @endphp
                  @endif

                  @endforeach
                  <tr>
                    <td>{{$i}}</td>
                    <td>{{$value->post_name}}</td>
                    <td>{{$value->post_date}}</td>
                    <td>{{$value->post_status}}</td>
                    <!-- <td>{{$value->total}}</td> -->
                    <td>
                      <a class="btn btn-success btn-sm" href="{{route('order.edit',$value->ID)}}">Change Status</a>
                      <a class="btn btn-primary btn-sm" href="{{route('download.shipping.address',$value->ID)}}">Download Shipping Address</a>
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
              {{$orders->links()}}
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