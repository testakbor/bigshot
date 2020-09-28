@extends('front.layouts.master')
@section('content')
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12 ">
      <div class="container-fluid mt-2">
        <div class="container">
          @if(session('success'))
          <div class="alert alert-success" role="alert" id="alert">
            {{ session('success') }}
          </div>
          @endif
          <div class="row">
            <div class="col-md-4 order">
              <!--our content goes here-->

              <div class="profile-sidebar position-fixed">
                <!-- SIDEBAR USERPIC -->
                <div class="profile-userpic">
                  @if(isset($profile_image->meta_value))
                  <img src="{{asset('assets/front/user/'.$profile_image->meta_value)}}" class="img-responsive" alt="">
                  @else
                  <img src="{{asset('assets/front/images/zhou_256x256.jpg')}}" class="img-responsive" alt="">
                  @endif
                </div>
                <!-- END SIDEBAR USERPIC -->
                <!-- SIDEBAR USER TITLE -->
                <div class="profile-usertitle">
                  <div class="profile-usertitle-name">
                    {{ Auth::user()->name }} <br>
                    Email : {{ Auth::user()->email }}
                  </div>
                  @php
                  $uid=Auth::user()->id;
                  @endphp
                  <a href="{{route('profile.edit',$uid)}}"> <i class="fa fa-pencil" aria-hidden="true"></i> Edit </a>
                  <!--   <div class="profile-usertitle-job">
                              Developer
                            </div> -->
                  <hr>
                </div>
                <!-- END SIDEBAR USER TITLE -->
                <!-- SIDEBAR BUTTONS -->
                <div class="d-flex flex-row"></div>
                <!-- END SIDEBAR BUTTONS -->
                <!-- SIDEBAR MENU -->
                <!-- END MENU -->
              </div>


            </div>
            <div class="col-md-7" style="border: 2px solid rgb(212, 227, 235);background: #fff;height: 600px;">
              @if (session('status'))
              <div class="alert alert-success" role="alert" id="alert">
                {{ session('status') }}
              </div>
              @endif
              <!-- Title -->
              <div class="title">
                WishList
              </div>
              <!-- Product #1 -->
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
                    <input type="hidden" class="input-text qty text" step="1" min="1" max="" name="quantity" value="1" title="Qty" size="4" inputmode="numeric">
                    <input type="hidden" name="name" value="{{$name}}">

                    <button type="submit" class="my-btn flex-btn ml-2" style="width: 115px;height: 42px;font-weight: 100;font-size: 12px;">
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
        </form>
      </div>
    </div>
  </div>
</div>
</div>
</div>

@endsection