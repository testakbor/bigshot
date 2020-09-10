@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Order Processing</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Order Processing</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form>
        <div class="inner-form ml-5">
          
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="depart" type="date" placeholder="29 Aug 2018" />

          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="return" type="date" placeholder="30 Aug 2018" />
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

          <div class="card-header">Invoice
            <strong>01/01/01/2018</strong> 
            <span class="float-right"> <strong>Status:</strong> Pending</span>
          </div>

          <div class="card-body">
           

            <div class="table-responsive-sm">
              <table class="table table-striped">
                <thead>
                  <tr>
                  <th class="center">Oder Id</th>
                  <th>Name</th>
                  <th class="right">Address</th>
                  <th class="right">Mobile</th>
                  <th class="right">Amount</th>
                  <th class="right">Action</th>
                  <th class="right">Comments</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                  <td class="center">Barcode</td>
                  <td>Saiful</td>
                  <td class="right">Uttara</td>
                  <td class="right">01680000000</td>
                  <td class="right">$999,00</td>
                  <td class="right">
                    <i class="fas fa-print"><a href="#">Print</a></i><br>
                    <i class="fas fa-edit"><a href="#">Edit</a></i><br>
                    <i class="fas fa-window-close"><a href="#">Cancel</a></i>
                  </td>
                  <td class="right">hello</td>
                  </tr>
                  
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
                <div class="box bg-primary">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">50</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Order</p>
                </div>
              </div>
            
              <div class="col-md-4 ">
                <div class="box bg-info">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center">1</h3>
                  
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