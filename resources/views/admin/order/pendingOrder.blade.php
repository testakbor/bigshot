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
            <input class="datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date" />

          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date" />
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
                @php $grandTotal=0; $color_array=[]; $arributeArray=''; $sku=0; $color=''; $product_general_info=[]; $product_color_info=[]; $item_name=''; $product_name=[]; $product_id=0; $qty=0; $amount=0; $order_info=[]; $customer_first_name=''; $customer_last_name=''; $customer_address=''; $customer_mobile=''; $customer_info=[]; @endphp
                @foreach($orders as $order)
                @php
                $customer_info=DB::table('order_itemmeta')
                ->where('order_id',$order->ID)
                ->join('usermeta','usermeta.user_id','=','order_itemmeta.customer_id')
                ->select('usermeta.*')
                ->get();
                $order_info=DB::table('order_itemmeta')
                ->where('order_id',$order->ID)
                ->get();
                @endphp
                @foreach($customer_info as $user_info)
                @if($user_info->meta_key=='first_name') @php $customer_first_name=$user_info->meta_value; @endphp @endif
                @if($user_info->meta_key=='last_name') @php $customer_last_name=$user_info->meta_value; @endphp @endif
                @if($user_info->meta_key=='address_one') @php $customer_address=$user_info->meta_value; @endphp @endif
                @if($user_info->meta_key=='phone') @php $customer_mobile=$user_info->meta_value; @endphp @endif
                @endforeach

                @foreach($order_info as $orders_info)
                @if($orders_info->meta_key=='_qty') @php $qty=$orders_info->meta_value; @endphp @endif
                @if($orders_info->meta_key=='_line_subtotal') @php $amount=$orders_info->meta_value; @endphp @endif
                @if($orders_info->meta_key=='_product_id') @php $product_id=$orders_info->meta_value; @endphp @endif
                @php $product_name=DB::table('posts')->where('ID',$product_id)->get(); @endphp
                @php
                $product_general_info=DB::SELECT("SELECT ID,meta_value
                FROM posts
                LEFT JOIN postmeta ON posts.ID=postmeta.post_id
                WHERE post_type='product'AND ID=$product_id AND postmeta.meta_key='_sku'");
                $product_color_info=DB::SELECT("SELECT ID,meta_value
                FROM posts
                LEFT JOIN postmeta ON posts.ID=postmeta.post_id
                WHERE post_type='product'AND ID=$product_id AND postmeta.meta_key='default_attribute'");
                @endphp
                @endforeach

                @foreach($product_name as $product_names)
                @php $item_name=$product_names->post_title; @endphp
                @endforeach

                @foreach($product_general_info as $product_general_infos)
                @php $sku=$product_general_infos->meta_value; @endphp
                @endforeach

                @foreach($product_color_info as $product_color_infos)
                @php $arributeArray=$product_color_infos->meta_value; @endphp
                @endforeach



                <tr>
                  <td class="center">{{$order->ID}}</td>
                  <td class="left strong">{{$customer_first_name}} {{$customer_last_name}}</td>
                  <td class="left">
                    <table>
                      <tr>
                        <td>{{$sku}}</td>
                      </tr>

                    </table>
                  </td>

                  <!-- <td class="right">
                    <table>

                      <tr>
                        <td></td>
                      </tr>

                    </table>
                  </td> -->
                  <td class="center">
                    <table>

                      <tr>
                        <td>{{$qty}}</td>
                      </tr>

                    </table>
                  </td>
                  <td class="right">
                    <table>

                      <tr>
                        <td>{{$item_name}}</td>
                      </tr>

                    </table>
                  </td>
                  <td class="right">{{$customer_address}}</td>
                  <td class="right">{{$customer_mobile}}</td>
                  <td class="right">{{$sub=$amount}}</td>
                  <td class="right">Pending</td>
                  <td class="right">
                    <a href="{{route('pending_order_print',$order->ID)}}" class="btn btn-success"> <i class="fas fa-print"> </i> Print</a><br>
                    <a onclick="return confirm('are you sure??')" href="{{route('pending_order_processing',$order->ID)}}" class="btn btn-primary"><i class="fas fa-spinner"> </i>Processing</a><br>
                    <a href="{{route('order.edit',$order->ID)}}" class="btn btn-warning"> <i class="fas fa-edit"> </i>Edit</a><br>
                    <a onclick="return confirm('are you sure??')" href="{{route('pending_order_cancel',$order->ID)}}" class="btn btn-danger"> <i class="fas fa-window-close"> </i> Cancel</a>
                  </td>
                  <!-- <td class="right">hello</td> -->
                </tr>
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


            <h3 class="text-center">{{ $grandTotal}}</h3>

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