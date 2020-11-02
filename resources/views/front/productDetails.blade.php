@extends('front.layouts.front_master')
@section('content')
<div class="container">
    <div class="d-flex flex-column mt-5 ">
        <div class="d-flex flex-column "> 
            <div class="empyt text-center border-bottom border-dark pt-3 pb-3">Product Name </div>
            <div class="d-flex flex-row mt-2">
                <div class="proImag">
                    <img id="featured" src="http://127.0.0.1:8000/backend/products/1601885379.jpg" class="img-fluid rounded" alt="Responsive image" height="auto">
                </div>
                <div class="d-flex flex-column pl-2">
                    <div class="pname">Tunic 5-2</div>
                    <div class="attri">Color: Blue </div>
                    <div class="price">Price: <span class="text-danger">tk. 300.00</span></div>
                    <div class="qty">
                        <form class="">
                            <div class="d-flex flex-row">
                                <div>Quantity: </div>
                                <div class="ml-2">
                                    <input type="number" class="form-control" id="" value="1">							
                                </div>
                            </div>
                            <div class="mt-3">
                                <button type="submit" class="btn btn-primary mb-2 btn-large w-50">Buy</button> 
                                <a href="#"><i class="far fa-heart ml-2 h4"></i></a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="d-flex flex-row mt-2">
            	<div class="col-3 ml-0 pl-0">            		
            	<img src="http://127.0.0.1:8000/backend/products/1601884277.jpg" class="rounded" height="150px"  width="100%" >
            	</div>
            	<div class="col-3">            		
            	<img src="http://127.0.0.1:8000/backend/products/1601884277.jpg" class="rounded" height="150px" width="100%" >
            	</div>
            	<div class="col-3">            		
            	<img src="http://127.0.0.1:8000/backend/products/1601884277.jpg" class="rounded" height="150px" width="100%" >
            	</div>
            	<div class="col-3">            		
            	<img src="http://127.0.0.1:8000/backend/products/1601884277.jpg" class="rounded" height="150px" width="100%" >
            	</div>
            	
            </div>
        </div>
        <div class="infoDiv  mt-5">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="#home" class="nav-link active" data-toggle="tab">Description</a>
                </li>
                <li class="nav-item">
                    <a href="#profile" class="nav-link" data-toggle="tab">Related</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade show active p-3" id="home">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum
                    Delivery Guarantee (Delivery Time and Delivery charge # Dhaka Metro 1-3 working days, charge 60tk # Dhaka suburb area 2-5 working days, charge 100tk # Bangladesh wide 2-5 working days, 120tk.) 
                </div>
                <div class="tab-pane fade" id="profile">
                    <div class="d-flex flex-wrap p-1 pt-2">
                        <div class="col-3 col-md-3">
                            <div class="card">
                                <img src="http://127.0.0.1:8000/backend/products/1601884277.jpg" class="img-fluid rounded">
                                <div class="card-body text-center">
                                    <p class="card-text font-weight-bold">Lorem ipsum dolor sit amet</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection 