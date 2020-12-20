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
            <li class="breadcrumb-item active">Order Details</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
    <div class="d-flex font-weight-bold justify-content-center h2 mb-3">Order Details</div>
    <!-- <div class="d-flex justify-content-center">
            <form class="form-inline" method="post" action="{{route('s_pending_order')}}" >
        @csrf() 
        <div class="form-group mb-2">
          <label for="depart" class="mr-2">Start Date </label>
          <input class="form-control datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date"/>
        </div>
        <div class="form-group mx-sm-3 mb-2">
          <label for="return" class="mr-2">End Date </label>
          <input class="form-control datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date"/>
        </div>
        <button type="submit" class="btn btn-primary mb-2">SEARCH</button>
      </form>
    </div> -->
  </section>
  <section class="content">
    <div class="container">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive-sm">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="center">Oder Id</th>
                  <th class="right">Item</th>
                  <th class="right">Qty</th>
                  <th class="right">Action</th>
                </tr>
              </thead>
              <tbody>
             @php $quantity=0; @endphp   
             @foreach($orders as $items)
              <tr>
                <td class="center">{{$items->ID}}</td>
                <td class="center">
                  @foreach($items->orderItem as $pro_name)
                     <li style="list-style:none">{{$pro_name->order_item_name}} </li>
                          @php 
                           $lists=DB::table('postmeta')
                           ->where('post_id',$pro_name->product_id)
                            ->where('meta_key','attribute')
                            ->select('meta_value','post_id')
                            ->get();
                          @endphp
                            @foreach($lists as $a) 
                                @php 
                                  $attribute=json_decode($a->meta_value);
                                @endphp
                                   @foreach($attribute as $att)     
                          <li style="list-style:none">{{$att->taxonomy}} : {{$att->term}}</li>
                      @endforeach 
                            @endforeach 
                       
                  @endforeach 
                </td>
                <td class="center">
                   @foreach($items->orderItem as $pro_name)
                      @foreach($pro_name->orderMeta as $meta)
                         @if($meta->meta_key=='_qty') 
                           @php $quantity=$meta->meta_value; @endphp 
                         @endif
                      @endforeach
                        <li style="list-style:none">{{$quantity}}</li> 
                   @endforeach 
                </td>
                <td class="center">
                  <a href="{{route('pending_order_print',$items->ID)}}" class="btn btn-success"> <i class="fas fa-print"> </i> Print</a><br>
                    <a onclick="return confirm('are you sure??')" href="{{route('pending_order_processing',$items->ID)}}" class="btn btn-primary" ><i class="fas fa-spinner"> </i>Processing</a><br>
                    <a href="{{route('pending_order_edit',$items->ID)}}" class="btn btn-warning"> <i class="fas fa-edit"> </i>Details</a><br>
                    <a onclick="return confirm('are you sure??')" href="{{route('pending_order_cancel',$items->ID)}}" class="btn btn-danger"> <i class="fas fa-window-close"> </i> Cancel</a>
                </td>
              </tr>
             @endforeach 
              </tbody>
              {{$orders->links()}}
            </table>
          </div>
        </div>
      </div>
    </div>
</section>
</div>
@endsection
@section('js')
@endsection