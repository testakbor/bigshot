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
                @php $product_name=''; $qty=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $cust=''; @endphp
                @foreach($orders as $items)
                  @php 
                  $count=count($items->orderItem);    
                       echo '<pre>';
                      var_dump($items->orderItemMeta);   
                
                  @endphp

                  <tr>
                  <td rowspan="{{$count}}" class="center">{{$items->ID}}</td>
                  <td rowspan="{{$count}}" class="left strong">Customer</td>
                 
                  <td  class="left"> Yes </td>
                  <td  class="left"> QTY </td>
                  <td  class="left"> {{$items->orderItem[0]->order_item_name}} </td>

                  <td rowspan="{{$count}}" class="right">{{$address}}</td>
                  <td rowspan="{{$count}}" class="right">{{$mobile_no}}</td>
                  <td rowspan="{{$count}}" class="right">{{$sub = $subtotal*$qty}}</td>
                  <td rowspan="{{$count}}" class="right">{{$items->post_status}}</td>
                  <td rowspan="{{$count}}" class="right">
                    <a href="{{route('pending_order_print',$items->ID)}}" class="btn btn-success"> <i class="fas fa-print"> </i> Print</a><br>
                    <a onclick="return confirm('are you sure??')" href="{{route('pending_order_processing',$items->ID)}}" class="btn btn-primary" ><i class="fas fa-spinner"> </i>Processing</a><br>
                    <a href="{{route('pending_order_edit',$items->ID)}}" class="btn btn-warning"> <i class="fas fa-edit"> </i>Edit</a><br>
                    <a onclick="return confirm('are you sure??')" href="{{route('pending_order_cancel',$items->ID)}}" class="btn btn-danger"> <i class="fas fa-window-close"> </i> Cancel</a>
                  </td>

                  </tr>
                  @for($i=1;$i<$count;$i++)
                  <tr>
                  <td  class="left"> SKU {{$i}}</td>
                  <td  class="left"> QTY {{$i}}</td>
                  <td  class="left">{{$items->orderItem[0]->order_item_name}}</td>                   
                  </tr>
                  @endfor 

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