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
                <div class="col-md-1 ml-4 reportTitleBg d-flex align-items-center box pl-3 pr-3" >
                 
                  <div class="reportText">Pending Order</div>

                </div>
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="{{route('todayPendingOrder')}}">
                  <div class="reportDayText">Today </div>                 
                  <div class="reportDayValue">{{$today_pending_order}}</div>
                </a>
             
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="{{route('pendingOrderByDate',1)}}">                                 
                  <div class="reportDayText"> Day 1</div>                  
                  <div class="reportDayValue">{{$day_one_pending_order}}</div>
                </a>
           
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="#">                                    
                  <div class="reportDayText"> Day 2</div>                  
                  <div class="reportDayValue">{{$day_two_pending_order}}</div>
                </a>
          
              
                <a class="col-md-1 box ml-4 dayThreeBg d-flex justify-content-center flex-column" href="#"> 
                  <div class="reportDayText"> Day 3</div>                  
                  <div class="reportDayValue">{{$day_three_pending_order}}</div>
                </a>
        
              
                <a class="col-md-1 box ml-4 dayFourBg d-flex justify-content-center flex-column"  href="#">                                   
                  <div class="reportDayText"> Day 4</div>                  
                  <div class="reportDayValue">{{$day_four_pending_order}}</div>
                </a>
          
              
                <a class="col-md-1 box ml-4 dayFiveBg d-flex justify-content-center flex-column"  href="#">                                   
                  <div class="reportDayText"> Day 5</div>                  
                  <div class="reportDayValue">{{$day_five_pending_order}}</div>
                </a>
           
              
                <a class="col-md-1 box ml-4 allStatus d-flex justify-content-center flex-column"  href="#">
                  <div class="reportDayText"> All</div>                  
                  <div class="reportDayValue">{{$all_pending_order}}</div>
                </a>
             
        </div>     

           <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
           
                <div class="col-md-1 ml-4 reportTitleBg d-flex align-items-center pl-3 pr-3 box" >
                  <div class="reportText">Processing</div>
                </div>
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText">Today </div>                 
                  <div class="reportDayValue">{{$today_processing_order}}</div>
                </a>
              
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="#">                                  
                  <div class="reportDayText"> Day 1</div>                  
                  <div class="reportDayValue">{{$day_one_processing_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="#">                                   
                  <div class="reportDayText"> Day 2</div>                  
                  <div class="reportDayValue">{{$day_two_processing_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 dayThreeBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> Day 3</div>                  
                  <div class="reportDayValue">{{$day_three_processing_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 dayFourBg d-flex justify-content-center flex-column" href="#">                                   
                  <div class="reportDayText"> Day 4</div>                  
                  <div class="reportDayValue">{{$day_four_processing_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 dayFiveBg d-flex justify-content-center flex-column" href="#">                                   
                  <div class="reportDayText"> Day 5</div>                  
                  <div class="reportDayValue">{{$day_five_processing_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 allStatus d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> All</div>                  
                  <div class="reportDayValue">{{$all_processing_order}}</div>
                </a>
        </div>

        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
        
                <div class="ml-4 col-md-1 reportTitleBg d-flex align-items-center pl-3 pr-3 box" href="#">
                  <div class="reportText">Dispatch</div>
                </div>
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText">Today </div>                 
                  <div class="reportDayValue">{{$today_dispatch_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="#">                                  
                  <div class="reportDayText"> Day 1</div>                  
                  <div class="reportDayValue">{{$day_one_dispatch_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" href="#">                                   
                  <div class="reportDayText"> Day 2</div>                  
                  <div class="reportDayValue">{{$day_two_dispatch_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 dayThreeBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> Day 3</div>                  
                  <div class="reportDayValue">{{$day_three_dispatch_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 dayFourBg d-flex justify-content-center flex-column" href="#">                                   
                  <div class="reportDayText"> Day 4</div>                  
                  <div class="reportDayValue">{{$day_four_dispatch_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 dayFiveBg d-flex justify-content-center flex-column" href="#">                                   
                  <div class="reportDayText"> Day 5</div>                  
                  <div class="reportDayValue">{{$day_five_dispatch_order}}</div>
                </a>
              
                <a class="col-md-1 box ml-4 allStatus d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> All</div>                  
                  <div class="reportDayValue">{{$all_dispatch_order}}</div>
                </a>
        </div>
      
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
                <div class="col-md-1 ml-4 box reportTitleBg d-flex align-items-center pl-3 pr-3" >                 
                  <div class="reportText">Stock Moving</div>
                </div>
             
                <a class="col-md-1 box ml-4  todayBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText">Week 1 </div>
                  <div class="reportDayValue">5</div>
                </a>
             
                <a class="col-md-1 box ml-4  todayBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> Week 2</div>
                  <div class="reportDayValue">2</div>
                </a>
             
                <a class="col-md-1 box ml-4  dayThreeBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> Month 1</div>
                  <div class="reportDayValue">0</div>
                </a>
             
                <a class="col-md-1 box ml-4  dayFourBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> Month 2</div>
                  <div class="reportDayValue">10</div>
                </a>
             
                <a class="col-md-1 box ml-4  dayFiveBg d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> Month 3</div>
                  <div class="reportDayValue">5</div>
                </a>
             
                <a class="col-md-1 box ml-4  allStatus d-flex justify-content-center flex-column" href="#">
                  <div class="reportDayText"> All</div>
                  <div class="reportDayValue">0</div>
                </a>
              
        </div>
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
                <div class="col-md-1 ml-4 box reportTitleBg d-flex align-items-center pl-3 pr-3">
                  <div class="reportText">Stock</div>
                </div>
             
                <div class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" >
                  <a href="{{url('admin/stock')}}">
                  <div class="reportDayText">Pieces </div>
                  <div class="reportDayValue">{{$product_total_stock}}</div>
                  </a>
                </div>
             
              
                <div class="col-md-1 box ml-4 dayThreeBg d-flex justify-content-center flex-column">
                 <a href="{{url('admin/stock')}}">
                  <div class="reportDayText"> Amount</div>
                  <div class="text-center font-weight-div">
                 
                  @php $t_sell=0; @endphp
                  @foreach($data as $datas)
                    @foreach($datas->productMeta as $valus)
                      @if($valus->meta_key=='sale_price') @php $t_sell+=$valus->meta_value; @endphp @endif
                    @endforeach
                  @endforeach
                  {{$t_sell}}



                  </div>
                 </a>


                </div>
        </div>
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
                <div class="col-md-1 box ml-4 reportTitleBg d-flex align-items-center pl-3 pr-3" >
                  <div class="reportText">Lower Stock</div>
                </div>
                <div class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" >                 
                  <div class="reportDayText">Weekly </div>
                  <div class="reportDayValue">5</div>
                </div>
                <div class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column">                 
                  <div class="reportDayText"> All</div>
                  <div class="reportDayValue">2345450</div>
                </div>
        </div> 
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
                <div class="col-md-1 box ml-4 reportTitleBg d-flex align-items-center pl-3 pr-3" >                 
                  <div class="reportText">Sold Out</div>
                </div>
                <div class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" >
                  <div class="reportDayText">Weekly</div>
                  <div class="reportDayValue">5</div>
                </div>
                <div class="col-md-1 box ml-4 dayThreeBg d-flex justify-content-center flex-column">
                  <div class="reportDayText"> Yearly</div>
                  <div class="reportDayValue">300</div>
                </div>
        </div>
         <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
           
                <div class="col-md-1 box ml-4 reportTitleBg d-flex align-items-center pl-3 pr-3" >
                  <div class="reportText">Best Selling</div>
                </div>
         
                <div class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" >
                  <div class="reportDayText">Weekly</div>
                  <div class="reportDayValue">5</div>
                </div>
            
                <div class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" >
                  <div class="reportDayText"> Yearly</div>
                  <div class="reportDayValue">300</div>
                </div>
        </div> 
        <div class="d-flex flex-row ml-2 mt-2 flex-wrap">
         
         
                <div class="col-md-1 box ml-4  reportTitleBg d-flex align-items-center pl-3 pr-3" >
                  <div class="reportText">Delivered</div>
                </div>
             
          
                <div class="col-md-1 box ml-4  todayBg d-flex justify-content-center flex-column">
                  <a  href="{{url('delivered/order')}}">
                    <div class="reportDayText">Quantity</div>
                    <div class="reportDayValue">{{$delivered_qty}}</div>
                  </a>
                </div>
      

           
                <div class="col-md-1 box ml-4  dayThreeBg d-flex justify-content-center flex-column">
                        <a  href="{{url('delivered/order')}}">
                  <div class="reportDayText"> Amount</div>
                  <div class="reportDayValue">
                 @php $total_delivered_amount=0; @endphp
                 @foreach($delivered_order as $d_order)
                     @foreach($d_order->orderItem as $item_order)
                       @foreach($item_order->orderMeta as $meta)
                         @if($meta->meta_key=='_line_subtotal') @php $total_delivered_amount+=$meta->meta_value; @endphp @endif
                       @endforeach 
                     @endforeach 
                 @endforeach
                 {{$total_delivered_amount}}
                  </div>
                 </a>
                </div>
        </div>   
      <div class=" d-flex flex-row ml-2 mt-2 flex-wrap">
                <div class="col-md-1 box ml-4 reportTitleBg d-flex align-items-center pl-3 pr-3" >
                  <div class="reportText">Gross Profit</div>
                </div>
              
                <div class="col-md-1 box ml-4 todayBg d-flex justify-content-center flex-column" >
                  <div class="reportDayText">Monthly</div>
                  <div class="reportDayValue">
                 @php  $total_profits=0; $sale_prices=0; $costs=0; @endphp
                    @foreach($order_gross_profit_month as $item) 
                        @foreach($item->orderItem as $meta)
                            @foreach($meta->orderMeta as $value)
                            @if($value->meta_key=='_line_subtotal') @php $sale_prices+=$value->meta_value; @endphp @endif
                        @endforeach
                        @endforeach

                        @foreach($item->orderItem as $meta)
                          @foreach($meta->postMeta as $value)
                          @if($value->meta_key=='product_stock') @php $costs+=$value->meta_value; @endphp @endif
                        @endforeach
                        @endforeach
                    @endforeach
                   @php $total_profits=$sale_prices-$costs; @endphp
                  {{number_format($total_profits)}}
                  </div>
                </div>
                <div class="col-md-1 box ml-4 dayThreeBg d-flex justify-content-center flex-column">
                      <a href="{{url('admin/quickReport/gross_profit')}}">
                  <div class="reportDayText"> Yearly</div>
                  <div class="reportDayValue">
                    @php  $total_profit=0; $sale_price=0; $cost=0; @endphp
                    @foreach($order_gross_profit_yearly as $item) 
                        @foreach($item->orderItem as $meta)
                            @foreach($meta->orderMeta as $value)
                            @if($value->meta_key=='_line_subtotal') @php $sale_price+=$value->meta_value; @endphp @endif
                        @endforeach
                        @endforeach

                        @foreach($item->orderItem as $meta)
                          @foreach($meta->postMeta as $value)
                          @if($value->meta_key=='product_stock') @php $cost+=$value->meta_value; @endphp @endif
                        @endforeach
                        @endforeach
                    @endforeach
                   @php $total_profit=$sale_price-$cost; @endphp
                  {{number_format($total_profit)}}
                </div>
               </a>
            </div>
           </div>    
        </div>  
  </div>
@endsection