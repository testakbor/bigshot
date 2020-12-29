@extends('front.layouts.front_master')
@section('content')

<style>
    .all_border{
        border: 1px solid #000000;
    }
</style>

<div class="container">
       @php $total_order_qty=0; $total_order_amount=0; $name=''; $address='';  $payment_method=''; $qtty=0; @endphp
    <div class="all_border">
          <h3 class="text-center">INVOICE</h3>
          <b class="pull-left ml-3">Oder placed: {{date('d-M-Y',strtotime($order->post_date))}}</b><br>
          <b class="pull-left ml-3">Order Number: {{$order->ID}}</b>

          <div class="pull-left mt-3 ml-3">
               Ship To
              <hr> 
              <p>
             @foreach($order_info as $info)
                        @if($info->meta_key=='first_name') @php $name=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='address_one') @php $address=$info->meta_value; @endphp @endif
                        @if($info->meta_key=='payment_method') @php $payment_method=$info->meta_value; @endphp @endif
             @endforeach
             {{$name}}<br>
             {{$address}},<br>District: {{ucfirst($dist->meta_value)}}<br>
             City: {{ucfirst($city->meta_value)}}<br>
             Zip: {{$zip->meta_value}}

              </p>
          </div>

          <div class="pull-left mt-2 ml-3"> 
              <p>
                Payment Method: @if($payment_method=='') Cash @else {{ucfirst($payment_method)}} @endif
              </p>
          </div>

           <div class="pull-left mt-2 ml-3 mr-3 bg-secondary text-white"> 
              <p class="ml-2">
                Items in Order 
              </p>
          </div>

          <div class="pull-left mt-2 ml-1 mr-3">
                 <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Item</th>
                                <th scope="col">Description</th>
                                <th scope="col">Qty</th>
                                <th scope="col">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                         @foreach($products as $item)
                            <tr>
                            <td>
                            {{$item->order_item_name}}
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
                        <img width="40px" height="40px" src="{{asset('backend/products/'.$d_img->meta_value)}}">
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
                                  {{strtoupper($da->taxonomy)}} : {{strtoupper($da->term)}}
                                    @endforeach 
                                  @endforeach 
                       </td>
                      <td>
                          @foreach($item->orderMeta as $meta)
                                       @if($meta->meta_key=='cancel_quantity')
                                         @php $cancel_qty=$meta->meta_value; @endphp
                                        @endif 
                                        @if($meta->meta_key=='_qty')
                                           {{$meta->meta_value}} pcs
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
                                                    {{ number_format($price=$qtty*$pro_default->meta_value)}} tk
                                                    @endif

                                                    @if(isset($pro_att)) 
                                                    {{ number_format($price=$qtty*$pro_att->meta_value)}} tk
                                                    @endif
                                                    @php $total_order_qty+=$qtty; @endphp
                                                    @php $total_order_amount+=$price; @endphp

                                                   
                                                
                                       </td>
                                   </tr>
                                   @endforeach 
                                </tbody>
                            </table>
                 </div>


            <div class="pull-left mt-2 ml-3 mr-3 bg-secondary text-white"> 
              <p class="ml-2 ">
                Sub Total: {{number_format($total_order_qty)}} pcs {{number_format($total_order_amount)}} tk
              </p>
            </div>

            <div class="pull-left mt-2 ml-3 mr-3"> 
              <p class="ml-2">
                Delivery Charge: @php $delivery_charge=DB::table('order_itemmeta')
                                            ->where('order_id',$order->ID) 
                                            ->where('meta_key','delivery_charge') 
                                            ->first();
                                            @endphp
                                            @if(isset($delivery_charge)) 
                                             {{number_format($d_charge=$delivery_charge->meta_value)}} tk
                                             @else 
                                              {{$d_charge=0}} tk
                                            @endif
              </p>
            </div>

             <div class="pull-left mt-2 ml-3 mr-3 bg-secondary text-white"> 
              <p class="ml-2">
                Coupon: @php $coupon_taka=DB::table('order_itemmeta')
                                            ->where('order_id',$order->ID) 
                                            ->where('meta_key','coupon_taka') 
                                            ->first();
                                            @endphp
                                            @if(isset($coupon_taka)) 
                                             {{number_format($c_taka=$coupon_taka->meta_value)}} tk
                                             @else 
                                              {{$c_taka=0}} tk
                                            @endif      
              </p>
            </div>

              <div class="pull-left mt-2 ml-3 mr-3"> 
              <p class="ml-2">
                Order Total: {{number_format($total_order_amount+$d_charge-$c_taka)}} tk 
              </p>
            </div>
    
    </div> 
</div>
</div>

@endsection