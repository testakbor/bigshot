<style>
.dropbtn {
  color: #000000;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #ddd;}
.dropdown:hover .dropdown-content {display: block;}
</style>
	<div class="d-flex flex-column sticky-top bg-light mb-4">
			<div class="d-flex flex-row justify-content-between ">
				<div>
             <a href="{{url('/')}}"><img src="{{asset('assets/common/images/logo.png')}}" class="img-fluid" alt="logo" style="height: 46px;width: 70px"></a>
				</div>
				<div class="d-flex flex-row">
					<div class="d-flex align-items-center">
						<form class="form-inline" method="POST" action="http://127.0.0.1:8000/search" role="search">
                  <input type="hidden" name="_token" value="Mm7HctMeLKOQ6jX3EDSVUJ2vwg2cDHtsnmkZNzN4">            
                        <input type="text" name="q" class="form-control" placeholder="Search">
                  <!-- <button type="submit" class="btn btn-success">Search</button> -->
                </form>
			</div>
			
					<div class="d-flex align-items-center ml-3">
                        @guest
						<a href="{{ route('login') }}"> <i class="fas fa-sign-in-alt"></i></a> 
						 @else 
						   @if(isset($profile_image->meta_value))
							<img  src="{{asset('assets/front/user/'.$profile_image->meta_value)}}" style="border-radius: 50%;height: 33px;">
						    </br>
							@else
							<img src="{{asset('assets/front/images/icons/fetch.jpg')}}" style="border-radius: 50%;height: 33px;">
						    </br>
							@endif
					
						    <div class="dropdown">
							<a class="dropbtn">Profile</a>
							<div class="dropdown-content">
							<a class="dropdown-item" href="{{url('profile')}}"><i class="demo fa fa-user ml-1" aria-hidden="true"></i>View Profile</a>
							<a class="dropdown-item" href="{{url('wishlist')}}"><i class="demo fa fa-heart ml-1" aria-hidden="true"></i> Wishlist</a>
                            <a class="dropdown-item" href="{{url('cart')}}"><i class="demo fa fa-shopping-cart" aria-hidden="true"></i>  Cart</a>
							<a class="dropdown-item" href="{{url('order-list')}}"><i class="demo fa fa-sticky-note ml-1" aria-hidden="true"></i> Order</a>
							<a class="dropdown-item" href="{{url('customer-support')}}"><i class="demo fa fa-users" aria-hidden="true"></i> Support</a>
							<a class="dropdown-item" href="{{url('faq')}}"><i class="fa fa-question-circle"></i> FAQ</a>
							   <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">{{ __('Logout') }}</a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                  @csrf
                </form>
							</div>
						</div>
                     


                        @endguest
					</div>

					<div class="d-flex align-items-center ml-3"><a href="{{url('cart')}}"> <i class="fa fa-shopping-cart"></i> @if(\Cart::getTotalQuantity()==0)@else
						<span class="badge-view">
						{{ \Cart::getTotalQuantity()}}
						</span>
						@endif
            </a> </div>
					<div class="d-flex align-items-center ml-3"><a href="{{url('wishlist')}}"> <i class="fa fa-heart"></i></a></div>
				</div>
			</div>
			<div class="sticky-top">
				<div class="" style="height: 2px;background: black"></div>
			</div>
			<div class="d-flex flex-row justify-content-between ml-5 mr-5">
				<div class="d-flex">
					@php 
					$tags = DB::table('term_taxonomy')
                    ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                    ->where('term_taxonomy.taxonomy', 'product_tag')
                    ->select('term_taxonomy.*', 'terms.name', 'terms.status')
                    ->get();
					@endphp
					@foreach($tags as $tag)
					        <div class="ml-2"> <a href="{{route('tag.product.show',$tag->term_id)}}" class="text-decoration-none text-dark"> {{$tag->name}}</a></div>
				    @endforeach
				</div>
				<div class="d-flex">					
					<div> <a href="{{url('faq')}}" class="text-decoration-none text-dark"> FAQ</a></div>
					<div class="ml-2"> <a href="{{url('about')}}" class="text-decoration-none text-dark"> About Us</a></div>
				</div>
			</div>
		</div>