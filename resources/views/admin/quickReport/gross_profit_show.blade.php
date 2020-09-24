
@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <!-- <h1>Pending Order</h1> -->
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Gross profit</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form method="post" action="{{route('order.grossProfit.report')}}">
       @csrf() 
        <fieldset>
          <legend>Search Gross profit</legend>
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
              <table class="table ">
                <thead>
                  <tr>
                  <th>Order Id</th>
                  <th>Description</th>
                  <th class="center">Quantity</th>
                  <th class="right">Sales amount</th>
                  <th class="right">Cost</th>
                  <th class="right">Gross Profit</th>
                  </tr>
                </thead>

                 <tbody>
                 @php 
                 $subtotal=0;
                 $qty=0;
                 $product_id=0;
                @endphp
               @foreach($order_item as $order_items)
               @foreach($order_items->orderMeta as $value)
                  @php                  
                  if($value->meta_key=='_line_subtotal'){
                    $subtotal=$value->meta_value;
                  }
                  if($value->meta_key=='_qty'){
                    $qty=$value->meta_value;
                  }
                  if($value->meta_key=='_product_id'){
                    $product_id=$value->meta_value;
                  }
                  @endphp
                  @endforeach
                 <tr>
                  <td>{{$order_items->order_id}}</td>
                  <td>65765</td>
                  <td>{{$qty}} pcs</td>
                  <td>{{$subtotal}}</td>
                  <td>324432</td>
                  <td>555 tk</td>
                </tr>
               @endforeach

                </tbody>
              </table>
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

