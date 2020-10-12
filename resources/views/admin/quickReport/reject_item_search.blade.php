@extends('admin.layouts.master')
@section('content')

<div class="content-wrapper" style="min-height: 1203.6px;">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			    @include('admin.includes.messages')
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Reject Item List</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item">
							<a href="{{route('admin.home')}}">Home</a>
						</li>
						<li class="breadcrumb-item active">Reject Item</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- Main content -->
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2"></div>
		</div>
		<!-- /.container-fluid -->
		<div class="s002">
			<form method="post" action="{{route('reject.item.search.data')}}">
			 @csrf 
					<div class="inner-form ml-5">
						<div class="input-field second-wrap">
							<div class="icon-wrap">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
									<path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
								</svg>
							</div>
							<input name="start" class="datepicker" id="depart" type="date" placeholder="29 Aug 2018" value="{{date('Y-m-01')}}" />
						</div>
						<div class="input-field third-wrap">
							<div class="icon-wrap">
								<svg
									xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
									<path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
								</svg>
							</div>
							<input name="end" class="datepicker" id="return" type="date" placeholder="30 Aug 2018" value="{{date('Y-m-t')}}" />
						</div>
						<div class="input-field fifth-wrap">
							<button type="submit" class="btn-search" type="button">SEARCH</button>
						</div>
					</div>
				</form>
           </div>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container">
				<div class="card">
					<div class="card-header">
					</div>
					<div class="card-body">
						<div class="table-responsive-sm">
							<table class="table table-striped">
								<thead>
									<tr>
										<th class="center">SKU</th>
										<th>Categories</th>
										<th class="right">Quantity</th>
										<th class="right">Amount</th>
										<th class="right">Reject Date</th>
										<th class="right">Action</th>
									</tr>
								</thead>
								<tbody>
									@php $sku=''; $qty=0; $total_qty=0;$amount=0;$total_amount=0;$reject_date=''; @endphp
									@foreach($data as $item)
									@foreach($item->productMeta as $meta)
									 @if($meta->meta_key=='_sku') @php $sku=$meta->meta_value; @endphp @endif
									 @if($meta->meta_key=='reject_qty') @php $qty=$meta->meta_value; @endphp @endif
									 @if($meta->meta_key=='sale_price') @php $amount=$meta->meta_value; @endphp @endif
									 @if($meta->meta_key=='reject_date') @php $reject_date=$meta->meta_value; @endphp @endif
									@endforeach
									<tr>
										<td class="center">{{$sku}}<br>{{date('d-m-Y',strtotime($item->post_date))}}</td>
										<td>@php $category=DB::table('term_relationships')
										->where('object_id',$item->ID)
										->where('taxonomy','product_cat')
										->join('term_taxonomy','term_relationships.term_taxonomy_id','=','term_taxonomy.term_taxonomy_id')
										->join('terms','terms.term_id','=','term_taxonomy.term_id')
										->select('terms.name as cat_name')
										->first(); @endphp @if(isset($category)) {{$category->cat_name}} @else @php $category=''; @endphp @endif
									   </td>
										<td class="right">{{$qty}}</td>
										<td class="right">{{$amount}}</td>
										<td class="right">{{date('d-m-Y',strtotime($reject_date))}}</td>
										<td class="right"><a class="btn btn-danger btn-sm" href="{{route('reject.item.remove.data',$item->ID)}}">Remove</a></td>
									</tr>
									@php $total_qty+=$qty;$total_amount+=$amount; @endphp
									@endforeach 
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-4 col-sm-5"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="box bg-primary">
							<!-- <i class="fa fa-lemon ml-1"></i> -->
							<h3 class="text-center">{{$total_qty}}</h3>
							<p class="lead text-center font-weight-bold">Total Quantity</p>
						</div>
					</div>
					<div class="col-md-4 ">
						<div class="box bg-info">
							<!-- <i class="fa fa-handshake ml-1"></i> -->
							<h3 class="text-center">{{$total_amount}}</h3>
							<p class="lead text-center font-weight-bold">Total Amount</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
	<!-- /.content -->
	<!--  </div> -->
</div>
@endsection