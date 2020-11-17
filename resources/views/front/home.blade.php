<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Bigshot | Home </title>
        <!-- css start here -->
        <link rel="stylesheet" href="http://127.0.0.1:8000/assets/front/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <link rel="stylesheet" href="http://127.0.0.1:8000/assets/front/css/main.css">
        <!-- css end here -->
    </head>
    <body>
        <div class="container-fluid">

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
            <div class="mt-3 mb-2">

                <nav class="navbar navbar-expand-lg navbar-light bg-light d-block d-sm-none">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a href="http://127.0.0.1:8000" class="ml-3"><img src="http://127.0.0.1:8000/assets/common/images/logo.png" class="img-fluid" alt="logo" style="height: 30px;width: 80px"></a>  
                    
                     <a href="http://127.0.0.1:8000/login" class="float-right mt-2"> <i style="color:#000000" class="fas fa-user"></i></a> 

                    <a href="http://127.0.0.1:8000/cart" class="float-right mr-4 mt-2"> <i style="color:#000000" class="fas fa-shopping-bag"></i> 		     
                       	</a>                   
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="d-flex flex-column sm-menus">
                            <div class="mt-2"> 
                            	<a href="http://127.0.0.1:8000/tag/product/15" class="text-decoration-none text-dark"> Women</a></div>
                            <div class=""> 
                            	<a href="http://127.0.0.1:8000/tag/product/16" class="text-decoration-none text-dark"> Men</a></div>

                            <div> 
                            	<a href="http://127.0.0.1:8000/faq" class="text-decoration-none text-dark"> FAQ</a></div>
                            <div class="d-flex align-items-center ">
                            	<a href="http://127.0.0.1:8000/wishlist" class="text-decoration-none text-dark"> <i style="color:#000000" class="fa fa-heart"></i> Wish list </a>
                            </div>
                             <div class="d-flex align-items-center ">
                             	<a href="http://127.0.0.1:8000/cart" class="text-decoration-none text-dark"> <i style="color:#000000" class="fas fa-shopping-bag"></i> 		  Shopping Bag      	
                             	</a> 
                                </div>
                            <div> 
                            	<a href="http://127.0.0.1:8000/faq" class="text-decoration-none text-dark"> FAQ ?</a>
                            </div>

                            <div>
                             <a href="http://127.0.0.1:8000/faq" class="text-decoration-none text-dark"> Customer Support</a>
                         </div>
                            <div class="d-flex align-items-center ">
                                <a href="http://127.0.0.1:8000/login" class="text-decoration-none text-dark"> Policies</a> 
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
                <div class="d-none d-sm-block">
                    <div class="d-flex flex-column ">
                        <div class="d-flex justify-content-between ml-5 mr-5 mt-3">
                            <div>
                                <a href="http://127.0.0.1:8000"><img src="http://127.0.0.1:8000/assets/common/images/logo.png" class="img-fluid" alt="logo" style="height: 37px;width: 120px"></a>
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
                                <div class="d-flex align-items-center ml-3"><a href="http://127.0.0.1:8000/cart"> <i style="color:#000000" class="fas fa-shopping-bag"></i> 		        	</a> 
                                </div>

                                <div class="d-flex align-items-center ml-3"><a href="http://127.0.0.1:8000/wishlist"> <i style="color:#000000" class="fa fa-heart"></i>  </a></div>
                                <div class="d-flex align-items-center ml-3">
                                    <a href="http://127.0.0.1:8000/login"> <i style="color:#000000" class="fas fa-user"></i></a> 
                                </div>
                            </div>
                        </div>
                        <div class="d-flex flex-row justify-content-between ml-5 mr-5 mt-3 mb-2">
                            <div class="d-flex">
                                <div class=""> <a href="http://127.0.0.1:8000/tag/product/15" class="text-decoration-none text-dark"> Women</a></div>
                                <div class="ml-4"> <a href="http://127.0.0.1:8000/tag/product/16" class="text-decoration-none text-dark"> Men</a></div>
                            </div>
                            <div class="d-flex col-md-2 justify-content-between">					
                                <div> <a href="http://127.0.0.1:8000/faq" class="text-decoration-none text-dark"> FAQ</a></div>
                                <div> <a href="http://127.0.0.1:8000/faq" class="text-decoration-none text-dark"> Customer Support</a></div>
                                <div class="ml-2"> <a href="http://127.0.0.1:8000/about" class="text-decoration-none text-dark"> About Us</a></div>
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

            <!-- body part start -->	
            <div class="container mb-3">
                <div class="d-flex flex-column">
                    <div class="banner">
                        <img src="http://127.0.0.1:8000/backend/banner/1605498133.png" width="1267" class="img-responsive img-fluid" alt="Responsive image" width="1267">
                    </div>				<div class="d-flex flex-wrap mt-3">

                        <div class="col-6 col-md-3 mt-2 ml-0 pl-0">
                            <a style=" text-decoration: none;" href="http://127.0.0.1:8000/product/212/Long+Tunic">
                                <div class="card">
                                    <img src="http://127.0.0.1:8000/backend/products/1605007980.jpg"  class="img-fluid1 rounded" style="height: 260px;" alt="...">
                                    <div class="card-body text-center">
                                        <span style="color:#000000" class="card-text font-weight-bold">Long Tunic</span>
                                        <p class="card-text"> <del style="color:red">৳1000</del> <span style="color:#000000"> ৳800</span></p>
                                    </div>
                                </div>
                            </a>
                        </div>  

                        <div class="col-6 col-md-3 mt-2 ml-0 pl-0">
                            <a style=" text-decoration: none;" href="http://127.0.0.1:8000/product/202/Tunic+2-2">
                                <div class="card">
                                    <img src="http://127.0.0.1:8000/backend/products/1604397235.jpg"  class="img-fluid1 rounded" style="height: 260px;" alt="...">
                                    <div class="card-body text-center">
                                        <span style="color:#000000" class="card-text font-weight-bold">Tunic 2-2</span>
                                        <p class="card-text"> <del style="color:red">৳5000</del> <span style="color:#000000"> ৳4500</span></p>
                                    </div>
                                </div>
                            </a>
                        </div>  

                        <div class="col-6 col-md-3 mt-2 ml-0 pl-0">
                            <a style=" text-decoration: none;" href="http://127.0.0.1:8000/product/201/Bracelet+1">
                                <div class="card">
                                    <img src="http://127.0.0.1:8000/backend/products/1604397079.jpg"  class="img-fluid1 rounded" style="height: 260px;" alt="...">
                                    <div class="card-body text-center">
                                        <span style="color:#000000" class="card-text font-weight-bold">Bracelet 1</span>
                                        <p class="card-text"> <del style="color:red">৳20000</del> <span style="color:#000000"> ৳18000</span></p>
                                    </div>
                                </div>
                            </a>
                        </div>  

                        <div class="col-6 col-md-3 mt-2 ml-0 pl-0">
                            <a style=" text-decoration: none;" href="http://127.0.0.1:8000/product/200/Jeans+1">
                                <div class="card">
                                    <img src="http://127.0.0.1:8000/backend/products/1604396896.jpg"  class="img-fluid1 rounded" style="height: 260px;" alt="...">
                                    <div class="card-body text-center">
                                        <span style="color:#000000" class="card-text font-weight-bold">Jeans 1</span>
                                        <p class="card-text"> <del style="color:red">৳3210</del> <span style="color:#000000"> ৳2300</span></p>
                                    </div>
                                </div>
                            </a>
                        </div>  

                        <div class="col-6 col-md-3 mt-2 ml-0 pl-0">
                            <a style=" text-decoration: none;" href="http://127.0.0.1:8000/product/199/Crossbody+bag+1">
                                <div class="card">
                                    <img src="http://127.0.0.1:8000/backend/products/1604396738.jpg"  class="img-fluid1 rounded" style="height: 260px;" alt="...">
                                    <div class="card-body text-center">
                                        <span style="color:#000000" class="card-text font-weight-bold">Crossbody bag 1</span>
                                        <p class="card-text"> <del style="color:red">৳3400</del> <span style="color:#000000"> ৳2600</span></p>
                                    </div>
                                </div>
                            </a>
                        </div>  

                        <div class="col-6 col-md-3 mt-2 ml-0 pl-0">
                            <a style=" text-decoration: none;" href="http://127.0.0.1:8000/product/198/Belt+1">
                                <div class="card">
                                    <img src="http://127.0.0.1:8000/backend/products/1604396543.jpg"  class="img-fluid1 rounded" style="height: 260px;" alt="...">
                                    <div class="card-body text-center">
                                        <span style="color:#000000" class="card-text font-weight-bold">Belt 1</span>
                                        <p class="card-text"> <del style="color:red">৳5000</del> <span style="color:#000000"> ৳3000</span></p>
                                    </div>
                                </div>
                            </a>
                        </div>  

                    </div>
                </div>
            </div>
            <!-- body part end -->

            <!-- footer part start -->
            <div class="d-flex flex-row flex-wrap justify-content-center sticky-bottom mb-3 bg-light">
                <div> <a href="http://127.0.0.1:8000/privacy" class="btn btn-default" >Privacy Policy</a> </div>
                <div> <a href="http://127.0.0.1:8000/terms&amp;conditions" class="btn btn-default" >Terms & Conditions</a> </div>
                <div> <a href="http://127.0.0.1:8000/return-policy" class="btn btn-default" >Return Policy</a> </div>
                <div><a href="https://www.facebook.com/bigshotstyle/" class="btn btn-default"> Follow us <i class="fab fa-facebook-f"></i></a></div>
                <div> <a href="#" class="btn btn-default" >Payment Option</a> </div>
                <div> <a href="#" class="btn btn-default"><i style="font-size: 30px;" class="fa fa-money-bill-alt"></i></a></div>
                <div> <a href="#" class="btn btn-default"><img width="35px" height="25px" src="http://127.0.0.1:8000/assets/front/payment/bkash.jpg"></a> </div>
                <div> <a href="#" class="btn btn-default"><i style="font-size: 30px;" class="fab fa-cc-visa"></i></a> </div>
                <div> <a href="#" class="btn btn-default bg-transparent "><i style="font-size: 30px;" class="fab fa-cc-mastercard"></i></a> </div>
            </div>		<!-- footer part end -->
        </div>

        <!-- js start here -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
        <script src="http://127.0.0.1:8000/assets/front/js/bootstrap.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
        <!--  js end here  -->
    </body>
</html>