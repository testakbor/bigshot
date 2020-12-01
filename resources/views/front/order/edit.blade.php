@extends('front.layouts.front_master')
@section('content')
<div class="container-fluid my-5 d-flex justify-content-center">
    <div class="card card-1">
        <div class="card-header bg-white">
                 <h4 class="text-center">INVOICE</h4>
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                      @if($status->post_status=='cancelled')
                       <h4 class="text-center">Order has been cancelled</h4>
                      @else 
                <div class="col-auto">
                        <b>Oder placed: {{date('d-M-Y',strtotime($order->post_date))}}</b></br>
                        <b>Order Number: {{$order->ID}}</b><br> 
                        Ship To
                        <hr> 
                    <div>
                        @php $name=''; $address=''; $city=''; $payment_method=''; @endphp
                        @foreach($order_info as $info)
                        @if($info->meta_key=='first_name') @php $name=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='address_one') @php $address=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='city') @php $city=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='payment_method') @php $payment_method=$info->meta_value; @endphp @endif
                        @endforeach
                        <div >{{$name}}</div>
                        <div >{{$address}},{{$city}}</div>
                        <div >Payment Method: @if($payment_method=='') Cash @else {{ucfirst($payment_method)}} @endif </div>
                    </div>
                </div>
                @endif 
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
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
                          @php
                            $tot_qty=0;
                            $tot_price=0;
                            $i=1;
                            $grandTotal=0;
                            $subtotal=0;
                            $qty=0;
                            $item_id=0;
                            $sub=0;
                            $total_qty=0;
                            $delivery_charge=0;
                            $coupon_amount=0;
                            $coupon_code='';
                            $item_id=0;
                            @endphp
                           @if($status->post_status=='cancelled')
                          @else 
                        <tbody>
                            @foreach($products as $item)
                            @foreach($item->orderMeta as $value)
                            @if($value->meta_key=='_qty') @php $qty=$value->meta_value; @endphp @endif
                            @if($value->meta_key=='_line_subtotal') @php $subtotal=$value->meta_value; @endphp @endif
                            @if($value->meta_key=='delivery_charge') @php $delivery_charge=$value->meta_value; @endphp @endif
                            @if($value->meta_key=='coupon_code') @php $coupon_code=$value->meta_value; @endphp @endif
                            @if($value->meta_key=='coupon_taka') @php $coupon_amount=$value->meta_value; @endphp @endif
                            @if($value->order_item_id) @php $item_id=$value->order_item_id; @endphp @endif
                            @endforeach
                            @php $product_status=DB::table('order_itemmeta')->where(['order_item_id'=>$item->order_item_id,'meta_key'=>'product_status'])->first(); @endphp
                            <tr>
                                <th scope="row">
                                </th>
                                <th>
                                    @php
                                    $sku=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','_sku')->first();
                                    $p_price=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','sale_price')->first();
                                    $image=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','attached_file')->first();
                                    @endphp
                                    <img width="30px" height="30px" src="{{asset('backend/products/'.$image->meta_value)}}"><br>
                                    Sku:{{$sku->meta_value}}
                                </th>
                                <td>{{$item->order_item_name}}</td>
                                <!-- <td> @php $cost=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','product_stock')->first(); @endphp {{$cost->meta_value}}</td> -->
                                <td>           
                                    @php 
                                    $cancel_qty=DB::table('order_itemmeta')
                                    ->where('order_item_id',$item_id)
                                    ->where('meta_key','cancel_quantity')
                                    ->sum('meta_value');
                                    @endphp
                                    {{$qty-$cancel_qty}} pcs
                                </td>
                                <td>
                                    @php
                                     $a_qty=$qty-$cancel_qty; 
                                     $tot_qty+= $a_qty;
                                    @endphp
                                    @if($a_qty>0)
                                    {{$sub=$p_price->meta_value*$a_qty}} tk
                                    @else 
                                    @php $sub=0;  @endphp
                                    0 tk 

                                    @endif 
                                    @php $tot_price+=$sub; @endphp
                                </td>
                            </tr>
                            @php
                            $i++;
                            $grandTotal+=$sub;
                            $total_qty+=$a_qty;
                            @endphp
                            @endforeach
                        </tbody>
                        @endif 
                    </table>
                    </div>
                    <hr class="my-3 ">
                </div>
            </div>

   
        








 @if($status->post_status=='cancelled')
             @else 
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="row justify-content-between">
                        <div class="col-auto">
                            <!-- <p class="mb-1 text-dark"><b>Order Details</b></p> -->
                        </div>
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Sub Total {{ $tot_qty}} pcs </b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">{{$tot_price}} tk</p>
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
                            <p class="mb-1">@if($tot_qty>0) {{$delivery_charge}} tk @else  0 tk @endif</p>
                        </div>
                    </div>

                   @if($coupon_amount>0)
                   <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Coupon Code</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">@if($tot_qty>0){{$coupon_code}} @else 0 @endif</p>
                        </div>
                    </div>

                     <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Coupon Amount</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">@if($tot_qty>0) {{$coupon_amount}} tk @else 0 tk @endif </p>
                        </div>
                    </div>
                    @endif 
                  

                    
                   @if($coupon_amount>0)
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Order Total </b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">@if($tot_qty>0) Tk. {{number_format(($tot_price+$delivery_charge)-$coupon_amount)}} @else 0 tk @endif</p>
                        </div>
                    </div>
                    @else
                      <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Order Total </b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">@if($tot_qty>0) Tk. {{number_format($tot_price+$delivery_charge)}} @else 0 tk @endif</p>
                        </div>
                    </div>
                    @endif 


                </div>
            </div>
            @endif





























        </div>
    </div>
</div>
@endsection