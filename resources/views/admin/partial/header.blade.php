
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
  
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('admin.home')}}" class="brand-link text-center">
      <img src="{{asset('assets/common/images/logo.png')}}" alt="Bigshot Logo" class=" img-circle elevation-3"
           style="opacity: .8;height: 60px;width: 100px;">
      {{-- <span class="brand-text font-weight-light">BigShot</span> --}}
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        
        <div class="image">
          <img src="{{asset('assets/admin/default/admin-icon.png')}}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Admin</a>
        </div>
        
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

               <li class="nav-item">
                <a href="{{route('admin.home')}}"  class="nav-link {{isset($page) && $page=='home'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Dashboard                    
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('category.index')}}" class="nav-link {{isset($page) && $page=='category'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Category                    
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('tag.index')}}" class="nav-link {{isset($page) && $page=='tag'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Tag                    
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('brand.index')}}" class="nav-link {{isset($page) && $page=='brand'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Brand                
                  </p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('attribute.index')}}" class="nav-link {{isset($page) && $page=='attribute'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Attributes                
                  </p>
                </a>
              </li>
                        
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-circle"></i>
              <p>
               Product
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{route('product.index')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Products</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="{{route('product.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>New Product</p>
                </a>
              </li>
            </ul>
          </li>
           <li class="nav-item">
                <a href="{{route('quickReport')}}" class="nav-link {{isset($page) && $page=='quickReport'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Quick Report
                  </p>
                </a>
              </li>
           <li class="nav-item">
                <a href="{{route('order.pendingOrder')}}" class="nav-link {{isset($page) && $page=='pendingOrder'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Pending Order
                  </p>
                </a>
              </li>
           <li class="nav-item">
              <a href="{{route('order.index')}}" class="nav-link {{isset($page) && $page=='order'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                    Order History
                  </p>
                </a>
              </li>
           <li class="nav-item">
              <a href="{{route('order.sendParcel')}}" class="nav-link {{isset($page) && $page=='sendParcel'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                   Send Parcel
                  </p>
                </a>
              </li>
           <li class="nav-item">
                <a href="{{route('order.reject')}}" class="nav-link {{isset($page) && $page=='reject'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                  Reject
                  </p>
                </a>
              </li>
           <li class="nav-item">
                <a href="{{route('order.stock')}}" class="nav-link {{isset($page) && $page=='stock'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                  Stock
                  </p>
                </a>
              </li>
           <li class="nav-item">
                <a href="{{route('order.stock.lower')}}" class="nav-link {{isset($page) && $page=='lowerstock'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                  Lower Stock
                  </p>
                </a>
              </li>
           <li class="nav-item">
                <a href="{{route('order.stock.old')}}" class="nav-link {{isset($page) && $page=='oldstock'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                  Old Stock List
                  </p>
                </a>
              </li>
           <li class="nav-item">
                <a href="{{route('customer.index')}}" class="nav-link {{isset($page) && $page=='customer'?'active':''}}">
                  <i class="nav-icon fas fa-th"></i>
                  <p>
                 Customer List
                  </p>
                </a>
              </li>
              <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-circle"></i>
              <p>
               Report
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{route('man.stock')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Man Stock</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a href="{{route('women.stock')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Women Stock</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="{{route('sales.report')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sales Report</p>
                </a>
              </li>

              <li class="nav-item">
                <a href="{{route('delivery.report')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Delivery Report</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('reject.item')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Reject Item</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('product.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Best selling items</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('product.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Cancellation Items</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('product.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sold out stock</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('product.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Best Customer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('product.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gross Profit</p>
                </a>
              </li>

            </ul>
          </li>

              
          <li class="nav-item">
            <a href="{{route('logout')}}"   onclick="event.preventDefault();
            document.getElementById('logout-form').submit();" class="nav-link">
              <i class="fas fa-check nav-icon"></i>
              <p>Logout</p>
            </a>
          </li>
          
        </ul>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
          @csrf
      </form>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
