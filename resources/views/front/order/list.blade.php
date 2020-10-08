<?php

use Carbon\Carbon; ?>
@extends('front.layouts.master')
@section('content')
<style>
  table {
    border: none;
  }
</style>
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12 ">
      <div class="container-fluid mt-2">
        <div class="container">
          @if (session('success'))
          <div class="alert alert-success" role="alert" id="alert">
            {{ session('success') }}
          </div>
          @endif
          @if (session('error'))
          <div class="alert alert-danger" role="alert" id="alert">
            {{ session('error') }}
          </div>
          @endif
          <article class="card">
            <header class="card-header"> My Orders List </header>
            <div class="card-body">

              @php $qty=0; $id=0; @endphp
              @foreach($shop_order as $key=>$order)
              <table class="table">
                <thead>
                  <tr style="background:#e7e7e7">
                    <th>Order Id:{{$order->ID}} Order placed
                      {{date('d-M-Y',strtotime($order->post_date))}}
                      @php
                      $date = Carbon::parse($order->post_date);
                      $now = Carbon::now();
                      $diff = $date->diffInDays($now);
                      @endphp
                    </th>
                    <th>{{$order->post_status}}
                      {{date('d-M-Y',strtotime($order->post_modified))}}
                    </th>
                    <th>
                      @if($order->post_status=='delivered' && $diff>7)
                      @else
                      <a href="{{route('customer_ordere_cancel',$order->ID)}}"><span style="color:#000000">Cancel/Return?</span></a>
                      @endif
                    </th>
                    <th><a href="{{route('customer_ordere_edit',$order->ID)}}"><span style="color:#000000">Details</span></a></th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($order->orderItem as $item)
                  @foreach($item->orderMeta as $meta)
                  @if($meta->meta_key=='_qty')
                  @php $qty=$meta->meta_value;
                  @endphp
                  @endif
                  @if($meta->meta_key=='_product_id')
                  @php $id=$meta->meta_value;
                  @endphp
                  @endif
                  @endforeach
                  @php $product_status=DB::table('order_itemmeta')->where(['order_item_id'=>$item->order_item_id,'meta_key'=>'product_status'])->first(); @endphp
                  @if(isset($product_status)) @php $status=$product_status->meta_value; @endphp @else @php $status=''; @endphp  @endif
                  @if($status=='')
                  <tr>
                    <td style="border:none">
                      @php $product_img=DB::table('postmeta')->where('post_id',$id)->where('meta_key','attached_file')->first(); @endphp
                      @php $product_sku=DB::table('postmeta')->where('post_id',$id)->where('meta_key','_sku')->first(); @endphp
                      <img width="50px" height="50px" src="{{asset('backend/products/'.$product_img->meta_value)}}">
                      Sku:{{$product_sku->meta_value}}
                    </td>
                    <td>
                      @php $product_name=DB::table('posts')->where('ID',$id)->select('post_title')->first(); @endphp
                      {{$product_name->post_title}}
                    </td>
                    <td>
                      {{$qty}} pcs
                    </td>
                  </tr>
                  @endif 
                  @endforeach
                </tbody>
              </table>
              @endforeach
              {{$shop_order->links()}}
            </div>
          </article>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

@endsection