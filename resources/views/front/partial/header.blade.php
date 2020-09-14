<body>
        <div class="col-md-12 header-menu">
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <h1><a href="{{url('/')}}" class="logo">
              <img src="{{asset('assets/common/images/logo.png')}}" alt="" style="height: 50px;width: 70px">
            </a></h1>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                  <div class="form-group has-search">
                  <span class="fa fa-search form-control-feedback"></span>
                  <form class="searchform cf" method="POST" action="{{url('/search')}}" role="search">
                    @csrf 
                    <input type="text" name="q" placeholder="What do you want to find?">
                    <button type="submit">Search</button>
                  </form>
                </div>
                </li>
                <li class="nav-item active">
                    <div class="dropdown">
                     @guest
                            <li class="nav-item active">
                                   <div class="icons">
                                <a href="{{ route('login') }}">
                                  <i class="fas fa-sign-in-alt" aria-hidden="true"></i>
                                </a>
                                  </div>
                            </li>
                            <!-- @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">
                                      <img src="{{asset('assets/front/images/icons/register-icon.png')}}" width="40" height="45">
                                    </a>
                                </li>
                            @endif -->
                            @else
                        <img src="{{asset('assets/front/images/icons/fetch.jpg')}}" style="border-radius: 50%;height: 33px;">
                      
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="{{url('profile')}}">
                          <div class="hov ">
                          <div class="ml-5">
                            <img src="{{asset('assets/front/images/icons/fetch.jpg')}}" style="border-radius: 50%;height: 50px;">
                          </div>
                          <p class="ml-4">   
                              {{ Auth::user()->name }}  <br><span class="ml-2" style="color: black;">View Profile</span>
                            </p>
                          
                        </div>
                        </a>
                        <!-- <a class="dropdown-item" href="#"><i class="demo fa fa-gift" aria-hidden="true"></i>Earn</a> -->
                        <a class="dropdown-item" href="{{url('wishlist')}}"><i class="demo fa fa-heart" aria-hidden="true"></i>Wishlist</a>
                        <a class="dropdown-item" href="{{url('cart')}}"><i class="demo fa fa-shopping-cart" aria-hidden="true"></i>Shopping Cart</a>
                        <a class="dropdown-item" href="{{url('order-history')}}"><i class="demo fa fa-sticky-note" aria-hidden="true"></i>Order History</a>
                        <a class="dropdown-item" href="{{url('order-list')}}"><i class="demo fa fa-sticky-note" aria-hidden="true"></i>Order List</a>
                        <!-- <a class="dropdown-item" href="/daily-login-bonus"><i class="demo fa fa-calendar" aria-hidden="true"></i>Daily Login Bonus</a> -->
                        <!-- <a class="dropdown-item" href="cash"><i class="demo fa fa-credit-card" aria-hidden="true"></i>Wish Cash</a> -->
                        <!-- <a class="dropdown-item" href="/rewards"><i class="demo fa fa-trophy" aria-hidden="true"></i>Rewards</a> -->
                        <a class="dropdown-item" href="{{url('customer-support')}}"><i class="demo fa fa-users" aria-hidden="true"></i>Customer Support</a>
                        <a class="dropdown-item" href="{{url('faq')}}">FAQ</a>
                        <!-- <a class="dropdown-item" href="{{url('settings')}}">Settings</a> -->
                        <div class="dropdown-item" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item"  href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">{{ __('Logout') }}</a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                  </div>
                       
                      </div>
                    </div>

                </li>
                @endguest
               <!--  <li class="nav-item active">
                  <div class="icons">
                    <i class="fa fa-bell" aria-hidden="true"></i>
                  </div>
                </li> -->
                <li class="nav-item active">
                  <div class="icons">
                    <a href="{{url('/cart')}}"><i class="fa fa-shopping-cart" aria-hidden="true">
                     @if(\Cart::getTotalQuantity()==0)
                       @else 
                      <span class="badge-view">
                        {{ \Cart::getTotalQuantity()}}
                      </span>
                      @endif
                    
                    </i></a>
                  </div>
                </li>
                <li class="nav-item active">
                  <div class="icons">
                    <a href="{{('wishlist')}}">
                      <i class="fa fa-heart" aria-hidden="true"></i>
                    </a>
                  </div>
                </li>

              </ul>
            </div>
          </div>
        </nav>
    </div>