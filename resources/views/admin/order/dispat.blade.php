@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Dispatch</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Dispatch</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->


   <div class="card-body">
      <div class="container">
        <ul class="nav bg-dark d-flex justify-content-around">
         <li class="nav-item " style="border-right: 1px solid white;">
          <a  class="nav-link" href="{{route('order.allStatus')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">All Status ({{$total_order_status}})</a>
        </li>

     
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link"  href="{{route('order.pendingOrder')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Sales ({{$pending_order}})</a>
        </li>
        <li class="nav-item" style="border-right: 1px solid white;">
          <a class="nav-link"  href="{{route('order.processing')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Processing ({{$processing_order}})</a>
        </li>
        <li class="nav-item bg-primary" style="border-right: 1px solid white;">
          <a  class="nav-link active" href="{{route('order.dispat')}}" style="color: aliceblue" tabindex="-1" aria-disabled="true">Dispatch ({{$dispatch_order}})</a>
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
      <div class="d-flex font-weight-bold justify-content-center h2 mb-3">Search Dispatch Order</div>
      <div class="d-flex justify-content-center mb-3">
        <form class="form-inline" method="post" action="{{route('dispatch.order.date.wise')}}" >
          @csrf() 
          <div class="form-group mb-2">
            <label for="depart" class="mr-2">Order Id</label>
            <input required type="text" class="form-control" name="order_id" placeholder="Scanner or Order Id" />
          </div>

          <button type="submit" class="btn btn-primary mb-2">SEARCH</button>
        </form>
      </div>
      <div class="d-flex flex-row justify-content-center">
        <div class="col-md-4">
          <div class="box bg-success">
            <!-- <i class="fa fa-lemon ml-1"></i> -->
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
             @php $total_amount+=$subtotal; @endphp
            @endforeach
            <h3 class="text-center">{{$total_order}}</h3>
            <p class="lead text-center font-weight-bold">Total Order</p>
          </div>
        </div>

        <div class="col-md-4 ">
          <div class="box bg-info">
            <!-- <i class="fa fa-handshake ml-1"></i> -->
            <h3 class="text-center">{{$total_amount}}</h3>
            <p class="lead text-center font-weight-bold">Total Amount</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Main content -->
  <section class="content">
    <div class="container">
      <div class="card">
        <div class="card-header">
          <strong></strong>
          <span class="float-right"> <strong></strong></span>
        </div>
        <div class="card-body">
          <div class="table-responsive-sm">
             <h5 class="text-center">Current Month Order List</h5>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="center">Oder Id</th>
                  <th>Name</th>
                  <th class="right">Address</th>
                  <th class="right">Mobile</th>
                  <th class="right">Amount</th>
                  <!-- <th class="right">Comments</th> -->
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
                  @php $subtotal=$value->meta_value;   @endphp
                @endif
                @endforeach
                @endforeach
                <tr>
                  <td class="center">{{$orders->ID}} Date:{{date('d-m-Y',strtotime($orders->post_date))}}</td>
                  <td>{{$name}} {{$last_name}}</td>
                  <td class="right">{{$address_one}}</td>
                  <td class="right">{{$phone}}</td>
                  <td class="right">{{$subtotal}}</td>
                  <td class="right">
                    <a onclick="return confirm('Do you want to delivery?')" href="{{route('order_dispatch_d',$orders->ID)}}" class="btn btn-success">Delivered</a><br>
                    <a href="{{route('pending_order_edit',$orders->ID)}}" class="btn btn-primary mt-1" style=" width: 49%;">Edit</a>
                  </td>
                  <!-- <td class="right">hello</td> -->
                </tr>
                   @php $total_amount+=$subtotal;   @endphp
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
    <div class="container">
      <div class="row">
        <div class="offset-8 col-md-2">
          <div class="box bg-primary">
            <!-- <i class="fa fa-lemon ml-1"></i> -->
            <h3 class="text-center">{{$total_order}}</h3>
            <p class="lead text-center font-weight-bold">Total Order</p>
          </div>
        </div>
        <div class="col-md-2 ">
          <div class="box bg-info">
            <!-- <i class="fa fa-handshake ml-1"></i> -->
            <h3 class="text-center">{{$total_amount}}</h3>
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