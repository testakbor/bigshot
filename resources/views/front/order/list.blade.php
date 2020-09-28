@extends('front.layouts.master')
@section('content')
<style>
    table,
    th,
    td {
        border: 1px solid black;
        border-collapse: collapse;
    }

    th,
    td {
        padding: 5px;
        text-align: left;
    }
</style>
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
        <div class="col-md-12 ">
            <div class="container-fluid mt-2">
                <div class="container">
                    @if (session('success'))
                    <div class="alert alert-success" role="alert" id="alert">
                        {{ session('success') }}
                    </div>
                    @endif
                    @if (session('error'))
                    <div class="alert alert-danger" role="alert" id="alert">
                        {{ session('error') }}
                    </div>
                    @endif
                    <article class="card">
                        <header class="card-header"> My Orders List </header>
                        <div class="card-body">
                            <!-- <h6>Order ID: OD45345345435</h6> -->
                            <article class="card">
                                <table style="width:100%">
                                    <tr>
                                        <th>#</th>
                                        <th>Order Id</th>
                                        <th>Order Date</th>
                                        <th>Order Status</th>
                                        <th>Action</th>
                                    </tr>
                                    @foreach($shop_order as $key=>$order)
                                    <tr>
                                        <td>{{++$key}}</td>
                                        <td>{{$order->ID}}</td>
                                        <td>{{date('d-M-Y',strtotime($order->post_date))}}</td>
                                        <td>{{$order->post_status}}</td>
                                        <td>
                                            <a class="btn btn-success btn-sm" href="{{route('customer_ordere_edit',$order->ID)}}"><span style="color:#ffffff">View</span></a>
                                            @if($order->post_status=='on-hold')
                                            <a onclick="return confirm('Are you sure??')" class="btn btn-danger btn-sm" href="{{route('customer_ordere_cancel',$order->ID)}}"><span style="color:#ffffff">Cancel Order</span></a>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                    {{$shop_order->links()}}
                                </table>
                            </article>
                            <hr>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

@endsection