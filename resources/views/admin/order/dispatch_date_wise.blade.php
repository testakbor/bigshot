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
        <div class="s002">
            <form method="post" action="{{route('dispatch.order.date.wise')}}">
                @csrf
                <div class="inner-form ml-5">
                    <div class="input-field second-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                            </svg>
                        </div>
                        <input required type="text" class="form-control" name="order_id" placeholder="Scanner or Order Id" />
                    </div>
                    <div class="input-field fifth-wrap">
                        <button type="submit" class="btn-search" type="button">SEARCH</button>
                    </div>
            </form>
            <div class="offset-3 col-md-4">
                <div class="box bg-primary">
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
                    @php $total_amount=DB::table('order_itemmeta')->where('order_id',$orders->ID)->where('meta_key','_line_subtotal')->sum('meta_value'); @endphp
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
                            @php $subtotal=$value->meta_value; @endphp
                            @endif
                            @endforeach
                            @endforeach
                            @php $total_amount=DB::table('order_itemmeta')->where('order_id',$orders->ID)->where('meta_key','_line_subtotal')->sum('meta_value'); @endphp
                            <tr>
                                <td class="center">{{$orders->ID}} Date:{{date('d-m-Y',strtotime($orders->post_date))}}</td>
                                <td>{{$name}} {{$last_name}}</td>
                                <td class="right">{{$address_one}}</td>
                                <td class="right">{{$phone}}</td>
                                <td class="right">{{$total_amount}}</td>
                                <td class="right">
                                    <a onclick="return confirm('Do you want to delivery?')" href="{{route('order.dispatch.delivered',$orders->ID)}}" class="btn btn-success">Delivered</a><br>
                                    <a href="{{route('order.dispatch.edit',$orders->ID)}}" class="btn btn-primary mt-1" style=" width: 49%;">Edit</a>
                                </td>
                                <!-- <td class="right">hello</td> -->
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