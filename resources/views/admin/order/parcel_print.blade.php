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
          <thead>
          <tr style="background: #e7e7e7;">
                  <th style="font-size: 10px;">Id</th>
									<th style="font-size: 10px;">Name</th>
									<th style="font-size: 10px;">Mobile</th>
									<th style="font-size: 10px;">Address</th>
                  <th style="font-size: 10px;">Items</th>
                  <th style="font-size: 10px;">Charge</th>
									<th style="font-size: 10px;">Amount</th>
            </tr>
          </thead>
          <tbody>
            <tr>
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
                @endforeach
                  	<td style="font-size: 10px;">{{$item->ID}}</td>
										<td style="font-size: 10px;">{{$first_name}} {{$last_name}}</td>
									
                    <td style="font-size: 0.65rem">{{$mobile_no}}</td>
                    	<td style="font-size: 10px;">{{$address}}</td>
              <td>
                @php $tot_parcel=0; $to_amount_charge=0; $att=0; $q=0;$s=0; $att=0; $total_parcel=0; $product=''; $qty=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $first_name=''; $last_name=''; @endphp
                    @foreach($orders as $item)
                    @foreach($item->orderItem as $meta)
                                      <table style="width:100%">
                                            <tr>
                                              <th style="font-size: 10px;">Name</th>
                                              <th style="font-size: 10px;">Attribute</th>
                                              <th style="font-size: 10px;">Qty</th>
                                              <th style="font-size: 10px;">Amount</th>
                                            </tr>
                                            <tr>
                                              <td style="font-size: 0.65rem">{{$meta->order_item_name}}</td>
                                              <td style="font-size: 0.65rem;width: 40%">
                                                @foreach($meta->orderMeta as $value)
                                                        @if($value->meta_key=='attribute_parent')
                                                          @php $att=$value->meta_value; @endphp
                                                        @endif 
                                                  @endforeach
                                             @php 
                                                $list_att=DB::table('postmeta')->where('post_id',$att)
                                                ->where('meta_key','attribute')->get(); 
                                            @endphp
                                            @foreach($list_att as $a)
                                              @php $data_att=json_decode($a->meta_value); @endphp 
                                                  @foreach($data_att as $da)
                                              
                                                      {{$da->taxonomy}} : {{$da->term}}
                                                      </br>
                                                @endforeach 
                                            @endforeach 
                                              </td>
                                              <td>
                                                  @foreach($meta->orderMeta as $value)
                                                        @if($value->meta_key=='_qty')
                                                          @php $q=$value->meta_value; @endphp
                                                        @endif 

                                                        @if($value->meta_key=='attribute_parent')
                                                          @php $att=$value->meta_value; @endphp
                                                        @endif 
                                                
                                                  @endforeach
                                                {{$q}} @php $tot_parcel+=$q; @endphp
                                              </td>
                                              <td>
                                                @foreach($meta->orderMeta as $value)
                                                @if($value->meta_key=='_line_subtotal')
                                                    @php $s=$value->meta_value; @endphp
                                                  @endif 
                                                  
                                              @endforeach
                                                {{number_format($s)}} 
                                                @php $to_amount_charge+=$s; $grandTotal+=$s; @endphp
                                              </td>
                                            </tr>
                                          
                                          </table>
                                      @endforeach
                                      @endforeach
                                    </td>
                                    <td>{{$charge}}</td>
                                    <td>{{ number_format($to_amount_charge+$charge)}}</td>
                                  </tr>
                                
                                </tbody>
                                <tfoot>
                                  <tr>
                                    <td style="font-size: 0.7rem" colspan="3">Total Parcel</td>
                                    <td style="font-size: 0.7rem">{{number_format($to_amount_charge+$charge)}} tk</td>                                    
                                    
                                  </tr>
                                </tfoot>
                       </table>
                      <div class="col1">
                          <p>Receiver:</p>
                          <p>Signature:</p>
                          <p>Name:</p>
                        </div>
						</body>
					</html>