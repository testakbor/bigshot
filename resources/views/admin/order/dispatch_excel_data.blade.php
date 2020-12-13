<!DOCTYPE html>
<html>
<head>
<title>Dispatch Order Excel</title>
</head>
<body>

<table>
    <thead>
	    <tr style="border: 2px solid #000000;">
          <th>Order Id</th>
          <th>Name</th>
          <th>Mobile</th>
          <th>Address</th>
          <th>Delivery Charge</th>
          <th>Amount</th>
    	</tr>
    </thead>
    <tbody>
    @php $name=''; $mobile=''; $address=''; $amount=0;  @endphp
    @foreach($data as $row)
      @foreach($row->productMeta as $user_info) 
        @if($user_info->meta_key=='first_name') @php $name=$user_info->meta_value; @endphp @endif
        @if($user_info->meta_key=='phone') @php $mobile=$user_info->meta_value; @endphp @endif
        @if($user_info->meta_key=='address_one') @php $address=$user_info->meta_value; @endphp @endif
      @endforeach
       @foreach($row->orderItem as $order)
          @foreach($order->orderMeta as $meta)
            @if($meta->meta_key=='_line_subtotal') @php $amount=$meta->meta_value; @endphp @endif
          @endforeach
       @endforeach
    	<tr>
    	    <td>{{ $row->ID}} {{date('d-m-Y',strtotime($row->post_date))}}</td>     
    	    <td>{{ $name}}</td>     
    	    <td>{{ $mobile}}</td>     
    	    <td>{{ $address}}</td>     
    	    <td>@php $delivery=DB::table('order_itemmeta')->where('order_id',$row->ID)->where('meta_key','delivery_charge')->first(); @endphp @if(isset($delivery)) @php $charge=$delivery->meta_value; @endphp @else @php $charge=0; @endphp @endif {{$charge}}</td>     
    	    <td>{{ $amount+$charge}}</td>     
	   </tr>
    @endforeach
    </tbody>
</table>

</body>
</html>