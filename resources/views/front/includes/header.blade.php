  <!-- header part start -->
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

                .badge { 
                    position: relative;
                    top: -7px;
                    left: -8px;
                    border: 1px solid red;
                    border-radius: 20%;
                    background: red;
                    color: #ffffff;
                } 

                .main {
                    width: 50%;
                    margin: 50px auto;
                }

                /* Bootstrap 4 text input with search icon */

                .has-search .form-control {
                    padding-left: 2.375rem;
                }

                .has-search .form-control-feedback {
                    position: absolute;
                    z-index: 2;
                    display: block;
                    width: 2.375rem;
                    height: 2.375rem;
                    line-height: 2.375rem;
                    text-align: center;
                    pointer-events: none;
                    color: #aaa;
                }
                .homeSearchInput{
                    border-radius: 5px 0 0 5px;
                }
                .homeSearchButton
                {
                    border-radius: 0 5px 5px 0;
                }
                .homeSearchInput::placeholder{
                    font-size: 12px;
                }
                .sm-menus div{
                	height: 33px
                }
            </style>
            <div class="mt-0 mb-2 sticky-top bg-light">

                <nav class="navbar navbar-expand-lg navbar-light bg-light d-block d-sm-none">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a href="{{url('/')}}" class="ml-3"><img src="{{asset('assets/common/images/logo.png')}}" class="img-fluid" alt="logo" style="height: 30px;width: 80px"></a>  
                    
                     <a href="{{ route('login') }}" class="float-right mt-2"> <i style="color:#000000" class="fas fa-user"></i></a> 

					<a href="{{url('cart')}}" class="float-right mr-4 mt-2"> <i style="color:#000000" class="fas fa-shopping-bag"></i> 
					@if(\Cart::getTotalQuantity()==0)@else
						 <span class="badge badge-light">
						   {{ \Cart::getTotalQuantity()}}
						</span>
						@endif		     
                       	</a>                   
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="d-flex flex-column sm-menus">
							@php 
							$tags = DB::table('term_taxonomy')
							->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
							->where('term_taxonomy.taxonomy', 'product_tag')
							->select('term_taxonomy.*', 'terms.name', 'terms.status')
							->get();
							@endphp
							@foreach($tags as $tag)
                            <div class="mt-2"> 
								<a href="{{route('tag.product.show',$tag->term_id)}}" class="text-decoration-none text-dark"> {{$tag->name}}</a>
							</div>
                           @endforeach
                            <div class="d-flex align-items-center ">
                            	<a href="{{url('wishlist')}}" class="text-decoration-none text-dark"> <i style="color:#000000" class="fa fa-heart"></i> Wish list </a>
                            </div>
                             <div class="d-flex align-items-center ">
                             	<a href="{{url('cart')}}" class="text-decoration-none text-dark"> <i style="color:#000000" class="fas fa-shopping-bag"></i> 		  Shopping Bag      	
                             	</a> 
                                </div>
                            <div> 
                            	<a href="{{url('faq')}}" class="text-decoration-none text-dark"> FAQ ?</a>
                            </div>

                            <div>
                             <a href="{{url('customer-support')}}" class="text-decoration-none text-dark"> Customer Support</a>
                         </div>
                            <div class="d-flex align-items-center ">
                                <a href="{{url('privacy')}}" class="text-decoration-none text-dark"> Policies</a> 
                            </div>
                            <div class=""> 
<img src="http://127.0.0.1:8000/assets/front/payment/bkash.jpg" style="vertical-align: top;" width="35px" height="25px">
<i style="font-size: 30px;" class="fab fa-cc-visa"></i>
<i style="font-size: 30px;" class="fab fa-cc-mastercard"></i>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-------- display on large ----------->
                <div class="d-none d-sm-block sticky-top">
                    <div class="d-flex flex-column ">
                        <div class="d-flex justify-content-between ml-5 mr-5 mt-3">
                            <div>
                                <a href="{{url('/')}}"><img src="{{asset('assets/common/images/logo.png')}}" class="img-fluid" alt="logo" style="height: 37px;width: 120px"></a>
                            </div>
                            <div class="d-flex flex-row">
                                <div class="d-flex flex-row">
                                    <div class=" has-search ">
                                        <span class="fa fa-search form-control-feedback"></span>
                                        <input type="text" class="form-control homeSearchInput" style="width: 75%;float: left" placeholder="What do you want to find?">
                                        <button class="btn btn-primary homeSearchButton" type="button">
                                            Search
                                        </button>
                                    </div>
                                </div>
								<div class="d-flex align-items-center ml-3"><a href="{{url('cart')}}"> <i style="color:#000000" class="fas fa-shopping-bag"></i> 
								@if(\Cart::getTotalQuantity()==0)@else
						 <span class="badge badge-light">
						   {{ \Cart::getTotalQuantity()}}
						</span>
						@endif
									        	</a> 
                                </div>

                                <div class="d-flex align-items-center ml-3"><a href="{{url('wishlist')}}"> <i style="color:#000000" class="fa fa-heart"></i> @if(Auth::check()) @php $wish=DB::table('wishlist')->where('user_id',auth()->user()->id)->count() @endphp  <span class="badge badge-light"> {{$wish}}  </span> @else  @endif  </a></div>
                                <div class="d-flex align-items-center ml-3">
                                         @guest
						<a href="{{ route('login') }}"> <i style="color:#000000" class="fas fa-user"></i></a> 
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
							<a class="dropdown-item" href="{{url('profile')}}"><i class="demo fa fa-user ml-1" aria-hidden="true"></i>Profile</a>
							<a class="dropdown-item" href="{{url('wishlist')}}"><i style="color:#000000"  class="demo fa fa-heart ml-1" aria-hidden="true"></i> Wishlist</a>
                            <a class="dropdown-item" href="{{url('cart')}}"><i style="color:#000000" class="fas fa-shopping-bag ml-1"></i>  Cart</a>
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
                            </div>
                        </div>
                        <div class="d-flex flex-row justify-content-between ml-5 mr-5 mt-3 mb-2">
                            <div class="d-flex">
							    @php 
								$tags = DB::table('term_taxonomy')
								->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
								->where('term_taxonomy.taxonomy', 'product_tag')
								->select('term_taxonomy.*', 'terms.name', 'terms.status')
								->get();
								@endphp
									@foreach($tags as $tag)
								    <div class="mr-4"> <a href="{{route('tag.product.show',$tag->term_id)}}" class="text-decoration-none text-dark"> {{$tag->name}}</a></div>
								    @endforeach
                            </div>
                            <div class="d-flex col-md-2 justify-content-between">					
                                <div> <a href="{{url('faq')}}" class="text-decoration-none text-dark"> FAQ</a></div>
                                <div> <a href="{{url('customer-support')}}" class="text-decoration-none text-dark"> Customer Support</a></div>
                                <div class="ml-2"> <a href="{{url('about')}}" class="text-decoration-none text-dark"> About Us</a></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Actual search box -->
                <!--    <div class="form-group has-search col-md-3">
                       <span class="fa fa-search form-control-feedback"></span>
                       <input type="text" class="form-control homeSearchInput" style="width: 80%;float: left" placeholder="Search">
                       <button class="btn btn-primary homeSearchButton" type="button">
                           Search
                       </button>
                   </div> -->

                <div class="sticky-top">
                    <div class="" style="height: 2px;background: black"></div>
                </div>

            </div>

            <!-- header part end -->