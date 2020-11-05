@extends('front.layouts.front_master')
@section('content')
<div class="container">
   <div class="d-flex">
      <div class="col-md-5">
         <h4>User Profile</h4>
              @if(isset($profile_image->meta_value))
                      <img src="{{asset('assets/front/user/'.$profile_image->meta_value)}}" class="img-fluid" alt="">
                      @else
                      <img src="{{asset('assets/front/images/zhou_256x256.jpg')}}" class="img-fluid" alt="">
              @endif
                  <ul>
                    <li style="list-style: none;">Name: {{auth()->user()->name}}</li>
                    <li style="list-style: none;">Email: {{auth()->user()->email}}</li>
                    <li style="list-style: none;"> <a href="{{route('profile.edit',auth()->user()->id)}}"><i class="fa fa-pencil" aria-hidden="true"></i> Edit </a></li>
                    <li style="list-style: none;"><a href="{{route('password.edit',auth()->user()->id)}}" class="text-danger"> <i class="fa fa-pencil" aria-hidden="true"></i> Password Change </a></li>
          
                  </ul>
         </div>

       <div class="col-md-7">
         <h4 class="text-center">Wishlist</h4>

         @php $name=''; $image='no-image.png'; $price=''; @endphp
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
            <div class="col-md-4">
						 <a style=" text-decoration: none;" href="{{url('product/'.$item->product_id.'/'.urlencode($name))}}">
						<div class="card">
							<img src="{{asset('backend/products/'.$image)}}"  class="img-fluid"  alt="...">
							<div class="card-body text-center">
								<p style="color:#000000" class="card-text font-weight-bold">{{$name}}</p>
								<p class="card-text"> <span style="color:#000000"> ৳ {{ $price}}</span></p>
              </div>
              <a href="{{route('wishlist_delete',base64_encode($item->product_id))}}">
                  <div class="btn btn-danger">
                      <i class="fa fa-trash"></i>
                  </div>
              
              </a>


						</div>
						 </a>
          </div>  
          

             @endforeach
              {{$wishProduct->links()}}

       </div>

   </div>
</div>
@endsection