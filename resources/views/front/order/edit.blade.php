@extends('front.layouts.master')
@section('content')
<div class="container-fluid my-5 d-flex justify-content-center">
    <div class="card card-1">
        <div class="card-header bg-white">
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                <div class="col-auto">
                    <ul>
                        <li> Oder placed: {{date('d-M-Y',strtotime($order->post_date))}}</li>
                        <li>Order Number: {{$order->ID}}</li>
                        <li> Ship To</li>
                        @php $name=''; $address=''; $city=''; $payment_method=''; @endphp
                        @foreach($order_info as $info)
                        @if($info->meta_key=='first_name') @php $name=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='address_one') @php $address=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='city') @php $city=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='payment_method') @php $payment_method=$info->meta_value; @endphp @endif
                        @endforeach
                        <li>Name:{{$name}}</li>
                        <li>Address:{{$address}}</li>
                        <li>City:{{$city}}</li>
                        <li>Payment Method: {{ucfirst($payment_method)}}</li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Item</th>
                                <th scope="col">Cost</th>
                                <th scope="col">Qty</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $i=1;
                            $grandTotal=0;
                            $subtotal=0;
                            $qty=0;
                            @endphp
                            @foreach($products as $item)
                            @foreach($item->orderMeta as $value)
                            @if($value->meta_key=='_qty') @php $qty=$value->meta_value; @endphp @endif
                            @if($value->meta_key=='_line_subtotal') @php $subtotal=$value->meta_value; @endphp @endif
                            @endforeach
                            <tr>
                                <th scope="row">{{$i}}</th>
                                <td>{{$item->order_item_name}}</td>
                                <td> @php $cost=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','product_stock')->first(); @endphp {{$cost->meta_value}}</td>
                                <td>{{$qty}}</td>
                                <td>{{$sub=$subtotal}}</td>
                            </tr>
                            @php
                            $i++;
                            $grandTotal+=$sub;
                            @endphp
                            @endforeach
                        </tbody>
                    </table>
                    <hr class="my-3 ">
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="row justify-content-between">
                        <div class="col-auto">
                            <p class="mb-1 text-dark"><b>Order Details</b></p>
                        </div>
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">{{$grandTotal}}</p>
                        </div>
                    </div>
                    <!-- <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"> <b>Discount</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Tk. {{$i=10}} </p>
                        </div>
                    </div> -->
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Delivery Charges</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Tk. 80</p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Grand Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Tk. {{$grandTotal+80}}</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="row invoice ">
                <div class="col">
                    <p class="mb-1"> Invoice Number : 788152</p>
                    <p class="mb-1">Invoice Date : 22 Dec,2019</p>
                    <p class="mb-1">Recepits Voucher:18KU-62IIK</p>
                </div>
            </div> -->
        </div>
        <!-- <div class="card-footer">
            <div class="jumbotron-fluid">
                <div class="row justify-content-between ">
                    <div class="col-auto my-auto ">
                        <h2 class="mb-0 font-weight-bold">TOTAL PAID</h2>
                    </div>
                    <div class="col-auto my-auto ml-auto">
                        <h1 class="display-3 ">Tk {{$grandTotal+$i+80}}</h1>
                    </div>
                </div>

            </div>
        </div> -->
    </div>
</div>
@endsection