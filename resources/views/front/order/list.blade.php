@extends('front.layouts.master')
@section('content')
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
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
                        <td><a class="btn btn-success" href="{{route('customer_ordere_edit',$order->ID)}}"><span style="color:#ffffff">View</span></a></td>
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
