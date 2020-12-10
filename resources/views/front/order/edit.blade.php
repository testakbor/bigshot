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
                @php $total_order_qty=0; $total_order_amount=0; @endphp
                      @if($status->post_status=='cancelled')
                       <h4 class="text-center">Order has been cancelled</h4>
                      @else 
                <div class="col-auto">
                        <b>Oder placed: {{date('d-M-Y',strtotime($order->post_date))}}</b></br>
                        <b>Order Number: {{$order->ID}}</b><br> 
                        Ship To
                        <hr> 
                    <div>
                        @php $name=''; $address=''; $city=''; $payment_method=''; $qtty=0;  @endphp
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
                    <div class="table-responsive">
                    <table class="table table-striped">
                        Items In Order
                        <thead>
                            <tr>
                                <th scope="col">Item</th>
                                <th scope="col">Attribute</th>
                                <th scope="col">Qty</th>
                                <th scope="col">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                         @foreach($products as $item)
                            <tr>
                            <td>
                            {{$item->order_item_name}}</br>
                       @php 
                       $d_img=DB::table('postmeta')
                       ->where('post_id',$item->product_id) 
                       ->where('meta_key','attached_file')
                       ->first(); 
                        $d_sku=DB::table('postmeta')
                       ->where('post_id',$item->product_id) 
                       ->where('meta_key','_sku')
                       ->first();
                       @endphp
                       @if(isset($d_img))
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$d_img->meta_value)}}">
                       @endif
                       @if(isset($d_sku))
                        {{$d_sku->meta_value}}
                       @endif <br> 
                        @php 
                        $a_img=DB::table('posts')
                       ->where('ID',$item->product_id) 
                       ->where('meta_key','attached_file')
                       ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                       ->first(); 
                        $a_sku=DB::table('posts')
                       ->where('ID',$item->product_id) 
                       ->where('meta_key','_sku')
                       ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                       ->first(); 
                        @endphp
                        @if(isset($a_img))
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$a_img->meta_value)}}">
                       @endif</br> 
                        @if(isset($a_sku))
                        {{$a_sku->meta_value}}
                       @endif </br> 
                       </td>
                       <td>
                            @php 
                                $list_att=DB::table('postmeta')->where('post_id',$item->product_id)
                                ->where('meta_key','attribute')->get(); 
                                @endphp
                                  @foreach($list_att as $a)
                                  @php $data_att=json_decode($a->meta_value); @endphp 
                                  @foreach($data_att as $da)
                                  <b>{{strtoupper($da->taxonomy)}}</b> : <b>{{strtoupper($da->term)}}</b>
                                    @endforeach 
                                  @endforeach 
                       </td>
                      <td>
                          @foreach($item->orderMeta as $meta)
                                       @if($meta->meta_key=='cancel_quantity')
                                         @php $cancel_qty=$meta->meta_value; @endphp
                                        @endif 
                                        @if($meta->meta_key=='_qty')
                                          <b>{{$meta->meta_value}}<b/>
                                        @endif
                                    @endforeach 
                                    </td>
                                    <td>
                                            @foreach($item->orderMeta as $meta)
                                                        @if($meta->meta_key=='_qty')
                                                        @php $qtty=$meta->meta_value; @endphp
                                                        @endif
                                                    @endforeach 
                                                    @php
                                                    $pro_default=DB::table('postmeta')
                                                                ->where('post_id',$item->product_id) 
                                                                ->where('meta_key','sale_price')
                                                                ->first();  
                                                    $pro_att=DB::table('posts')
                                                                ->where('ID',$item->product_id) 
                                                                ->where('meta_key','sale_price')
                                                                ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                                                                ->first();  
                                                    @endphp
                                                    @if(isset($pro_default)) 
                                                    {{ $price=$qtty*$pro_default->meta_value}} 
                                                    @endif

                                                    @if(isset($pro_att)) 
                                                    {{ $price=$qtty*$pro_att->meta_value}} 
                                                    @endif
                                                    @php $total_order_qty+=$qtty; @endphp
                                                    @php $total_order_amount+=$price; @endphp

                                                   
                                                
                                       </td>
                                   </tr>
                                   @endforeach 
                                </tbody>
                            </table>
                        </div>
                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="row justify-content-between">
                                    <div class="col-auto">
                                    </div>
                                    <div class="flex-sm-col text-right col">
                                        <p class="mb-1"><b>Sub Total {{$total_order_qty}} pcs </b></p>
                                    </div>
                                    <div class="flex-sm-col col-auto">
                                        <p class="mb-1">{{ $total_order_amount}} tk</p>
                                    </div>
                                </div>
                                <div class="row justify-content-between">
                                    <div class="flex-sm-col text-right col">
                                        <p class="mb-1"><b>Delivery Charges</b></p>
                                    </div>
                                    <div class="flex-sm-col col-auto">
                                        <p class="mb-1">
                                            @php $delivery_charge=DB::table('order_itemmeta')
                                            ->where('order_id',$order->ID) 
                                            ->where('meta_key','delivery_charge') 
                                            ->first();
                                            @endphp
                                            @if(isset($delivery_charge)) 
                                             {{$d_charge=$delivery_charge->meta_value}} tk
                                             @else 
                                              {{$d_charge=0}} tk
                                            @endif
                                        </p>
                                    </div>
                                </div>
                            <div class="row justify-content-between">
                                    <div class="flex-sm-col text-right col">
                                        <p class="mb-1"><b>Coupon Code</b></p>
                                    </div>
                                    <div class="flex-sm-col col-auto">
                                        <p class="mb-1">
                                             @php $coupon_code=DB::table('order_itemmeta')
                                            ->where('order_id',$order->ID) 
                                            ->where('meta_key','coupon_code') 
                                            ->first();
                                            @endphp
                                            @if(isset($coupon_code)) 
                                              @if($coupon_code->meta_value=='') 
                                                {{$c_code=0}}
                                                @else 
                                                   {{$c_code=$coupon_code->meta_value}}
                                              @endif
                                             @else 
                                              {{$c_code=0}}
                                            @endif
                                        </p>
                                    </div>
                                </div>
                                <div class="row justify-content-between">
                                    <div class="flex-sm-col text-right col">
                                        <p class="mb-1"><b>Coupon Amount</b></p>
                                    </div>
                                    <div class="flex-sm-col col-auto">
                                        <p class="mb-1">
                                             @php $coupon_taka=DB::table('order_itemmeta')
                                            ->where('order_id',$order->ID) 
                                            ->where('meta_key','coupon_taka') 
                                            ->first();
                                            @endphp
                                            @if(isset($coupon_taka)) 
                                             {{$c_taka=$coupon_taka->meta_value}} tk
                                             @else 
                                              {{$c_taka=0}} tk
                                            @endif         
                                        </p>
                                    </div>
                                </div>
                                <div class="row justify-content-between">
                                    <div class="flex-sm-col text-right col">
                                        <p class="mb-1"><b>Order Total </b></p>
                                    </div>
                                    <div class="flex-sm-col col-auto">
                                        <p class="mb-1"> 
                                          {{number_format($total_order_amount+$d_charge-$c_taka)}} tk  
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                 </div>
            </div>
       </div>
@endsection