@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Category List</h1>
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
                <h3 class="card-title">Categories</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered table-striped">
                  <thead class="bg-danger">                  
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Category Name</th>
                      <th>Status</th>
                      <th >Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @php 
                    $i=1;
                    @endphp
                   @foreach($products as $value)
                    <tr>
                      <td>{{$i}}</td>
                      <td>{{$value->post_title}}</td>
                      <td>{{$value->post_status}}</td>
                      <td>
                        <a href="{{route('product.edit',$value->ID)}}" class="btn btn-primary"> <i class="fa fa-edit"></i> Edit</a>
                      </td>
                    </tr>
                    @php 
                    $i++;
                    @endphp
                   @endforeach
                  </tbody>
                </table>
              </div>
              <div class="d-flex justify-content-center">            
                {{$products->links()}}                  
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