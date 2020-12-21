
@extends('admin.layouts.master')
@section('content')

<style></style>
<div class="content-wrapper" style="min-height: 1203.6px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<!-- <h1>Pending Order</h1> -->
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<a href="{{route('admin.home')}}">Home</a>
						</li>
						<li class="breadcrumb-item active">Gross profit</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
		<div class="s002">
	





 <div class="d-flex font-weight-bold justify-content-center h2 mb-3">Search Gross profit</div>
    <div class="d-flex justify-content-center">
      <form class="form-inline" method="post" action="{{route('order.grossProfit.report')}}" >
        @csrf() 
        <div class="form-group mb-2">
          <label for="depart" class="mr-2">Start Date </label>
          <input class="form-control datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date"/>
        </div>
        <div class="form-group mx-sm-3 mb-2">
          <label for="return" class="mr-2">End Date </label>
          <input class="form-control datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date"/>
        </div>
        <button type="submit" class="btn btn-primary mb-2">SEARCH</button>
      </form>
    </div>
	</div>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="container">
			<h4 class="text-center"></h4>
			<div class="card">
				<div class="card-body">
					<div class="table-responsive-sm">
						<table class="table">
							<tr style="background:#e7e7e7;">
								<th>Date</th>
								<th>Order Id  </th>
								<th>Description</th>
								<th>Quantity</th>
								<th>Sales amount</th>
								<th>Purchase Price</th>
								<th></th>
								<th>Gross Profit</th>
							</tr>
							<tbody>
								@php $total_charge=0; $total_qty=0; $total_sale_amount=0; $total_cost=0; $total_profit=0; $qty=0; $product_id=0; $sale_price=0; $cost=0; @endphp
								@foreach($order as $item)
								<tr>
									<td>{{date('d-m-Y',strtotime($item->post_date))}}</td>
									<td>{{$item->ID}} 
								@php $delivery=DB::table('order_itemmeta')->where('order_id',$item->ID)->where('meta_key','delivery_charge')->first(); @endphp @if(isset($delivery)) @php $charge=$delivery->meta_value; @endphp @else @php $charge=0; @endphp @endif 	
								@php $total_charge+=$charge; @endphp	
									</td>
									<td>
										<table style="width:100%">
                                         @foreach($item->orderItem as $meta)
											<tr>
												<td>
												@php $category=DB::table('term_relationships')
												->where('object_id',$meta->product_parent)
												->where('taxonomy','product_cat')
												->join('term_taxonomy','term_relationships.term_taxonomy_id','=','term_taxonomy.term_taxonomy_id')
												->join('terms','terms.term_id','=','term_taxonomy.term_id')
												->select('terms.name as cat_name')
												->first(); @endphp 	
												{{$meta->order_item_name}}(@if(isset($category)) 
												{{$category->cat_name}} @else @php $category=''; @endphp @endif) 
											
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
                                  
                                      {{$da->taxonomy}}:
                                      {{$da->term}}
                                    
                                @endforeach 
                             @endforeach 
											
											
											</td>
												</tr>
												





											@endforeach
										</table>
									</td>
									<td>
										<table style="width:100%">
											@foreach($item->orderItem as $meta)
												@foreach($meta->orderMeta as $value) 
												@if($value->meta_key=='_qty') @php $qty=$value->meta_value; @endphp @endif
											@endforeach
											<tr>
												<td>{{$qty}} pcs  </td>
											</tr>
											@php $total_qty+=$qty; @endphp
											@endforeach
										</table>
									</td>
									<td>
										<table style="width:100%">
										@foreach($item->orderItem as $meta)
										@foreach($meta->orderMeta as $value)
											@if($value->meta_key=='_line_subtotal') @php $sale_price=$value->meta_value; @endphp @endif
										@endforeach
											<tr>
												<td>{{number_format($sale_price)}}</td>
											</tr>
										@php $total_sale_amount+=$sale_price; @endphp
										@endforeach
										</table>
									</td>
									<td>
										<table style="width:100%">
										@foreach($item->orderItem as $meta)
										@php $cost=DB::table('postmeta')->where('post_id',$meta->product_parent)->where('meta_key','product_stock')->first(); @endphp
											<tr>
												<td>{{number_format($cost->meta_value * $qty)}}</td>
											</tr>
										@php $total_cost+=$cost->meta_value*$qty; @endphp
										@endforeach
										</table>
									</td>
									<td></td>
									<td>
										<table style="width:100%">
										@foreach($item->orderItem as $meta)
										@foreach($meta->orderMeta as $value)
										@if($value->meta_key=='_line_subtotal') @php $sale_price=$value->meta_value; @endphp @endif
										@endforeach
											<tr>
												<td>@php $profit=$sale_price-$cost->meta_value*$qty; @endphp {{number_format($profit)}}</td>
											</tr>
                                        @endforeach
										</table>
									</td>
								</tr>
                                        @endforeach 
							</tbody>
							<tfoot>
								<tr style="background:#e7e7e7;">
									<td><b>Total</b></td>
									<td></td>
									<td></td>
									<td>{{$total_qty}}</td>
									<td>{{number_format($total_sale_amount)}} tk</td>
									<td>{{number_format($total_cost)}} tk</b></td>
									<td>delivery charge: {{number_format($total_charge)}} tk</td>
									<td>{{number_format($total_sale_amount-$total_cost+$total_charge)}} tk</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
@endsection
