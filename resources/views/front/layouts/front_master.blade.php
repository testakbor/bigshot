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
</body>
</html>