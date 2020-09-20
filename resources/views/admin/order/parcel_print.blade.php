<?php 
use App\Model\front\Order_item;
?>
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>


<h1>Company Name : Bigshot</h1>
<p>Company Email: Demo@email.com</p>
<p>Company Address : Demo Address</p>
<table class="table table-striped">
                <thead>
                  <tr>
                  <th class="center">Oder Id</th>
                  <th>Name</th>
                  <th>Address</th>
                  <th class="right">Items</th>
                  <th class="center">Qty</th>
                  <th class="right">Amount</th>
                  <th class="right">Status</th>
                  <!-- <th class="right">Action</th> -->
                  </tr>
                </thead>

                <tbody>
                @php $product=''; $qty=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $cust=''; @endphp
                @foreach($orders as $items)
                 @php 
                   $products=Order_item::where('order_id',$items->ID)->get();
                   $order_info=DB::table('postmeta')
                   ->where('post_id',$items->ID)
                   ->get();
                 @endphp
                 @foreach($products as $item)
                    @php $product=$item->order_item_name; @endphp
                    @foreach($item->orderMeta as $value)
                    @php              
                    if($value->meta_key=='_line_subtotal'){
                      $subtotal=$value->meta_value;
                    }
                    if($value->meta_key=='_qty'){
                      $qty=$value->meta_value;
                    }
                    @endphp
                    @endforeach 
                  @endforeach 
                  @foreach($order_info as $info)
                    @if($info->meta_key=='_billing_phone')
                     @php $mobile_no=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='address_one')
                     @php $address=$info->meta_value; @endphp
                    @endif 

                    @if($info->meta_key=='_sku')
                     @php $sku=$info->meta_value; @endphp
                    @endif 

                    @if($info->meta_key=='_customer_user') 
                      @php $customer=$info->meta_value; $user=DB::table('users')->where('id',$customer)->get(); @endphp 
                      @foreach($user as $users) @php $cust=$users->name; @endphp @endforeach
                    @endif
                  @endforeach 
                  <tr>
                      <td class="center">{{$items->ID}}</td>
                      <td class="left strong">{{$cust}}</td>
                      <td class="left">{{$address}}</td>
                      <td class="right">{{$product}}</td>
                      <td class="center">{{$qty}}</td>
                      <td class="right">{{$sub = $subtotal*$qty}}</td>
                      <td class="right">{{$items->post_status}}</td>
                      <!-- <td class="right"></td> -->
                  </tr>
                  @php $grandTotal+=$sub; @endphp
                  @endforeach 
                </tbody>
                <tfoot>
  <tr>
    <td colspan="6">Processing</td>
    <td>{{$total_orders}}</td>
  </tr>
   <tr>
    <td colspan="6">Total Percel</td>
    <td>{{$grandTotal}}</td>
  </tr>
</tfoot>

              </table>
<script type="text/javascript">
  window.print();
</script>
</body>
</html>
