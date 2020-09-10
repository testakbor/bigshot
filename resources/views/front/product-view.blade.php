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
      if($meta['meta_key']=='_sale_price'):
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
      <form action="{{route('addCart')}}" method="POST" id="addCartForm">
        @csrf
      <div>
        
        <h1 class="title">Black & Decker</h1>
        <h2 class="subtitle subtitle-container">{{$product->post_title}}</h2>
        <input type="hidden" name="name" value="{{$product->post_title}}">
        <div>
          <span class="rating">
            <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1"/>
            <label for="rating-input-1-5" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-4" name="rating-input-1"/>
            <label for="rating-input-1-4" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-3" name="rating-input-1"/>
            <label for="rating-input-1-3" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-2" name="rating-input-1"/>
            <label for="rating-input-1-2" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-1" name="rating-input-1"/>
            <label for="rating-input-1-1" class="rating-star"></label>
          </span>
          <span>|</span>
          <span>
            <a href="#" class="reviews">
              232 customer reviews
            </a>
          </span>
        </div>
      </div>
      <span>
        <p> <span class="text-dark"> Price: </span>
          <span class="emphasize"> tk. {{$sprice}}</span>
          <input type="hidden" name="price" value="{{$sprice}}">
        </p>
        <div class="tm-size-color-single">
        <label for="quantity">Quantity:</label>
        <select name="quantity" class="select-dropdown">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        </div>
      </span>
      <div>
        <h2 class="title">Product Description</h2>
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
              {{$termsInfo->name}}</div>
        </div>
        @endforeach
        @endif
        <p>
          {!! $product->post_content !!}
        </p>
      </div>
    
      <div>               
          <input type="hidden" name="id" value="{{$product->ID}}">        
        <button type="submit" class="my-btn flex-btn">
			 <span class="btn-text text-dark" >Buy</span>
        </button>

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
