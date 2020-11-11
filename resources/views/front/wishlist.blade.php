@extends('front.layouts.front_master')
@section('title') Bigshot | Home @endsection 
@section('content')
 <!-- Page Content  -->
<div class="container">
         <h3 class="text-center">WishList</h3>
              @if (session('status'))
                  <div class="alert alert-success" role="alert" id="alert">
                            {{ session('status') }}
                  </div>
               @endif
			<div class="row">
          @php $name=''; $price=''; $image='no-image.png'; $qty=0; @endphp
                 @foreach($wishProduct as $item)
                 @php
                  $product=DB::table('posts')
                  ->where('post_type','product')
                  ->where('ID',$item->product_id)
                  ->get();
                  $product_meta=DB::table('postmeta')
                  ->where('post_id',$item->product_id)
                  ->get();
                 @endphp
                  @foreach($product as $products) 
                    @php $name=$products->post_title @endphp 
                  @endforeach
                  @foreach($product_meta as $meta)
                     @if($meta->meta_key=='sale_price')
                        @php 
                           $price=$meta->meta_value;
                        @endphp
                    @endif 
                    @if($meta->meta_key=='qty')
                        @php 
                           $qty=$meta->meta_value;
                        @endphp
                    @endif 
                    @if($meta->meta_key=='attached_file')
                        @php                            
                        $image=$meta->meta_value;
                        @endphp
                    @endif
                  @endforeach 
                <div class="col-md-3">
                    <div class="card">
                        <img src="{{asset('backend/products/'.$image)}}"  class="img-fluid1 rounded" style="height: 160px;" alt="...">
                        <div class="card-body">
                          <h5 class="card-title">{{$name}}</h5>
                          <p class="card-text">৳ {{ $price}}</p>
                     <form action="{{route('addCart')}}" method="POST" id="addCartForm" class="float-left">
                      @csrf
                      <input type="hidden" name="id" value="{{$item->product_id}}">  
                      <input type="hidden" name="main_qty" value="{{$qty}}"> 
                      <input type="hidden" name="price" value="{{ $price}}">    
                      <input type="hidden"  class="input-text qty text" name="quantity" value="1" title="Qty" size="4">
                      <input type="hidden" name="name" value="{{$name}}">  
                        <button type="submit" class="btn btn-success btn-sm">Add to Cart</button>
                      </form>
                      <a class="float-right" onclick="return confirm('are you sure??')"
                               href="{{route('wishlist_delete',base64_encode($item->product_id))}}">
                               <div class="buttons" style="margin-top:1px !important">
                               <span class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></span>
                           </div>
                       </a>


                        </div>
                      </div>
                </div>
                @endforeach
               {{$wishProduct->links()}}
	  	</div>
</div>
@endsection
