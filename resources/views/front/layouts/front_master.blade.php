<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Demo</title>
	<link rel="stylesheet" href="{{asset('assets/front/css/bootstrap.min.css')}}" >
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	<link rel="stylesheet" href="{{asset('assets/front/css/main.css')}}">
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
	<!-- jQuery and JS bundle w/ Popper.js -->
	<script src="{{asset('assets/front/js/jquery.min.js')}}" ></script>
	<script src="{{asset('assets/front/js/bootstrap.min.js')}}" ></script>
</body>
</html>