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

<<<<<<< HEAD
        <div class="row ml-2">
           <div class="col-1">
                <div class="box" style="background: #3467C1">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">Pending Order</h3>
=======
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        @include('admin.includes.messages')
        <div class="row">
           
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Quick Report</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <!-- <table class="table table-bordered table-striped">
                  <thead class="bg-success">                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Quick Report Name</th>
                      <th>Status</th>
                      <th >Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>NO</td>
                      <td>name</td>
                      <td>status</td>
                      <td>
                        <a href="" class="btn btn-primary"> <i class="fa fa-edit"></i> Action</a>
                      </td>
                    </tr>
                  </tbody>
                </table> -->
              </div>
              <div class="d-flex justify-content-center">            
              </div>  
            </div>
            <!-- /.card -->
           
>>>>>>> 08f2e5af4c03affb96d75910c15555ce1342e001

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
            

  

  </div>
@endsection