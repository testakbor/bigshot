@extends('front.layouts.front_master')
@section('content')
@php
$rprice=0;
$sprice=0;
$qty=0;
$image='no-image.png';
foreach ($product->productMeta as $meta):
if($meta['meta_key']=='_regular_price'):
$rprice=$meta['meta_value'];
endif;
if($meta['meta_key']=='sale_price'):
$sprice=$meta['meta_value'];
endif;
if($meta['meta_key']=='qty'):
$qty=$meta['meta_value'];
endif;
if($meta['meta_key']=='default_attribute'):
$metavalue=json_decode($meta['meta_value']);
endif;
if($meta['meta_key']=='attached_file'):
$image=$meta['meta_value'];
endif;
endforeach;
@endphp

<div class="container">
	<div class="d-flex flex-column mt-5 ">
		<div class="d-flex flex-column ">
			<div class="empyt text-center border-bottom border-dark pt-3 pb-3">{{$product->post_title}} </div>
			<div class="d-flex flex-row mt-2">
				<div class="proImag">
					<img  id="featured" src="{{asset('backend/products/'.$image)}}" class="img-fluid rounded" alt="Responsive image" height="auto">
					</div>
					<div class="d-flex flex-column pl-2">
						<div class="pname"></div>
						<div class="attri"> 
                                   @foreach($arributeArray as $a)
                                    @if($a->taxonomy=='pa_color')
                                    Color:{{$a->term}}
                                    @endif
                                    @if($a->taxonomy=='pa_size')
                                    Size:{{$a->term}}
                                    @endif
                                    @endforeach 
                                    </div>
						<div class="price">Price: 
							<span class="text-danger">tk. {{number_format($sprice)}}</span>
						</div>
						<div class="qty">
							<form class="" action="{{route('addCart')}}" method="POST">
                                  @csrf
                            
								<div class="d-flex flex-row">
									<div>Quantity: </div>
									<div class="ml-2">
										<input type="number" name="quantity" class="form-control" id="" value="1">
										</div>
									</div>
									<div class="mt-3">
                                @if($qty==0)
                                 Out of stock 
                                 @else  
                                
										<button type="submit" class="btn btn-primary mb-2 btn-large w-50">Buy</button> 
                                @endif
                                
										<a href="{{url('/wishlist/product/'.$product->ID)}}">
											<i class="far fa-heart ml-2 h4"></i>
										</a>
									</div>
									<input type="hidden" name="id" value="{{$product->ID}}">
										<input type="hidden" name="name" value="{{$product->post_title}}">
											<input type="hidden" name="main_qty" value="{{$qty}}">
												<input type="hidden" name="price" value="{{$sprice}}">
												</form>
											</div>
										</div>
                                    </div>
                                    
				
                    
                                <div class="row text-center text-lg-left">
                                    @foreach($gallery_images as $g)	
                                    <div class="col-lg-3 col-md-4 col-6">
                                    <a href="#" class="d-block mb-4 h-100">
                                            <img  class="img-fluid" src="{{asset('backend/products/'.$g->meta_value)}}" alt="">
                                        </a>
                                    </div>
                                     @endforeach
                                </div>
                         



									</div>
									<div class="infoDiv  mt-5">
										<ul class="nav nav-tabs">
											<li class="nav-item">
												<a href="#home" class="nav-link active" data-toggle="tab">Description</a>
											</li>
											<li class="nav-item">
												<a href="#profile" class="nav-link" data-toggle="tab">Related</a>
											</li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane fade show active p-3" id="home">
                                             {!! $product->post_content !!}
												    <p>
													<b>Delivery Guarantee</b> (Delivery Time and Delivery charge # Dhaka Metro 1-3
                                                    working
                                                    days, charge 60tk # Dhaka suburb area 2-5 working days, charge 100tk # Bangladesh
                                                    wide 2-5 working days,
                                                    120tk.)
												</p>
                                            </div>
                                            



											<div class="tab-pane fade" id="profile">
										    <div class="row text-center text-lg-left">
                                                    @php
                                                    $rprice=0;
                                                    $sprice=0;
                                                    $img='';
                                                    @endphp
                                                    @foreach($product_related as $related)
                                                    @php
                                                    $product_info=DB::table('postmeta')->where('post_id',$related->ID)->get();
                                                    @endphp
                                                    @foreach($product_info as $info)
                                                    @if($info->meta_key=='regular_price') @php $rprice=$info->meta_value @endphp
                                                    @endif
                                                    @if($info->meta_key=='sale_price') @php $sprice=$info->meta_value @endphp
                                                    @endif
                                                    @if($info->meta_key=='attached_file')
                                                    @php $img=$info->meta_value @endphp
                                                    @endif
                                                    @endforeach
                                                    <div class="col-lg-3 col-md-4 col-6">
                                                     








	<a href="{{url('product/'.$related->ID.'/'.urlencode($related->post_title))}}" class="d-block mb-4 h-100">
															<div class="card">
																<img style="height:200px" src="{{asset('backend/products/'.$img)}}" class="img-fluid">
																	<div class="card-body text-center">
																		<p class="card-text font-weight-bold">{{$related->post_title}}</p>
																		<p class="card-text">@if($rprice) 
																			<del style="color:red">৳{{$rprice}}</del>@endif 
																			<span style="color:#000000"> ৳{{$sprice}}</span>
																		</p>
																	</div>
																</div>
															</a>


























                                                            
                                                        </div>
                                                        @endforeach
                                                    </div>
                                                   {{$product_related->links()}}
                                                </div>
                                                
											</div>
										</div>
                                    </div>  
                                
    @endsection 