@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <!-- <h1>Reject</h1> -->
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Reject</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">

    </div>

       
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <div class="card">

          <div class="card-body">
            <div class="row mb-4">
            </div>

            <div class="table-responsive-sm">
              <table class="table table-striped">
                <thead>
                  <tr>
                  <th class="center">SKU</th>
                  <th>Category</th>
                  <th>Quantity</th>
                  </tr>
                </thead>

                <tbody>
                @foreach($reject_order as $order)
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong">Origin License</td>
                  <td class="left">Extended License</td>         
                </tr>
                @endforeach 
                </tbody>
              </table>
            </div>

          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
           <div class="offset-md-4 col-md-4">
                <div class="box bg-danger">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">1</h3>
                 
                  <p class="lead text-center font-weight-bold">Reject Qty</p>
                </div>
              </div>
            
              <div class="col-md-4">
                <div class="box">
                  <button class="btn-primary" type="Submite"  style="height: 56px;width: 80%;border-radius: 6px;">Submit</button>
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