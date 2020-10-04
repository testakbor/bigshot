@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            @include('admin.includes.messages')
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Delivery</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
                        <li class="breadcrumb-item active">Delivery List</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
        <div class="s002">
            <form method="post" action="{{route('order.delivered.search')}}">
                @csrf
                <div class="inner-form ml-5">

                    <div class="input-field second-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                            </svg>
                        </div>
                        <input class="datepicker" id="depart" name="start" type="date" value="{{date('Y-m-01')}}" placeholder="29 Aug 2018" />

                    </div>
                    <div class="input-field third-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                            </svg>
                        </div>
                        <input class="datepicker" id="return" name="end" type="date" value="{{date('Y-m-t')}}" placeholder="30 Aug 2018" />
                    </div>

                    <div class="input-field fifth-wrap">
                        <button type="submit" class="btn-search" type="button">SEARCH</button>
                    </div>
            </form>

            <div class="offset-1 col-md-4">
                <div class="box bg-info">
                    <!-- <i class="fa fa-lemon ml-1"></i> -->
                    @php $first_name=''; $last_name=''; $address=''; $phone=''; $subtotal=0; $total_amount=0; $qty=0; $sub=0; $total_item=0; @endphp
                    @foreach($order as $orders)
                    @foreach($orders->productMeta as $meta)
                    @if($meta->meta_key=='first_name') @php $name=$meta->meta_value; @endphp @endif
                    @if($meta->meta_key=='last_name') @php $last_name=$meta->meta_value; @endphp @endif
                    @if($meta->meta_key=='address_one') @php $address_one=$meta->meta_value; @endphp @endif
                    @if($meta->meta_key=='phone') @php $phone=$meta->meta_value; @endphp @endif
                    @endforeach
                    @foreach($orders->orderItem as $info)
                    @foreach($info->orderMeta as $value)
                    @endforeach
                    @endforeach
                    @php
                    $sub=DB::table('order_itemmeta')->where('order_id',$orders->ID)->where('meta_key','_line_subtotal')->sum('meta_value');
                    $qty=DB::table('order_itemmeta')->where('order_id',$orders->ID)->where('meta_key','_qty')->sum('meta_value');
                    @endphp
                    @php $total_amount+=$sub; $total_item+=$qty; @endphp
                    @endforeach
                    <h3 class="text-center">{{$total_order}}</h3>
                    <p class="lead text-center font-weight-bold">Total Delevery</p>
                </div>
            </div>

            <div class="col-md-4 ">
                <div class="box bg-success">
                    <h3 class="text-center">{{$total_item}}</h3>

                    <p class="lead text-center font-weight-bold">Total Item</p>
                </div>
            </div>

            <div class="col-md-4 ">
                <div class="box bg-primary">
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
                            @php $first_name='';
                            $last_name='';
                            $address='';
                            $phone='';
                            $subtotal=0;
                            $total_amount=0;
                            $qty=0;
                            $sub=0;
                            $total_item=0;
                            @endphp
                            @foreach($order as $orders)
                            @foreach($orders->productMeta as $meta)
                            @if($meta->meta_key=='first_name') @php $name=$meta->meta_value; @endphp @endif
                            @if($meta->meta_key=='last_name') @php $last_name=$meta->meta_value; @endphp @endif
                            @if($meta->meta_key=='address_one') @php $address_one=$meta->meta_value; @endphp @endif
                            @if($meta->meta_key=='phone') @php $phone=$meta->meta_value; @endphp @endif
                            @endforeach
                            @foreach($orders->orderItem as $info)
                            @foreach($info->orderMeta as $value)
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
                                    <a href="{{route('order.deliver.print',$orders->ID)}}" class="btn btn-success mb-2">
                                        <i class="fas fa-print"> </i> Print</a><br>
                                    <a href="{{route('order.deliver.edit',$orders->ID)}}" class="btn btn-info mb-2">
                                        <i class="fas fa-edit"> </i>Edit</a><br>
                                    <a onclick="return confirm('Are you sure want to cancel this order?')" href="{{route('order.deliver.cancel',$orders->ID)}}" class="btn btn-danger"> <i class="fas fa-window-close"> </i> Cancel</a>
                                </td>
                            </tr>
                            @php $total_amount+=$sub; $total_item+=$qty; @endphp
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
            <div class="offset-6 col-md-2">
                <div class="box bg-info">
                    <!-- <i class="fa fa-lemon ml-1"></i> -->

                    <h3 class="text-center">{{$total_order}}</h3>

                    <p class="lead text-center font-weight-bold">Total Delivery</p>
                </div>
            </div>

            <div class="col-md-2 ">
                <div class="box bg-success">
                    <h3 class="text-center">{{$total_item}}</h3>
                    <p class="lead text-center font-weight-bold">Total Item</p>
                </div>
            </div>
            <div class="col-md-2 ">
                <div class="box bg-primary">
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