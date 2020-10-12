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
            <!-- <h1>Pending Order</h1> -->
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Sales Report</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form method="get" action="{{route('sales.report')}}">
       @csrf() 
        <fieldset>
          <legend>Search Sales Report</legend>
        </fieldset>
        <div class="inner-form ml-5">
          
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="start" value="{{date('Y-m-01')}}" id="depart" type="date"/>

          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="end" value="{{date('Y-m-t')}}" id="return" type="date"/>
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
                  <th class="center">#</th>
                  <th>Order Id</th>
                  <!-- <th>SKU</th> -->
                  <!-- <th class="right">Color</th> -->
                  <th class="center">Order Date</th>
                  <!-- <th class="right">Status</th> -->
                  <th class="right">Action</th>
                  <!-- <th class="right">Action</th> -->
                  <!-- <th class="right">Comments</th> -->
                  </tr>
                </thead>

                <tbody>
                  @foreach($order_item as $key=>$item) 
                  <tr>
                  <td class="center">{{++$key}}</td>
                  <td class="left strong">{{$item->ID}}</td>
                  <td class="right">{{date('d-M-Y',strtotime($item->post_date))}}</td>
                  <!-- <td class="right">{{$item->post_status}}</td> -->
                  <td class="right"><a href="{{url('delivered/edit/'.$item->ID)}}" class="btn btn-success btn-sm" href="">View Details</a></td>
                  </tr>
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
      <!-- <div class="container">
        <div class="row">
           <div class="col-md-4">
                <div class="box bg-primary">
           
                 
                  <h3 class="text-center">44</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Order</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-success">
           
                 
                 
                  <h3 class="text-center">5</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Item</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-info">
           
                  
                 
                  <h3 class="text-center"> 200</h3>
                  
                  <p class="lead text-center font-weight-bold">Total Amount</p>
                </div>
              </div>
        </div>       
            
      </div> -->
    </section>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
   
    <!-- /.content -->
 <!--  </div> -->
@endsection

@section('js')

@endsection