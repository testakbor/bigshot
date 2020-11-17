@extends('front.layouts.front_master')
@section('title') Bigshot | Home @endsection 
@section('content')
		<div class="container">
			<div class="d-flex flex-column">
			   <div class="banner">
                             @php
                        $banner=DB::table('posts')
                        ->where('post_type','banner')
                        ->join('postmeta','posts.ID','=','postmeta.post_id')
                        ->first();
                        @endphp
                        @if(isset($banner))
                  @if($banner->meta_key=='banner_image') @php $img=$banner->meta_value; @endphp @endif
                    <img src="{{asset('backend/banner/'.$img)}}" width="1267" class="img-responsive img-fluid" alt="Responsive image" width="1267">
                 @endif
                      
                    </div>
				<div class="d-flex flex-wrap mt-3">
                @if($product->count()>0)
                    @php
                        $rprice=0;
                        $sprice=0;
                        $img='';
                        @endphp
                        @foreach($product as $item)
                        @php $product_info=DB::table('postmeta')->where('post_id',$item->ID)->get(); @endphp
                        @foreach($product_info as $info)
                        @if($info->meta_key=='regular_price') @php $rprice=$info->meta_value @endphp @endif
                        @if($info->meta_key=='sale_price') @php $sprice=$info->meta_value @endphp @endif
                        @if($info->meta_key=='attached_file') @php $img=$info->meta_value @endphp @endif
                        @endforeach
                            <div class="col-6 col-md-3 mt-2 ml-0 pl-0">
                                <a style=" text-decoration: none;" href="{{url('product/'.$item->ID.'/'.urlencode($item->post_title))}}">
                                <div class="card">
                                    <img src="{{asset('backend/products/'.$img)}}"  class="img-fluid1 rounded" style="height: 260px;" alt="...">
                                    <div class="card-body text-center">
                                        <p style="color:#000000" class="card-text font-weight-bold">{{$item->post_title}}</p>
                                       				<p class="card-text">@if($rprice) <del style="color:red">৳{{$rprice}}</del>@endif <span style="color:#000000"> ৳{{$sprice}}</span></p>
                                    </div>
                                </div>
                                </a>
                            </div>  
                        @endforeach
                    @else
                    <h1 class="text-center"><span style="color:red">No Product Found</span></h1>
                    @endif
				</div>
			</div>
		</div>
@endsection 