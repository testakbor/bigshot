@extends('front.layouts.master')

@section('content')

<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
        <div class="col-md-12 ">
          <div class="container-fluid mt-2">
              <div class="container">                    
                <article class="card">
        <header class="card-header"> My Orders List </header>
        <div class="card-body">
            <!-- <h6>Order ID: OD45345345435</h6> -->
            <article class="card">
                  @php 
                    $i=1;
                    @endphp
                   @foreach($order_item as $value)
                    <div class="card-body row">
                    <div class="col"> <strong>Order Id #</strong>{{$i}} <br></div>
                    <div class="col"> <strong>Date</strong> <br>@if(isset($shop_order->post_date)) {{date('d-M-Y',strtotime($shop_order->post_date))}} @endif</div>
                    <div class="col"> <strong>Status</strong> <br> @if(isset($shop_order->post_status)) {{$shop_order->post_status}} @endif  </div>
                    <div class="col"> <strong>Total</strong> <br>345435 </div>
                   <!--  <div class="col">
                        <figure class="itemside mb-3">
                            <div class="aside"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1571751108/Ecommerce/laptop-dell-xps-15-computer-monitors-laptops.jpg" class="img-sm border"></div>
                        </figure>
                    </div> -->
                    <div class="col">
                        <a href="" class="btn btn-success text-white" data-abc="true">View</a>
                    </div>
                </div>
                 @php 
                    $i++;
                    @endphp
                   @endforeach
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
