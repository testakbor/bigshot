@extends('front.layouts.master')

@section('content')

@php
$rprice=0;
$sprice=0;
$image='no-image.png';
   foreach ($product->productMeta as $meta):
      if($meta['meta_key']=='_regular_price'):
        $rprice=$meta['meta_value'];        
endif;
      if($meta['meta_key']=='sale_price'):
      $sprice=$meta['meta_value'];      
endif;
      if($meta['meta_key']=='default_attribute'):
        $metavalue=json_decode($meta['meta_value']);
endif;  

  if($meta['meta_key']=='attached_file'):
    $image=$meta['meta_value'];
  endif;
  
    endforeach;

    $images=DB::table('posts')
    ->where('post_parent',$product->ID)
    ->where('post_type','attachment')
    ->get();
@endphp


<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
        <div class="col-md-12 ">
      		<div class="container-fluid">

<div class="codepen-container">
  <div class="content-container">
    <div class="left-container">
      <div class="triangle-topleft">
        <div class="back-arrow" id="buy-toaster"></div>
      </div>
      <div class="product-image--container">
        <img class="product-image--featured" id="featured" src="{{asset('assets/backend/products/'.$image)}}" alt="toaster"/>
        <ul class="product-image--list">
@foreach($images as $item) 
          <li class="item-selected"><img src="{{asset('assets/backend/products/'.$item->guid)}}" class="product-image--item"/></li>          
@endforeach          
        </ul>
      </div>
    </div>
    <div class="right-container">
       @if (session('status'))
                        <div class="alert alert-success" role="alert" id="alert">
                            {{ session('status') }}
                        </div>
                    @endif
      <form action="{{route('addCart')}}" method="POST" id="addCartForm">
        @csrf
      <div>
        
        <h1 class="title" style="padding: 0 !important;">Black & Decker</h1>
        <h2 class="subtitle subtitle-container">{{$product->post_title}}</h2>
        <input type="hidden" name="name" value="{{$product->post_title}}">
        
      </div>
      <span>
        <p> <span class="text-dark"> Price: </span>
          <span class="emphasize"> tk. {{$sprice}}</span>
          <input type="hidden" name="price" value="{{$sprice}}">
        </p>
        <div class="tm-size-color-single">
        <label for="quantity">Quantity:</label>
        
        <div class="quantity buttons_added">
          <input type="button" value="-" class="minus">
          <input type="number" id="" class="input-text qty text" step="1" min="1" max="" name="quantity" value="1" title="Qty" size="4" inputmode="numeric">
          <input type="button" value="+" class="plus">
        </div>
        </div>
      </span>
      <div>
        <h2 class="title" style="padding: 0 !important;">Product Description</h2>
        @if(isset($metavalue))
        @foreach($metavalue as $metaInfo)
        <div class="tm-size-color-single">
            <label>
              @php 
              $result=explode('_',$metaInfo->taxonomy);
              @endphp
              {{ucfirst(end($result))}}
            </label>
            <div>
              @php 
            $termsInfo=DB::table('terms')->where('term_id',$metaInfo->term)->first();
              @endphp          
              @if(isset($termsInfo->name)) {{$termsInfo->name}} @endif</div>
        </div>
        @endforeach
        @endif
        <p>
          {!! $product->post_content !!}
        </p>
      </div>
    
      <div>               
          <input type="hidden" name="id" value="{{$product->ID}}">        
        <table>
          <tr>
            <th>
              <button type="submit" class="my-btn flex-btn">
               <span class="btn-text text-dark" style="width: 195px">Buy</span>
          
                </button>
            </th>
            <th>
              <span class="text-dark" >
                <a href="{{url('/wishlist/product/'.$product->ID)}}">
                  <i class="far fa-heart ml-2 h4"></i>
                </a>
              </span>
               
            </th>
          </tr>
        </table>

      </div>
    </div>
  </form>
  </div>
</div>
<script type="text/javascript">
	$('.product-image--list li').hover(function() {
  var url = $(this).children('img').attr('src');
  $('.item-selected').removeClass('item-selected');
  $(this).addClass('item-selected');
  $('#featured').attr('src', url);
});

$('#buy-toaster').click(function() {
  alert("BUY ME PLS!");
});
</script>


			</div>
		</div>

</div>
</div>
</div>

@endsection
