@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <div class="row mb-2">
        <div class="col-sm-6">
          <!-- <h1>Pending Order</h1> -->
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Best Customer List</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
    <div class="s002">
      <form method="post" action="{{route('best.customer.search')}}">
        @csrf()
        <fieldset>
          <legend>Best Customer List</legend>
        </fieldset>
        <div class="inner-form ml-5">
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date" />
          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date" />
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
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="center">#</th>
                  <th>Name</th>
                  <th>Mobile</th>
                  <th class="right">Address</th>
                  <th class="center">Quantity</th>
                  <th class="right">Amount</th>
                  <th class="right">Action</th>
                </tr>
              </thead>
              <tbody>
               @foreach($data as $key=>$item)
               @php $customer_name=DB::table('postmeta')
               ->where('post_id',$item->order_id)
               ->where('meta_key','first_name')
               ->first();
               $customer_mobile=DB::table('postmeta')
               ->where('post_id',$item->order_id)
               ->where('meta_key','phone')
               ->first();
                $customer_address=DB::table('postmeta')
               ->where('post_id',$item->order_id)
               ->where('meta_key','address_one')
               ->first();
               @endphp
                <tr>
                  <td rowspan="" class="center">{{++$key}}</td>
                  <td rowspan="" class="center">{{$customer_name->meta_value}}</td>
                  <td rowspan="" class="center">{{$customer_mobile->meta_value}}</td>
                  <td rowspan="" class="center">{{$customer_address->meta_value}}</td>
                  <td rowspan="" class="center">{{$item->total_qty}}</td>
                  <td rowspan="" class="center">@php $total=DB::table('order_itemmeta')
                    ->where('customer_id',$item->customer_id)
                    ->where('meta_key','_line_subtotal')->sum('meta_value'); @endphp {{$total}}</td>
                  <td rowspan="" class="center">
                      <a class="btn btn-success btn-sm" href="#">Send Email</a>
                      <a class="btn btn-primary btn-sm" href="#">Send Sms</a>
                    </td>
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
  </section>
  <!-- /.row -->
</div><!-- /.container-fluid -->
<!-- /.content -->
<!--  </div> -->
@endsection
@section('js')
@endsection