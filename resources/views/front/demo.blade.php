@extends('front.layouts.front_master')
@section('content')
		<div class="container">
			<div class="d-flex flex-column">
			   @include('front.includes.banner')
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
@endsection 