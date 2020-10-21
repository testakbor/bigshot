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
                        <li>Payment Method: @if($payment_method=='') Cash @else {{ucfirst($payment_method)}} @endif </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-striped">
                        Items In Order
                        <thead class="thead-light">

                            <tr>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <!-- <th scope="col">Cost</th> -->
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $i=1;
                            $grandTotal=0;
                            $subtotal=0;
                            $qty=0;
                            $item_id=0;
                            $sub=0;
                            $total_qty=0;
                            $delivery_charge=0;
                            @endphp
                            @foreach($products as $item)
                            @foreach($item->orderMeta as $value)
                            @if($value->meta_key=='_qty') @php $qty=$value->meta_value; @endphp @endif
                            @if($value->meta_key=='_line_subtotal') @php $subtotal=$value->meta_value; @endphp @endif
                            @if($value->meta_key=='delivery_charge') @php $delivery_charge=$value->meta_value; @endphp @endif
                            @endforeach
                            @php $product_status=DB::table('order_itemmeta')->where(['order_item_id'=>$item->order_item_id,'meta_key'=>'product_status'])->first(); @endphp
                            @if(isset($product_status)) @php $status=$product_status->meta_value; @endphp @else @php $status=''; @endphp @endif
                            @if($status=='')
                            <tr>
                                <th scope="row">

                                </th>
                                <th>
                                    @php
                                    $sku=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','_sku')->first();
                                    $image=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','attached_file')->first();
                                    @endphp
                                    <img width="50px" height="50px" src="{{asset('backend/products/'.$image->meta_value)}}">
                                    Sku:{{$sku->meta_value}}
                                </th>
                                <td>{{$item->order_item_name}}</td>
                                <!-- <td> @php $cost=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','product_stock')->first(); @endphp {{$cost->meta_value}}</td> -->
                                <td>{{$qty}} pcs</td>
                                <td>{{$sub=$subtotal}} tk</td>
                            </tr>
                            @endif
                            @if($status=='')
                            @php
                            $i++;
                            $grandTotal+=$sub;
                            $total_qty+=$qty;
                            @endphp
                            @endif
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
                            <!-- <p class="mb-1 text-dark"><b>Order Details</b></p> -->
                        </div>
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Sub Total {{ $total_qty}} pcs </b></p>
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
                            <p class="mb-1">{{$delivery_charge}} tk</p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Order Total </b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Tk. {{$grandTotal+$delivery_charge}}</p>
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