<?php

use Carbon\Carbon; ?>
@extends('admin.layouts.master')
@section('content')
<style>
    .box{
        border-radius: 10px;
        box-shadow:2px 2px 10px black;
        text-align: center;
    }
    a{
        text-decoration:none !important;
    }
    .box p{
        font-size:1.0em;
    }
    .reportTitleBg{
        background: #3467C1;
        text-align: center;
    }
    .reportText{
        text-align:center;
        font-weight:bold;
        color:white;
    }
    .reportDayText{
        text-align:center;
        color:white;
        font-weight:  bold;
    }
    .reportDayValue{
        text-align:center;
        color:white;
    }
    .todayBg{
        background:#6DB040;
    }
    .dayThreeBg{
        background:#FAC300;
    }
    .dayFourBg{
        background:#F47926;
    }
    .dayFiveBg{
        background:#C00000;
    }
    .allStatus{
        background:#FF0000;
    }
</style>
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="mb-2">
                <div class="col-sm-6">
                    <h1>Quick Report List</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
                        <li class="breadcrumb-item active">Quick Report</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <div class="mt-5 mb-5 ml-3">
        <div class="d-flex flex-row ml-2 flex-wrap">
            <div class="col-md-1 ml-3 reportTitleBg d-flex align-items-center box pl-3 pr-3" >

                <div class="reportText">Pending Order</div>

            </div>

            <a class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" href="{{route('todayPendingOrder')}}">
                <div class="reportDayText">Today </div>                 
                <div class="reportDayValue">{{$today_pending_order}}</div>
            </a>           

            <a class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" href="{{route('pendingOrderByDate',1)}}">                                    
                <div class="reportDayText"> Day 2</div>                  
                <div class="reportDayValue">{{$day_one_pending_order}}</div>
            </a>


            <a class="col-md-1 box ml-3 dayThreeBg d-flex justify-content-center flex-column" href="{{route('pendingOrderByDate',2)}}"> 
                <div class="reportDayText"> Day 3</div>                  
                <div class="reportDayValue">{{$day_two_pending_order}}</div>
            </a>


            <a class="col-md-1 box ml-3 dayFourBg d-flex justify-content-center flex-column"  href="{{route('pendingOrderByDate',3)}}">                                   
                <div class="reportDayText"> Day 4</div>                  
                <div class="reportDayValue">{{$day_three_pending_order}}</div>
            </a>


            <a class="col-md-1 box ml-3 dayFiveBg d-flex justify-content-center flex-column"  href="{{route('pendingOrderByDate',4)}}">                                   
                <div class="reportDayText"> Day 5</div>                  
                <div class="reportDayValue">{{$day_four_pending_order}}</div>
            </a>


            <a class="col-md-1 box ml-3 allStatus d-flex justify-content-center flex-column"  href="{{url('admin/pendingOrder')}}">
                <div class="reportDayText"> All</div>                  
                <div class="reportDayValue">{{$all_pending_order}}</div>
            </a>

        </div>     

        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">

            <div class="col-md-1 ml-3 reportTitleBg d-flex align-items-center pl-3 pr-3 box" >
                <div class="reportText">Processing</div>
            </div>

            <a class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" href="{{route('processingOrderByDate',0)}}">
                <div class="reportDayText">Today </div>                 
                <div class="reportDayValue">{{$today_processing_order}}</div>
            </a>

            <a class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" href="{{route('processingOrderByDate',1)}}">
                <div class="reportDayText"> Day 2</div>                  
                <div class="reportDayValue">{{$day_one_processing_order}} </div>
            </a>

            <a class="col-md-1 box ml-3 dayThreeBg d-flex justify-content-center flex-column" href="{{route('processingOrderByDate',2)}}">
                <div class="reportDayText"> Day 3</div>                  
                <div class="reportDayValue">{{$day_two_processing_order}} </div>
            </a>

            <a class="col-md-1 box ml-3 dayFourBg d-flex justify-content-center flex-column" href="{{route('processingOrderByDate',3)}}">                                   
                <div class="reportDayText"> Day 4</div>                  
                <div class="reportDayValue">{{$day_three_processing_order}} </div>
            </a>

            <a class="col-md-1 box ml-3 dayFiveBg d-flex justify-content-center flex-column" href="{{route('processingOrderByDate',4)}}">                                   
                <div class="reportDayText"> Day 5</div>                  
                <div class="reportDayValue">{{$day_four_processing_order}}</div>
            </a>

            <a class="col-md-1 box ml-3 allStatus d-flex justify-content-center flex-column" href="{{url('admin/pendingOrder/processing')}}">
                <div class="reportDayText"> All</div>                  
                <div class="reportDayValue">{{$all_processing_order}}</div>
            </a>
        </div>

        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">

            <div class="ml-3 col-md-1 reportTitleBg d-flex align-items-center pl-3 pr-3 box" href="#">
                <div class="reportText">Dispatch</div>
            </div>

            <a class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" href="{{route('dispatchByDate',0)}}">
                <div class="reportDayText">Today </div>                 
                <div class="reportDayValue">{{$today_dispatch_order}}</div>
            </a>              

            <a class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" href="{{route('dispatchByDate',1)}}">  
                <div class="reportDayText"> Day 2</div>                  
                <div class="reportDayValue">{{$day_one_dispatch_order}}</div>
            </a>

            <a class="col-md-1 box ml-3 dayThreeBg d-flex justify-content-center flex-column" href="{{route('dispatchByDate',2)}}">
                <div class="reportDayText"> Day 3</div>                  
                <div class="reportDayValue">{{$day_two_dispatch_order}}</div>
            </a>

            <a class="col-md-1 box ml-3 dayFourBg d-flex justify-content-center flex-column" href="{{route('dispatchByDate',3)}}">  
                <div class="reportDayText"> Day 4</div>                  
                <div class="reportDayValue">{{$day_three_dispatch_order}}</div>
            </a>

            <a class="col-md-1 box ml-3 dayFiveBg d-flex justify-content-center flex-column" href="{{route('dispatchByDate',4)}}">  
                <div class="reportDayText"> Day 5</div>                  
                <div class="reportDayValue">{{$day_four_dispatch_order}}</div>
            </a>

            <a class="col-md-1 box ml-3 allStatus d-flex justify-content-center flex-column" href="{{url('admin/pendingOrder/dispat')}}">
                <div class="reportDayText"> All</div>                  
                <div class="reportDayValue">{{$all_dispatch_order}}</div>
            </a>
        </div>

        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
            <div class="col-md-1 ml-3 box reportTitleBg d-flex align-items-center pl-3 pr-3" >                 
                <div class="reportText">Stock Moving</div>
            </div>

            <a class="col-md-1 box ml-3  todayBg d-flex justify-content-center flex-column" href="{{route('stockMove',7)}}">
                <div class="reportDayText">Week 1 </div>
                <div class="reportDayValue">                      
                    {{ $stcokMove['week1']}}
                </div>
            </a>

            <a class="col-md-1 box ml-3  todayBg d-flex justify-content-center flex-column" href="{{route('stockMove',15)}}">
                <div class="reportDayText"> Week 2</div>
                <div class="reportDayValue">
                    {{ $stcokMove['week2']}}
                </div>
            </a>

            <a class="col-md-1 box ml-3  dayThreeBg d-flex justify-content-center flex-column" href="{{route('stockMove',30)}}">
                <div class="reportDayText"> Month 1</div>
                <div class="reportDayValue">
                    {{ $stcokMove['month1']}}
                </div>
            </a>

            <a class="col-md-1 box ml-3  dayFourBg d-flex justify-content-center flex-column" href="{{route('stockMove',60)}}">
                <div class="reportDayText"> Month 2</div>
                <div class="reportDayValue">{{ $stcokMove['month2']}}</div>
            </a>

            <a class="col-md-1 box ml-3  dayFiveBg d-flex justify-content-center flex-column" href="{{route('stockMove',90)}}">
                <div class="reportDayText"> Month 3</div>
                <div class="reportDayValue">
                    {{ $stcokMove['month3']}}
                </div>
            </a>

            <a class="col-md-1 box ml-3  allStatus d-flex justify-content-center flex-column" href="{{url('admin/stock')}}">
                <div class="reportDayText"> All</div>
                <div class="reportDayValue"> {{ $stcokMove['week1']+$stcokMove['week2']+$stcokMove['month1']+$stcokMove['month2']+$stcokMove['month3']}}</div>
            </a>

        </div>
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
            <div class="col-md-1 ml-3 box reportTitleBg d-flex align-items-center pl-3 pr-3">
                <div class="reportText">Stock</div>
            </div>

            <div class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" >
                <a href="{{url('admin/stock')}}">
                    <div class="reportDayText">Pieces </div>
                    <div class="reportDayValue">{{$product_total_stock}}</div>
                </a>
            </div>


            <div class="col-md-1 box ml-3 dayThreeBg d-flex justify-content-center flex-column">
                <a href="{{url('admin/stock')}}">
                    <div class="reportDayText"> Amount</div>
                    <div class="text-center font-weight-div">
                        @php $d_sell=0; $a_sell=0; @endphp
                        @foreach($d_data as $d)
                        @php $d_sell+=DB::table('postmeta')->where('post_id',$d->post_id)->where('meta_key','sale_price')->sum('meta_value'); @endphp
                        @endforeach

                        @foreach($a_data as $a)
                        @php $a_sell+=DB::table('postmeta')
                        ->where('post_id',$a->post_parent)
                        ->where('meta_key','sale_price')
                        ->sum('meta_value'); @endphp
                        @endforeach
                        {{number_format($d_sell+$a_sell)}}
                    </div>
                </a>
            </div>
        </div>
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
            @php $total_d_data=0; $total_stock_data=0;  $pro_qty=0;$pro_alert_qty=0; $products_id=0; $weekly_lower_stock_count=0; $weekly_total_sold_out_product=0; @endphp  
            @foreach($pro as $pros)
            @foreach($pros->productMeta as $pro_info) 
            @if($pro_info->meta_key=='qty') @php $pro_qty=$pro_info->meta_value; @endphp @endif 
            @if($pro_info->meta_key=='alert_qty') @php $pro_alert_qty=$pro_info->meta_value; @endphp @endif  
            @endforeach
            @php
            $date = Carbon::parse($pros->post_date);
            $now = Carbon::now();
            $diff = $date->diffInDays($now);
            @endphp
            @if($diff<=7)
            @php 
            $products_id=$pros->ID; 
            $weekly_lower_stock_count=
            DB::table('postmeta')
            ->where('post_id',$products_id)
            ->where('meta_key','qty')
            ->where('meta_value','<=',$pro_alert_qty)
            ->count(); 
            @endphp
            @php
            @endphp
            @endif
            @endforeach 

            <div class="col-md-1 box ml-3 reportTitleBg d-flex align-items-center pl-3 pr-3" >
                <div class="reportText">Lower Stock</div>
                @php $totals_low=0; $i=0; $k=0; $j=0; $q=0; $qq=0; $low_stock_qtyy=0; @endphp
                @foreach($pro as $low)


                @foreach($low->productMeta as $meta)
                @if($meta->meta_key=='alert_qty')  @php $default_alert=$meta->meta_value; @endphp @endif
                @if($meta->meta_key=='attribute_low_stock')  @php $low_alert=$meta->meta_value; @endphp @endif  
                @endforeach

                @php
                $d_data=DB::table('postmeta')
                ->where('post_id',$low->ID) 
                ->where('meta_key','default_qty') 
                ->where('meta_value','<=',$default_alert) 
                ->select('post_id')
                ->count();
                $total_d_data+=$d_data;
                @endphp 

                @php 
                $at_data=DB::table('posts')
                ->where('post_parent',$low->ID) 
                ->where('meta_key','attribute_low_stock') 
                ->join('postmeta','postmeta.post_id','=','posts.ID')
                ->select('post_id','meta_value')
                ->first();
                @endphp

                @if(isset($at_data)) 
                @php 
                $stock_data=DB::table('posts')
                ->where('post_parent',$low->ID) 
                ->where('meta_key','attribute_stock') 
                ->where('meta_value','<=',$at_data->meta_value) 
                ->join('postmeta','postmeta.post_id','=','posts.ID')
                ->select('post_id','meta_value','post_parent')
                ->count();
                $total_stock_data+=$stock_data;
                @endphp
                @endif 
                @endforeach
            </div>

            <!-- <div class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column">
             <a href="{{route('lower.stock.weekly')}}">
              <div class="reportDayText">Weekly </div>
              <div class="reportDayValue">{{$j}}</div>
             </a>
            </div> -->

            <div class="col-md-2 box ml-3 todayBg d-flex justify-content-center flex-column"> 
                <a href="{{url('admin/stock/lower')}}">                
                    <div class="reportDayText"> All</div>
                    <div class="reportDayValue">

                        {{$total_d_data+$total_stock_data}}
                    </div>
                </a>
            </div>
        </div> 
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
            <div class="col-md-1 box ml-3 reportTitleBg d-flex align-items-center pl-3 pr-3" >                 
                <div class="reportText">Sold Out</div>
            </div>
            <!-- <div class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column">
              <a href="{{route('sold.out.stock.weekly')}}">
              <div class="reportDayText">Weekly</div>
              <div class="reportDayValue">
                @php $weekly_sold_out=0; @endphp 
                @foreach($pro as $sold_out) 
                        @php 
                        $date = Carbon::parse($sold_out->post_date);
                        $now = Carbon::now();
                        $diff = $date->diffInDays($now);
                        @endphp
                        @if($diff<=7) 
                                @php 
                                $weekly_sold_out+=DB::table('posts')->where(['post_type'=>'product','meta_key'=>'default_qty'])
                                ->where('meta_value','=',0)
                                ->whereYear('post_date',date('Y-m-d'))
                                ->join('postmeta','posts.ID','=','postmeta.post_id')
                                ->count();
                                @endphp
                        @endif
                @endforeach
             {{$weekly_sold_out}}
              </div>
               </a>


            </div> -->
            <div class="col-md-2 box ml-3 dayThreeBg d-flex justify-content-center flex-column">
                <a href="{{url('admin/stock/list/sold')}}">
                    <div class="reportDayText"> All</div>
                    <div class="reportDayValue">{{$yearly_total_sold_out_product}}</div>
                </a>
            </div>
        </div>
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">

            <div class="col-md-1 box ml-3 reportTitleBg d-flex align-items-center pl-3 pr-3" >
                <div class="reportText">Best Selling</div>
            </div>

            <div class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column" >
                <a href="{{url('admin/quickReport/best_selling_items')}}">
                    <div class="reportDayText">Monthly</div>
                    <div class="reportDayValue">
                        @php $item_monthly=0; @endphp
                        @foreach($monthly_best_sell_item as $best_monthly) 
                        @php $item_monthly+=$best_monthly->total_qty; @endphp  
                        @endforeach
                        {{$item_monthly}}
                    </div>
                </a>
            </div>

            <div class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column">
                <a href="{{route('b_sell_yearly')}}">
                    <div class="reportDayText">Yearly</div>
                    <div class="reportDayValue">
                        @php $item=0; @endphp
                        @foreach($yearly_best_sell_item as $best)  @php $item+=$best->total_qty; @endphp  @endforeach
                        {{$item}}
                    </div>
                </a>
            </div>
        </div> 
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">


            <div class="col-md-1 box ml-3  reportTitleBg d-flex align-items-center pl-3 pr-3" >
                <div class="reportText">Delivered</div>
            </div>


            <div class="col-md-1 box ml-3  todayBg d-flex justify-content-center flex-column">
                <a  href="{{url('delivered/order')}}">
                    <div class="reportDayText">Items</div>
                    <div class="reportDayValue">{{$delivered_qty}}</div>
                </a>
            </div>



            <div class="col-md-1 box ml-3  dayThreeBg d-flex justify-content-center flex-column">
                <a  href="{{url('delivered/order')}}">
                    <div class="reportDayText"> Amount</div>
                    <div class="reportDayValue">
                        @php $total_delivered_amount=0; $total_charge=0; @endphp
                        @foreach($delivered_order as $d_order)
                        @php $delivery=DB::table('order_itemmeta')->where('order_id',$d_order->ID)->where('meta_key','delivery_charge')->first(); @endphp @if(isset($delivery)) @php $charge=$delivery->meta_value; @endphp @else @php $charge=0; @endphp @endif
                        @php $total_charge+=$charge; @endphp
                        @foreach($d_order->orderItem as $item_order)
                        @foreach($item_order->orderMeta as $meta)
                        @if($meta->meta_key=='_line_subtotal') @php $total_delivered_amount+=$meta->meta_value; @endphp @endif
                        @endforeach 
                        @endforeach 
                        @endforeach
                        {{number_format($total_delivered_amount+$total_charge)}}
                    </div>
                </a>
            </div>
        </div>   
        <div class=" d-flex flex-row ml-2 mt-2 flex-wrap">
            <div class="col-md-1 box ml-3 reportTitleBg d-flex align-items-center pl-3 pr-3" >
                <div class="reportText">Gross Profit</div>
            </div>

            <div class="col-md-1 box ml-3 todayBg d-flex justify-content-center flex-column">
                <a href="{{route('g_profit_monthly')}}">
                    <div class="reportDayText">Monthly</div>
                    <div class="reportDayValue">
                        @php 
                        $qty=0; $total_qty=0; $sale_price=0; $total_sale_amount=0; $cost=0; $total_cost=0; $total_charge=0;

                        foreach($order_gross_profit_month as $item){                      
                            $delivery=DB::table('order_itemmeta')
                            ->where('order_id',$item->ID)
                            ->where('meta_key','delivery_charge')
                            ->first(); 
                            
                            if(isset($delivery)){
                                $charge=$delivery->meta_value;                        
                            }else{        
                                $charge=0;                    
                            }          

                            $total_charge+=$charge;
                            foreach($item->orderItem as $meta){
                                foreach($meta->orderMeta as $value){
                                    if($value->meta_key=='_qty'){
                                        $qty=$value->meta_value; 
                                        $total_qty+=$qty;                         
                                    }
                                    if($value->meta_key=='_line_subtotal'){
                                        $sale_price=$value->meta_value;
                                        $total_sale_amount+=$sale_price;                          
                                    }
                                }

                                  

                                $cost=DB::table('postmeta')
                                ->where('post_id',$meta->product_parent)
                                ->where('meta_key','product_stock')
                                ->first(); 
                                $total_cost+=$cost->meta_value*$qty;
                            
                           }
                             
                        }
                       echo $total_qty; 
                        @endphp 
                        {{number_format($total_sale_amount-$total_cost+$total_charge)}}
                    </div>
                </a>
            </div>
            <div class="col-md-1 box ml-3 dayThreeBg d-flex justify-content-center flex-column">
                <a href="{{url('admin/quickReport/gross_profit')}}">
                    <div class="reportDayText"> Yearly</div>
                    <div class="reportDayValue">
                        @php $qty=0; $total_qty=0; $sale_price=0; $total_sale_amount=0; $cost=0; $total_cost=0; $total_charge=0; @endphp
                        @foreach($order_gross_profit_yearly as $item)
                        @php $delivery=DB::table('order_itemmeta')->where('order_id',$item->ID)->where('meta_key','delivery_charge')->first(); @endphp @if(isset($delivery)) @php $charge=$delivery->meta_value; @endphp @else @php $charge=0; @endphp @endif 	
                        @php $total_charge+=$charge; @endphp
                        @foreach($item->orderItem as $meta)
                        @foreach($meta->orderMeta as $value) 
                        @if($value->meta_key=='_qty') @php $qty=$value->meta_value; $total_qty+=$qty;  @endphp @endif
                        @if($value->meta_key=='_line_subtotal') @php $sale_price=$value->meta_value; $total_sale_amount+=$sale_price;  @endphp @endif
                        @endforeach
                        @php $cost=DB::table('postmeta')->where('post_id',$meta->product_parent)->where('meta_key','product_stock')->first(); $total_cost+=$cost->meta_value*$qty; @endphp
                        @endforeach
                        @endforeach 
                        {{number_format($total_sale_amount-$total_cost+$total_charge)}}
                    </div>
                </a>
            </div>
        </div>    
    </div>  
</div>
@endsection