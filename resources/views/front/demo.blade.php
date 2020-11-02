<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Demo</title>
	<link rel="stylesheet" href="{{asset('assets/front/css/bootstrap.min.css')}}" >
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

	<style>
		.card{
			border-radius: 4px;
			background: #fff;
			box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
			transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);			
			cursor: pointer;
		}

		.card:hover{
			transform: scale(1.03);
			box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
		}

	</style>
</head>
<body>
	<div class="container-fluid">
		<!-- header part start -->
		<div class="d-flex flex-column">
			<div class="d-flex flex-row justify-content-between sticky-top">
				<div>
<img src="http://127.0.0.1:8000/assets/common/images/logo.png" class="img-fluid" alt="logo" style="height: 46px;width: 70px">
				</div>
				<div class="d-flex flex-row">
					<div class="d-flex align-items-center">
						<form class="form-inline" method="POST" action="http://127.0.0.1:8000/search" role="search">
                  <input type="hidden" name="_token" value="Mm7HctMeLKOQ6jX3EDSVUJ2vwg2cDHtsnmkZNzN4">            
                        <input type="text" name="q" class="form-control" placeholder="Search">
                  <!-- <button type="submit" class="btn btn-success">Search</button> -->
                </form>
            </div>
					<div class="d-flex align-items-center ml-3"> <i class="fas fa-sign-in-alt"></i> </div>
					<div class="d-flex align-items-center ml-3"> <i class="fa fa-shopping-cart"></i> </div>
					<div class="d-flex align-items-center ml-3"> <i class="fa fa-heart"></i> </div>
				</div>
			</div>
			<div>
				<div class="" style="height: 2px;background: black"></div>
			</div>
			<div class="d-flex flex-row justify-content-between ml-5 mr-5">
				<div class="d-flex">
					<div> <a href="#" class="text-decoration-none text-dark"> Women</a></div>
					<div class="ml-2"> <a href="#" class="text-decoration-none text-dark"> Men</a></div>
				</div>
				<div class="d-flex">					
					<div> <a href="#" class="text-decoration-none text-dark"> FAQ</a></div>
					<div class="ml-2"> <a href="#" class="text-decoration-none text-dark"> About Us</a></div>
				</div>
			</div>
		</div>
		<!-- header part end -->

		<!-- body part start -->	
		<div class="container">
			<div class="d-flex flex-column">
				<div class="banner">
					<img src="http://127.0.0.1:8000/backend/banner/1601192209.png" class="img-responsive img-fluid" alt="Responsive image" width="1267">
				</div>
				<div class="d-flex flex-wrap mt-3">
					<div class="col-6 col-md-3 mt-2 ml-0 pl-0">
						<div class="card" >
							<img src="http://127.0.0.1:8000/backend/products/1602497289.jpg" class="img-fluid" alt="...">
							<div class="card-body text-center">
								<p class="card-text font-weight-bold">Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
								<p class="card-text"><del>500</del> 300</p>
							</div>
						</div>
					</div>
					<div class="col-6 col-md-3 mt-2">
						<div class="card" >
							<img src="http://127.0.0.1:8000/backend/products/1602497289.jpg" class="img-fluid" alt="...">
							<div class="card-body text-center">
								<p class="card-text">name </p>
								<p class="card-text"><del>500</del> 300</p>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
		<!-- body part end -->

		<!-- footer part start -->
		<div class="d-flex flex-row flex-wrap justify-content-center fixed-bottom mb-3 bg-light">
			<div> <a href="#" class="btn btn-default" >Privacy Policy</a> </div>
			<div> <a href="#" class="btn btn-default" >Terms & Conditions</a> </div>
			<div> <a href="#" class="btn btn-default" >Return Policy</a> </div>
			<div class="d-flex align-items-center"> <a href="#" class="btn btn-default" >Follow us</a> <i class="fab fa-facebook-f"></i> </div>
			<div> <a href="#" class="btn btn-default" >Return Policy</a> </div>
			<div> <a href="#" class="btn btn-default" >Payment Option</a> </div>
			<div> <a href="#" class="btn btn-default">Cash</a> </div>
			<div> <a href="#" class="btn btn-default">Bkash</a> </div>
			<div> <a href="#" class="btn btn-default">Visa</a> </div>
			<div> <a href="#" class="btn btn-default bg-transparent ">Master</a> </div>

		</div>
		<!-- footer part end -->

	</div>

	<!-- jQuery and JS bundle w/ Popper.js -->
	<script src="{{asset('assets/front/js/jquery.min.js')}}" ></script>
	<script src="{{asset('assets/front/js/bootstrap.min.js')}}" ></script>

</body>
</html>