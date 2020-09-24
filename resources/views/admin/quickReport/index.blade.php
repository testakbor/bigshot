@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Quick Report List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Quick Report</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

        <div class="row ml-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Pending Order</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Today </h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 1</h3>
                  
                  <p class="lead text-center font-weight-bold">2</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 2</h3>
                  
                  <p class="lead text-center font-weight-bold">0</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #F37927;">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 3</h3>
                  
                  <p class="lead text-center font-weight-bold">10</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #C00000">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 4</h3>
                  
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #FF0000">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> All</h3>
                  
                  <p class="lead text-center font-weight-bold">0</p>
                </div>
              </div>
        </div>
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Dispatch</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Today </h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 1</h3>
                  
                  <p class="lead text-center font-weight-bold">2</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 2</h3>
                  
                  <p class="lead text-center font-weight-bold">0</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #F37927;">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 3</h3>
                  
                  <p class="lead text-center font-weight-bold">10</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #C00000">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Day 4</h3>
                  
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #FF0000">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> All</h3>
                  
                  <p class="lead text-center font-weight-bold">0</p>
                </div>
              </div>
        </div>
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Stock Moving</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Week 1 </h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Week 2</h3>
                  
                  <p class="lead text-center font-weight-bold">2</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Month 1</h3>
                  
                  <p class="lead text-center font-weight-bold">0</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #F37927;">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Month 2</h3>
                  
                  <p class="lead text-center font-weight-bold">10</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #C00000">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Month 3</h3>
                  
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #FF0000">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> All</h3>
                  
                  <p class="lead text-center font-weight-bold">0</p>
                </div>
              </div>
        </div>
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Stock</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Pieces </h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Amount</h3>
                  
                  <p class="lead text-center font-weight-bold">2345450</p>
                </div>
              </div>                 
        </div>
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Lower Stock</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Weekly </h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> All</h3>
                  
                  <p class="lead text-center font-weight-bold">2345450</p>
                </div>
              </div>                 
        </div> 
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Sold Out</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Weekly</h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Yearly</h3>
                  
                  <p class="lead text-center font-weight-bold">300</p>
                </div>
              </div>                 
        </div>
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Best Selling</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Weekly</h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box " style="background: #68A93B">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Yearly</h3>
                  
                  <p class="lead text-center font-weight-bold">300</p>
                </div>
              </div>                 
        </div>  
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Delivered</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Quantity</h3>
                 
                  <p class="lead text-center font-weight-bold">5</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Amount</h3>
                  
                  <p class="lead text-center font-weight-bold">300</p>
                </div>
              </div>                 
        </div>   
        <div class="row ml-2 mt-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Gross Profit</h3>

                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box" style="background: #68A93B">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">Monthly</h3>
                 
                  <p class="lead text-center font-weight-bold">500000</p>
                </div>
              </div>
              <div class="col-1 ml-4">
                <div class="box bg-warning">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center"> Yearly</h3>
                  
                  <p class="lead text-center font-weight-bold">300</p>
                </div>
              </div>                 
        </div>     
            

  

  </div>
@endsection