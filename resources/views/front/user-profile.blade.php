@extends('front.layouts.front_master')
@section('content')
<div class="container">

   <div class="row">
          <div class="col-md-3 mb-4">
               <h5>User Profile</h5>
              <div class="card">
                  @if(isset($profile_image->meta_value))
                          <img width="100px" height="100px" src="{{asset('assets/front/user/'.$profile_image->meta_value)}}" class="img-fluid" alt="">
                          @else
                          <img width="100px" height="100px" src="{{asset('assets/front/images/zhou_256x256.jpg')}}" class="img-fluid" alt="">
                  @endif
                  <div class="card-body">
                      <ul>
                        <li style="list-style: none;">Name: {{auth()->user()->name}}</li>
                        <li style="list-style: none;">Email: {{auth()->user()->email}}</li>
                        <li style="list-style: none;"> <a style="text-decoration: none;" href="{{route('profile.edit',auth()->user()->id)}}"><i class="fa fa-pencil" aria-hidden="true"></i> Edit </a></li>
                        <li style="list-style: none;"><a style="text-decoration: none;" href="{{route('password.edit',auth()->user()->id)}}" class="text-danger"> <i class="fa fa-pencil" aria-hidden="true"></i> Password Change </a></li>
                      </ul>
                </div>
              </div>
          </div>
      <div class="col-md-9">
        <h5>Wishlist Item</h5>
          <div class="col-md-12 row">
           @php $qty=0; $name=''; $image='no-image.png'; $price=''; @endphp
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
                  <div class="card">
                     <img src="{{asset('backend/products/'.$image)}}"  class="img-fluid1 rounded" style="height: 160px;" alt="...">
                      <div class="card-body">
                          <ul>
                            <li style="list-style: none;">{{$name}}</li>
                            <li style="list-style: none;">৳ {{ $price}}</li>
                          </ul>
                    </div>
                  </div>
              </div>
              @endforeach
          </div>
      </div>
   </div>
</div>
@endsection