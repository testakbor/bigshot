@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>All Status</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">All Status</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form>
        <div class="inner-form ml-5" style="width: 64.5%;">

          
          <div class="input-field third-wrap">
            <input class="datepicker" id="return" type="file" accept="image/*;capture=camera"/>
          </div>
                  
          <div class="input-field second-wrap">
            <input class="datepicker" id="depart" type="text" placeholder="Order Id" />
          </div>
          <div class="input-field second-wrap">
            <input class="datepicker" id="depart" type="text" placeholder="Mobile Number" />
          </div>

          <div class="input-field second-wrap">
            <input class="datepicker" id="depart" type="email" placeholder="Email" />
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
                  
                  <th class="right">Mobile</th>
                  <th class="right">Address</th>
                  <th class="right">Quantity</th>
                  <th class="right">Amount</th>
                  <th class="right">Comments</th>
                 
                  <th class="right">Status</th>
                  <th class="right">Action</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                  <td class="center">Barcode</td>
                  <td>Saiful</td>
                  <td class="right">01680000000</td>
                  <td class="right">Uttara</td>
                  <td class="right">2</td>
                  <td class="right">2435</td>
                  <td class="right"></td>
                  <td class="right">Dispatched or <br> Delivered& Date</td>
                  <td class="right">
                    <i class="fas fa-print"><a href="#">Print</a></i><br>
                    <i class="fas fa-edit"><a href="#">Edit</a></i>
                  </td>
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
    </section>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
   
    <!-- /.content -->
 <!--  </div> -->
@endsection

@section('js')

@endsection