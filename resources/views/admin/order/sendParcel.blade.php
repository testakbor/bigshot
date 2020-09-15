<?php 
use App\Model\front\Order_item;
?>
@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
           
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Send Parcel</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form>
        <fieldset>
          <legend>Send Parcel</legend>
        </fieldset>
        <div class="inner-form ml-5" style="width: 32.5%;">
          
          <div class="input-field second-wrap">
            <p>Choose Image for Scan</p>
            <form>
              <input type="file" accept="image/*;capture=camera">
            </form>
          </div>
    
        
          <div class="input-field fifth-wrap">
            <button class="btn-search" type="button">SEARCH</button>
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
                  <th>Address</th>
                  <!-- <th class="right">Items</th> -->
                  <th class="center">Qty</th>
                  <th class="right">Amount</th>
                  <th class="right">Status</th>
                  <!-- <th class="right">Action</th> -->
                  </tr>
                </thead>

                <tbody>
                @php $qty=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $cust=''; @endphp
                @foreach($orders as $items)
                 @php 
                   $products=Order_item::where('order_id',$items->ID)->get();
                   $order_info=DB::table('postmeta')
                   ->where('post_id',$items->ID)
                   ->get();
                 @endphp
                 @foreach($products as $item)
                    @foreach($item->orderMeta as $value)
                    @php              
                    if($value->meta_key=='_line_subtotal'){
                      $subtotal=$value->meta_value;
                    }
                    if($value->meta_key=='_qty'){
                      $qty=$value->meta_value;
                    }
                    @endphp
                    @endforeach 
                  @endforeach 
                  @foreach($order_info as $info)
                    @if($info->meta_key=='_billing_phone')
                     @php $mobile_no=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='_billing_address_1')
                     @php $address=$info->meta_value; @endphp
                    @endif 

                    @if($info->meta_key=='_sku')
                     @php $sku=$info->meta_value; @endphp
                    @endif 

                    @if($info->meta_key=='_customer_user') 
                      @php $customer=$info->meta_value; $user=DB::table('users')->where('id',$customer)->get(); @endphp 
                      @foreach($user as $users) @php $cust=$users->name; @endphp @endforeach
                    @endif
                  @endforeach 
                  <tr>
                      <td class="center">{{$items->ID}}</td>
                      <td class="left strong">{{$cust}}</td>
                      <td class="left">{{$address}}</td>
                      <!-- <td class="right"></td> -->
                      <td class="center">{{$qty}}</td>
                      <td class="right">{{$sub = $subtotal*$qty}}</td>
                      <td class="right">{{$items->post_status}}</td>
                      <!-- <td class="right"></td> -->
                  </tr>
                  @php $grandTotal+=$sub; @endphp
                  @endforeach 
                </tbody>
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
                <div class="box bg-danger">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">{{$total_orders}}</h3>
                 
                  <p class="lead text-center font-weight-bold">Processing</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-success">              
                  <h3 class="text-center">{{$grandTotal}}</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Percel</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box">
                  <button class="btn-primary" type="Submit"  style="height: 56px;width: 80%;border-radius: 6px;">Submit & Print</button>
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