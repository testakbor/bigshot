<body>
        <div class="col-md-12 header-menu">
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
            <h1><a href="{{route('home')}}" class="logo">
              <img src="{{asset('assets/common/images/logo.png')}}" alt="" style="height: 50px;width: 70px">
            </a></h1>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                  <div class="form-group has-search">
                  <span class="fa fa-search form-control-feedback"></span>
                  <form class="searchform cf">
                    
                    <input type="text" placeholder="What do you want to find?">
                    <button type="submit">Search</button>
                  </form>
                </div>
                </li>
                <li class="nav-item active">
                    <div class="dropdown">
                     
                        <img src="{{asset('assets/front/images/icons/fetch.jpg')}}" style="border-radius: 50%;height: 33px;">
                      
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#"><i class="demo fa fa-gift" aria-hidden="true"></i>Earn</a>
                        <a class="dropdown-item" href="wishlist"><i class="demo fa fa-heart" aria-hidden="true"></i>Wishlist</a>
                        <a class="dropdown-item" href="/cart"><i class="demo fa fa-shopping-cart" aria-hidden="true"></i>Shopping Cart</a>
                        <a class="dropdown-item" href="/order-history"><i class="demo fa fa-sticky-note" aria-hidden="true"></i>Order History</a>
                        <a class="dropdown-item" href="/daily-login-bonus"><i class="demo fa fa-calendar" aria-hidden="true"></i>Daily Login Bonus</a>
                        <a class="dropdown-item" href="cash"><i class="demo fa fa-credit-card" aria-hidden="true"></i>Wish Cash</a>
                        <a class="dropdown-item" href="/rewards"><i class="demo fa fa-trophy" aria-hidden="true"></i>Rewards</a>
                        <a class="dropdown-item" href="#"><i class="demo fa fa-users" aria-hidden="true"></i>Customer Support</a>
                        <a class="dropdown-item" href="#">FAQ</a>
                        <a class="dropdown-item" href="#">Settings</a>
                        <a class="dropdown-item" href="#">Logout</a>
                      </div>
                    </div>
                </li>
                <li class="nav-item active">
                  <div class="icons">
                    <i class="fa fa-bell" aria-hidden="true"></i>
                  </div>
                </li>
                <li class="nav-item active">
                  <div class="icons">
                    <a href="/cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                  </div>
                </li>
                <li class="nav-item active">
                  <div class="icons">
                    <i class="fa fa-heart" aria-hidden="true"></i>
                  </div>
                </li>

              </ul>
            </div>
          </div>
        </nav>
    </div>