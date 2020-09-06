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
                   @foreach($orders as $value)
                   @foreach ($value->productMeta as $meta)
                   @if($meta['meta_key']=='_order_total')
                   @php                            
                   $total=$meta['meta_value'];
                   @endphp
                 @endif
                   
                   @endforeach
                <div class="card-body row">
                    <div class="col"> <strong>Order Id #</strong>{{$i}} <br></div>
                    <div class="col"> <strong>Date</strong> <br>{{$value->post_date}}</div>
                    <div class="col"> <strong>Status</strong> <br> {{$value->post_status}}  </div>
                    <div class="col"> <strong>Total</strong> <br>{{$value->total}} </div>
                   <!--  <div class="col">
                        <figure class="itemside mb-3">
                            <div class="aside"><img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1571751108/Ecommerce/laptop-dell-xps-15-computer-monitors-laptops.jpg" class="img-sm border"></div>
                        </figure>
                    </div> -->
                    <div class="col">
                        <a href="{{route('order.edit',$value->ID)}}" class="btn btn-success text-white" data-abc="true">View</a>
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
