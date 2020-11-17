@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      @include('admin.includes.messages')
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

    <div class="card-body">
      <div class="container">
        <ul class="nav bg-dark d-flex justify-content-around">
         <li class="nav-item bg-primary" style="border-right: 1px solid white;">
          <a  class="nav-link active" href="{{route('order.allStatus')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">All Status({{$total_order_status}})</a>
        </li>

       <!--  <li class="nav-item " style="border-right: 1px solid white;">
          <a class="nav-link"  href="{{route('order.pendingOrder')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Pending Order ({{$pending_order}})</a>
        </li> -->
        <li class="nav-item " style="border-right: 1px solid white;">
          <a class="nav-link"  href="{{route('order.pendingOrder')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Sales ({{$pending_order}})</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link"  href="{{route('order.processing')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Processing ({{$processing_order}})</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a  class="nav-link" href="{{route('order.dispat')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Dispatch ({{$dispatch_order}})</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a  class="nav-link" href="{{route('order.excel.dispatch')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Excel Dispatch</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a  class="nav-link" href="{{route('order.delivery.invoice')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Delivery Invoice</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link" href="{{route('order.deliver')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Delivered ({{$delivered_order}})</a>
        </li>
        <li class="nav-item">
          <a  class="nav-link" href="{{route('order.cancelled')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Cancelled ({{$cancelled_order}})</a>
        </li>

      </ul>
    </div>
  </div>

  <div class="s002">
    <div class="d-flex font-weight-bold justify-content-center h2 mb-3">All Status</div>
    <div class="d-flex justify-content-center mb-3">
      <form class="form-inline" method="post" action="{{route('order.all.status.search')}}" >
        @csrf() 
        <div class="form-group mb-2">
          <label for="depart" class="mr-2">Order Id</label>
          <input  type="text" class="form-control" name="order_id" placeholder="Scanner or Order Id" />
        </div>

        <div class="form-group mb-2">
          <label for="depart" class="mr-2">Mobile</label>
          <input  type="text" class="form-control" name="mobile" placeholder="Mobile" />
        </div>

        <div class="form-group mb-2">
          <label for="depart" class="mr-2">Email</label>
          <input  type="email" class="form-control" name="email" placeholder="Email" />
        </div>

        <button type="submit" class="btn btn-primary mb-2">SEARCH</button>
      </form>
    </div>
  </div>
</section>
<!-- Main content -->
<section class="content">
  <div class="container">
    <div class="card">

      <div class="card-body">

       <h5 class="text-center">Current Month Order List</h5>
        <div class="table-responsive-sm">
          <table class="table table-striped">
            <thead>
              <tr>
                <th class="center">Oder Id</th>
                <th>Name</th>
                <th class="right">Mobile</th>
                <th class="right">Quantity</th>
                <th class="right">Amount</th>
                <th class="right">Status</th>
                <th class="right">Action</th>
              </tr>
            </thead>

            <tbody>
              @php $first_name=''; $last_name=''; $address=''; $phone=''; $subtotal=0; $total_amount=0; @endphp
              @foreach($order as $orders)

              @foreach($orders->productMeta as $meta)
              @if($meta->meta_key=='first_name') @php $name=$meta->meta_value; @endphp @endif
              @if($meta->meta_key=='last_name') @php $last_name=$meta->meta_value; @endphp @endif
              @if($meta->meta_key=='address_one') @php $address_one=$meta->meta_value; @endphp @endif
              @if($meta->meta_key=='phone') @php $phone=$meta->meta_value; @endphp @endif
              @endforeach
              @foreach($orders->orderItem as $info)
              @foreach($info->orderMeta as $value)
              @if($value->meta_key=='_line_subtotal')
              @php $subtotal=$value->meta_value; @endphp
              @endif
              @endforeach
              @endforeach
              <tr>
                <td class="center">{{$orders->ID}} Date:{{date('d-m-Y',strtotime($orders->post_date))}}</td>
                <td>{{$name}} {{$last_name}}</td>
                <td class="right">{{$phone}}</td>
                <td class="right">@php $qty=DB::table('order_itemmeta')->where('order_id',$orders->ID)->where('meta_key','_qty')->sum('meta_value'); @endphp {{$qty}} pcs</td>
                <td class="right">@php $sub=DB::table('order_itemmeta')->where('order_id',$orders->ID)->where('meta_key','_line_subtotal')->sum('meta_value'); @endphp {{$sub}}</td>
                <td class="right">{{$orders->post_status}}</td>
                <td class="right">
                  <a href="{{route('order.allStatus.print',$orders->ID)}}" class="btn btn-success mb-2"> <i class="fas fa-print"> </i> Print</a><br>
                  <a href="{{route('pending_order_edit',$orders->ID)}}" class="btn btn-warning"> <i class="fas fa-edit"> </i> Edit</a><br>
                  <a href="{{route('download.shipping.address',$orders->ID)}}" class="btn btn-info btn-sm mt-2"> <i class="fas fa-edit"> </i> Shipping Address</a><br>
                </td>
              </tr>
              @endforeach
            </tbody>
          </table>
          {{$order->links()}}
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