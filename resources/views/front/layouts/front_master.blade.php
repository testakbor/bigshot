<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <!-- css start here -->
    @include('front.includes.css')
     <!-- css end here -->
</head>
<body>
	<div class="container-fluid">

		<!-- header part start -->
	      @include('front.includes.header')
		<!-- header part end -->

		<!-- body part start -->	
          @yield('content')
        <!-- body part end -->
        
		<!-- footer part start -->
	    @include('front.includes.footer')
		<!-- footer part end -->
    </div>
    
		<!-- js start here -->
        @include('front.includes.js')
	   <!--  js end here  -->
		
	   
<!-- Modal for mobile device -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
            <div class="d-flex flex-row">
                                    <form method="get" action="{{url('/search/item')}}">
                                    <div class=" has-search ">
                                        <span class="fa fa-search form-control-feedback"></span>
                                        <input type="text" name="search" class="form-control homeSearchInput" style="width: 75%;float: left" placeholder="What do you want to find?">
                                        <button class="btn btn-primary homeSearchButton" type="submit">
                                            Search
                                        </button>
                                    </div>
                                   </form>
                                </div>
      </div>
    </div>
  </div>
</div>






</body>
</html>