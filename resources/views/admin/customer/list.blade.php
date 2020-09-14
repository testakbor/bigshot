@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Customer List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Category List</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        @include('admin.includes.messages')
        <div class="row">
           
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Customer List</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered table-striped">
                  <thead class="bg-danger">                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Customer Name</th>
                      <th>Status</th>
                      <!-- <th>Action</th> -->
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($customers as $customer)
                      <tr>
                        <td style="width: 10px">#</td>
                        <td>{{$customer->name}}</td>
                        <td>Active</td>
                        <!-- <td><a href="#"><button class="btn btn-danger btn-sm">Delete</button></a></td> -->
                      </tr>
                      @endforeach 
                  </tbody>
                </table>
              </div>
              <div class="d-flex justify-content-center">            
            
              </div>  
            </div>
            <!-- /.card -->
           

          </div>
        

          </div>
          <!-- /.col -->
        </div>
      
      
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
@endsection