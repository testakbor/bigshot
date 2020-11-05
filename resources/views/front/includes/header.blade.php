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
					<div class="d-flex align-items-center ml-3"><a href="{{ route('login') }}"> <i class="fas fa-sign-in-alt"></i></a> </div>
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