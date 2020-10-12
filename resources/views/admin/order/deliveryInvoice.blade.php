<!DOCTYPE html>
<html>
<head>
<title>Delivery Invoice</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
  .col1{
   width:50%;
   float: left;
  }
  .col2{
  width:50%;
   float: left;
  }

</style>
</head>
<body>

      <div class="container">
          <h1 class="text-center">Delivery Invoice</h1>
         <p class="text-center">BiGshot Clothing</p>
         <p class="text-center">House 15/1, Road 4, Block A, Section 10, Mirpur, Dhaka.</p>
         <p class="text-center">Mobile: 0000000000000</p>
     </div>

     <div class="container">
       <div class="col1">
         <p> Invoice Number:{{$order->ID}} </p>
         <p>Delivery Company Name </p>
       </div>
       <div class="col2">
        <p> Date: {{date('d-m-Y')}}</p>
       </div>
     </div>
     <br>
     <br>
     <br>
     <br>


      <table style="width:100%" class="table">
  <tr style="background: #e7e7e7;">
    <th>#</th>
    <th>Order Id</th>
    <th>Name</th>
    <th>Mobile</th>
    <th>Address</th>
    <th>Items</th>
    <th>Quantity</th>
    <th>Amount</th>
  </tr>
  <tbody>
       @php
                                        $subtotal=0;
                                        $qty=0;
                                        $total_qty=0;
                                        $total=0;
                                        $grandTotal=0;
                                        $grandLinetotal=0;
                                        $total_sub=0;
                                        @endphp
                                        @foreach($products as $key=>$items)
                                        @foreach($items->orderMeta as $value)
                                        @php
                                        if($value->meta_key=='_line_subtotal'){
                                        $subtotal=$value->meta_value;
                                        }
                                        if($value->meta_key=='_qty'){
                                        $qty=$value->meta_value;
                                        }
                                        if($value->meta_key=='_line_total'){
                                        $total=$value->meta_value;
                                        }
                                        @endphp
                                        @endforeach
  <tr>
    <td>{{++$key}}</td>
    <th>{{$order->ID}}</th>
    <th>{{$name->meta_value}}</th>
    <th>{{$phone->meta_value}}</th>
    <th>{{$address->meta_value}}</th>
    <td>{{$items->order_item_name}}</td>
    <td>{{$qty}}</td>
    <td>{{$subtotal}}</td>
  </tr>
      @php
                                        $grandTotal +=$subtotal;
                                        $grandLinetotal +=$total;
                                           $total_qty+=$qty;
                                        @endphp
                                        @endforeach
  </tbody>
  <tfoot>
    <tr>
      <td>Total Parcel </td>
      <td>{{$total_parcel}}</td>
      <td></td>
      <td></td>
      <td></td>
      <td>Total</td>
      <td>{{$total_qty}}</td>
      <td>{{number_format($grandTotal)}}tk</td>
    </tr>
  </tfoot>
  <div class="col1">
         <p>Receiver</p>
         <p>Signature:</p>
         <p>Name:</p>
  </div>
</table>

</body>
</html>