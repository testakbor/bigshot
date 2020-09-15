@extends('front.layouts.master')

@section('content')
    
        
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12">
      <div class="container-fluid">
        <div class="shopping-cart">
          <!-- Product #1 -->
                @if (session('status'))
                        <div class="alert alert-success" role="alert" id="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                  <!-- Title -->
                  <div class="title">
                    <h3>WishList</h3>
                  </div>
                  <!-- Product #1 -->
                  @php $name=''; $price=''; $image='no-image.png'; @endphp
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
                    @if($meta->meta_key=='attached_file')
                        @php                            
                        $image=$meta->meta_value;
                        @endphp
                    @endif
                  @endforeach
                  <div class="item">
                  <a href="{{route('wishlist_delete',base64_encode($item->product_id))}}">
                    <div class="buttons">
                      <span class="delete-btn"></span>
                    </div>
                    </a>
                    <div class="image">
                      <img width="90" height="80" src="{{asset('backend/products/'.$image)}}" alt="" />
                    </div>
                    <div class="description ml-3">
                      <span>{{$name}}</span>
                    </div>
                    <div class="total-price">Taka: {{ $price}}</div>
                    <div class="quantity">
                    <form action="{{route('addCart')}}" method="POST" id="addCartForm">
                    @csrf
                    <input type="hidden" name="id" value="{{$item->product_id}}">   
                    <input type="hidden" name="price" value="{{ $price}}">    
                    <input type="hidden"  class="input-text qty text" step="1" min="1" max="" name="quantity" value="1" title="Qty" size="4" inputmode="numeric">
                    <input type="hidden" name="name" value="{{$name}}">  
                   
                      <button type="submit" class="my-btn flex-btn ml-4" style="width: 115px;height: 42px;font-weight: 100;font-size: 12px;">
                        <span class="btn-text text-dark" style="width: 195px">Buy</span>
                      </button>
                  </form>
                    </div>
                  </div>
                  @endforeach
                  {{$wishProduct->links()}}
           
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@endsection
