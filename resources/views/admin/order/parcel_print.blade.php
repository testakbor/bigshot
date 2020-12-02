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
					<p> Invoice Number:{{rand()}} </p>
					<p>{{$company_name}}</p>
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
									<th>Order Id</th>
									<th>Name</th>
									<th>Mobile</th>
									<th>Address</th>
									<th>Items</th>
									<th>Quantity</th>
									<th>Amount</th>
								</tr>
								<tbody>
                 @php $att=0; $total_parcel=0; $product=''; $qty=0; $total_qty=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $first_name=''; $last_name=''; @endphp
                 @foreach($orders as $key=>$item)
                     @foreach($item->productMeta as $info) 
                     @if($info->meta_key=='phone')
                     @php $mobile_no=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='address_one')
                     @php $address=$info->meta_value; @endphp
                    @endif  
                      @if($info->meta_key=='first_name')
                     @php $first_name=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='last_name')
                     @php $last_name=$info->meta_value; @endphp
                    @endif 
                @endforeach
									<tr>
										<th>{{$item->ID}}</th>
										<th>{{$first_name}} {{$last_name}}</th>
										<th>{{$address}}</th>
										<th>{{$mobile_no}}</th>
										<td>
                      <table style="width:100%">
                              @foreach($item->orderItem as $meta)
                              <tr>
                                <td>{{$meta->order_item_name}}</td>
                              </tr>
                              @endforeach
							</table>
							  @foreach($item->orderItem as $meta)
                              @foreach($meta->orderMeta as $value)
                                 @if($value->meta_key=='attribute_parent')
                                    @php $att=$value->meta_value; @endphp
                                  @endif 
                               @endforeach
                               @endforeach
                    <table class="table">
                          <tbody>
                             @php 
                                $list_att=DB::table('postmeta')->where('post_id',$att)
                                ->where('meta_key','attribute')->get(); 
                             @endphp
                             @foreach($list_att as $a)
                              @php $data_att=json_decode($a->meta_value); @endphp 
                                  @foreach($data_att as $da)
                                    <tr>
                                      <td>{{$da->taxonomy}}:</td>
                                      <td>{{$da->term}}</td>
                                    </tr>
                                @endforeach 
                             @endforeach 
                          </tbody>
                        </table>

                    </td>
										<td>
                           <table style="width:100%">
                              @foreach($item->orderItem as $meta)
                              @foreach($meta->orderMeta as $value)
                                 @if($value->meta_key=='_qty')
                                    @php $qty=$value->meta_value; @endphp
                                  @endif 
                               @endforeach
                              <tr>
                                <td>{{$qty}}</td>
                              </tr>
                              @php $total_qty+=$qty; @endphp
                              @endforeach
                            </table>
                    </td>
										<td>
                       <table style="width:100%">
                              @foreach($item->orderItem as $meta)
                              @foreach($meta->orderMeta as $value)
                                 @if($value->meta_key=='_line_subtotal')
                                    @php $subtotal=$value->meta_value; @endphp
                                  @endif 
                               @endforeach
                              <tr>
                                <td>{{number_format($subtotal)}}</td>
                              </tr>
                              @php $grandTotal+=$subtotal; @endphp
                              @endforeach
                            </table>
                    </td>
									</tr>
                 @endforeach 
								</tbody>
								<tfoot>
									<tr>
										<td>Total Parcel </td>
										<td>{{$grandTotal}}</td>
										<td></td>
										<td></td>
										<td>Total</td>
										<td>{{$total_qty}}</td>
										<td>{{number_format($grandTotal)}}tk</td>
									</tr>
								</tfoot>
							</table>
							<div class="col1">
								<p>Receiver</p>
								<p>Signature:</p>
								<p>Name:</p>
							</div>
						</body>
					</html>