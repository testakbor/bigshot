<?php

use App\Model\front\Order_item;
?>
@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <div class="row mb-2">
        <div class="col-sm-6">
          <!-- <h1>Pending Order</h1> -->
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Pending Order</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
    <div class="s002">
      <form method="post" action="{{route('s_pending_order')}}">
       @csrf() 
       <fieldset>
        <legend>Search Pending Order</legend>
      </fieldset>
      <div class="inner-form ml-5">

        <div class="input-field second-wrap">
          <div class="icon-wrap">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
              <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
            </svg>
          </div>
          <input class="datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date"/>

        </div>
        <div class="input-field third-wrap">
          <div class="icon-wrap">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
              <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
            </svg>
          </div>
          <input class="datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date"/>
        </div>
        
        <div class="input-field fifth-wrap">
          <button type="submit" class="btn-search" type="button">SEARCH</button>
        </div>
      </div>
    </form>
  </div>
</section>
<!-- Main content -->
<section class="content">
  <div class="container">
    <div class="card">
      <div class="card-body">
        <div class="table-responsive-sm">
          <table class="table table-striped">
            <thead>
              <tr>
                <th class="center">Oder Id</th>
                <th>Name</th>
                <th>SKU</th>
                <!-- <th class="right">Color</th> -->
                <th class="center">Qty</th>
                <th class="right">Item</th>
                <th class="right">Address</th>
                <th class="right">Mobile</th>
                <th class="right">Amount</th>
                <th class="right">Status</th>
                <th class="right">Action</th>
                <!-- <th class="right">Comments</th> -->
              </tr>
            </thead>
            <tbody>
              @php $product_name=''; $qty=0; $sub=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $cust=''; @endphp
              @foreach($orders as $items)
              @php 
              foreach ($items->productMeta as $value) {
                if($value->meta_key=="first_name"){
                  $customer=$value->meta_value;      
                } 
                if($value->meta_key=="address_one"){
                  $address=$value->meta_value;                   
                }
                if($value->meta_key=="phone"){
                  $phone=$value->meta_value;                   
                }
              }
              $count=count($items->orderItem); 
              // $count=1;
              $i=1;
              foreach ($items->orderItem as $orderMetas) {
                $qtys=DB::table('order_itemmeta')
                ->where('order_item_id',$orderMetas->order_item_id)
                ->where('meta_key','_qty')
                ->first();  
                 $sub_total=DB::table('order_itemmeta')
                ->where('order_id',$orderMetas->order_id)
                ->where('meta_key','_line_subtotal')
                ->groupBy('order_id')
                ->sum('meta_value');  
                $sku=DB::table('postmeta')
                ->where('post_id',$orderMetas->product_id)
                ->where('meta_key','_sku')
                ->first();    
                $posts=DB::table('posts')
                ->where('ID',$orderMetas->product_id)        
                ->first();    
                if($i==1):
                @endphp  
                <tr>
                  <td rowspan="{{$count}}" class="center">{{$items->ID}}</td>
                  <td rowspan="{{$count}}" class="left strong">{{$customer}}</td>
                  @php
                endif;
                  if($i ==1 ):
                   @endphp
                   <td  class="left">{{$sku->meta_value}} </td>
                   <td  class="left">{{$qtys->meta_value}} </td>
                   <td  class="left">{{$posts->post_title}} </td>
                   @php 
                 endif;
                 @endphp
                 @php
                 if($i >1):
                   @endphp
                   <tr>
                     <td  class="left"> {{$sku->meta_value}} </td>
                     <td  class="left"> {{$qtys->meta_value}} </td>
                     <td  class="left"> {{$posts->post_title}} </td>
                   </tr>
                   @php 
                 endif;
                 if($i==1):
                 @endphp
                 <td rowspan="{{$count}}" class="right">{{$address}}</td>
                 <td rowspan="{{$count}}" class="right">{{$phone}}</td>
                 <td rowspan="{{$count}}" class="right">{{$sub = $sub_total}}</td>
                 <td rowspan="{{$count}}" class="right">{{$items->post_status}}</td>
                 <td rowspan="{{$count}}" class="right">
                  <a href="{{route('pending_order_print',$items->ID)}}" class="btn btn-success btn-sm"> <i class="fas fa-print"> </i> Print</a><br>
                  <a onclick="return confirm('are you sure??')" href="{{route('pending_order_processing',$items->ID)}}" class="btn btn-primary btn-sm" ><i class="fas fa-spinner"> </i>Processing</a><br>
                  <a href="{{route('pending_order_edit',$items->ID)}}" class="btn btn-warning btn-sm"> <i class="fas fa-edit"> </i>Edit</a><br>
                  <a onclick="return confirm('are you sure??')" href="{{route('pending_order_cancel',$items->ID)}}" class="btn btn-danger btn-sm"> <i class="fas fa-window-close"> </i> Cancel</a>
                </td>

              </tr>

              @php
            endif;
              $i++;
            }

            @endphp
            @php 
            $grandTotal += $sub;
            @endphp   

            @endforeach 

          </tbody>
          {{$orders->links()}}
        </table>
      </div>

      <div class="row">
        <div class="col-lg-4 col-sm-5">

        </div>

      </div>

    </div>
  </div>
</div>
<div class="container">
  <div class="row">
   <div class="col-md-4">
    <div class="box bg-primary">
      <!-- <i class="fa fa-lemon ml-1"></i> -->

      <h3 class="text-center">{{$total_orders}}</h3>

      <p class="lead text-center font-weight-bold">Total Order</p>
    </div>
  </div>
  <div class="col-md-4">
    <div class="box bg-success">
      <!-- <i class="fa fa-user ml-1"></i> -->


      <h3 class="text-center">{{$total_orders}}</h3>

      <p class="lead text-center font-weight-bold">Total Item</p>
    </div>
  </div>
  <div class="col-md-4">
    <div class="box bg-info">
      <!-- <i class="fa fa-handshake ml-1"></i> -->


      <h3 class="text-center"> {{$grandTotal}}</h3>

      <p class="lead text-center font-weight-bold">Total Amount</p>
    </div>
  </div>
</div>       

</div>
</section>
<!-- /.row -->
</div><!-- /.container-fluid -->

<!-- /.content -->
<!--  </div> -->
@endsection

@section('js')

@endsection