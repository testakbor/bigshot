@extends('front.layouts.front_master')
@section('content')
<style>
    @media (max-width: 767px) {
        .poductDiv div:nth-child(even){
            padding-right: 0px !important;
            padding-left: 5px !important;
        }
        .poductDiv > div:nth-child(odd){
            padding-right: 5px !important;     
        }
    }

</style>
<div class="container p-0">
    <div class="d-flex flex-row flex-wrap mt-4">
        <div class="col-md-3 col-12 mb-4 ">
            <h5>User Profile</h5>
            <div class="">
                @if(isset($profile_image->meta_value))
                <img width="100px" height="100px" src="{{asset('assets/front/user/'.$profile_image->meta_value)}}" class="img-fluid" alt="">
                @else
                <img width="100px" height="100px" src="{{asset('assets/front/images/zhou_256x256.jpg')}}" class="img-fluid" alt="">
                @endif
                <div class="d-flex flex-column">
                    <div>  Name: {{auth()->user()->name}}</div>
                    <div> Email: {{auth()->user()->email}}</div>
                    <div> <a style="text-decoration: none;" href="{{route('profile.edit',auth()->user()->id)}}"><i class="fa fa-pencil" aria-hidden="true"></i> Edit </a></div>
                    <div>  <a style="text-decoration: none;" href="{{route('password.edit',auth()->user()->id)}}" class="text-danger"> <i class="fa fa-pencil" aria-hidden="true"></i> Password Change </a></div>

                </div>
            </div>
        </div>
        <div class="col-md-9 col-12 p-0 mb-3 ">
            <div class="text-center h5">Wishlist Item</div>
            <div class="d-flex poductDiv">
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
                <div class="col-md-4 col-6 ml-0 pl-0">
                    <div class="card">
                        <img src="{{asset('backend/products/'.$image)}}"  class="img-fluid rounded" >
                        <div class="text-center">
                            <div>{{$name}}</div>
                            <div>৳ {{ $price}}</div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>

        </div>
            
    </div>
</div>
@endsection