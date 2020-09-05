@extends('front.layouts.master')

@section('content')


<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
      <div class="col-md-10 ">
       <div class="container-fluid">

          <section style="margin-left: 120px" class="mt-5">

              <h1>Latest Products</h1>

              <ul class="wrapper cf mt-3">
                  
          <li class="product fl-l">
          <a href="/product-page">
            <div class="container-prod">
              <div class="image" style="background-image:url({{asset('assets/front/images/3.jpg')}});"></div>
              <div class="container-information">
                  <div class="title">Indian hoodie</div>
              </div>

              <div class="buttons cf">
                <span style="margin-left: 3px;font-size: 12px;">
                    <span class="add ml-2">20,000+ bought this</span>            
                </span>

              </div>
            </div>
          </a>

          </li>
          <li class="product fl-l">
                    <a href="/product-page">
                      <div class="container-prod">
                        <div class="image" style="background-image:url({{asset('assets/front/images/1.jpg')}});"></div>
                        <div class="container-information">
                          <div class="title">
                              Splatter hoodie
                              <a href="#" class="more close"><i class="fa fa-times"></i></a>                
                          </div>
                      </div>

                      <div class="buttons cf">
                        <span style="margin-left: 3px;font-size: 12px;">
                          <span class="add ml-2">20,000+ bought this</span>

                      </span>

                  </div>
              </div>
                    </a>

          </li>
        
    <li class="product fl-l">
      <a href="/product-page">
        <div class="container-prod">
          <div class="image" style="background-image:url({{asset('assets/front/images/5.jpg')}});"></div>
          <div class="container-information">
              <div class="title">Face hoodie</div>
              <div class="description">Siebdruck print<br>100% cotton<br>Color available: black on gray<br>Size available: XL, XXL</div>
          </div>
          
          <div class="buttons cf">
              <span style="margin-left: 3px;font-size: 12px;">
                <span class="add ml-2">20,000+ bought this</span>            
            </span>

        </div>
    </div>
      </a>
    </li>
      <li class="product fl-l">
    <a href="/product-page">
        <div class="container-prod">
        <div class="image" style="background-image:url({{asset('assets/front/images/6.jpg')}});"></div>
        <div class="container-information">
          <div class="title">
              Splatter hoodie
              <a href="javascript:void(0)" class="more close"><i class="fa fa-times"></i></a>                
          </div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: white on gray<br>Size available: L, XL</div>
      </div>

      <div class="buttons cf">
          <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>

    </div>
</div>
    </a>
  </li>
</ul>
<ul class="wrapper cf mt-3">
  <li class="product fl-l">
          <a href="/product-page">
            <div class="container-prod">
              <div class="image" style="background-image:url({{asset('assets/front/images/4.jpg')}});"></div>
              <div class="container-information">
                  <div class="title">Face hoodie</div>
              </div>

              <div class="buttons cf">
                <span style="margin-left: 3px;font-size: 12px;">
                    <span class="add ml-2">20,000+ bought this</span>            
                </span>

              </div>
            </div>
          </a>
        </li>

<li class="product fl-l">
  <a href="/product-page">
    <div class="container-prod">
      <div class="image" style="background-image:url({{asset('assets/front/images/7.jpg')}});"></div>
      <div class="container-information">
          <div class="title">Indian hoodie</div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: white on black<br>Size available: L, XL, XXL</div>
      </div>
      <div class="buttons cf">
         <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>
    </div>
</div>

  </a>
</li>
<li class="product fl-l">
  <a href="/product-page">
    <div class="container-prod">
      <div class="image" style="background-image:url({{asset('assets/front/images/8.jpg')}});"></div>
      <div class="container-information">
          <div class="title">Face hoodie</div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: black on gray<br>Size available: XL, XXL</div>
      </div>

      <div class="buttons cf">
          <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>
    </div>
</div>
  </a>
</li>
<li class="product fl-l">
  <a href="/product-page">
    <div class="container-prod">
      <div class="image" style="background-image:url({{asset('assets/front/images/12.jpg')}});"></div>
      <div class="container-information">
          <div class="title">Face hoodie

          </div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: black on gray<br>Size available: XL, XXL</div>
      </div>            
      <div class="buttons cf">
          <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>
    </div>
</div>
  </a>
</li>
</ul>
</section>

</div>
</div>
<div class="col-md-2 col-sm-12" style="background-color: #fff;position: fixed;
right: 10px;top:96px;">
<div class="img-box mt-3">
    <img src="{{asset('assets/front/images/offer.png')}}" height="200" width="210">
</div>          
<p class="text-justify mt-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

<form>
  <div class="form-group">
      <div class="input-group"> <input type="text" class="form-control coupon" name="" value="xyz3gd"> <span class="input-group-append"> <button class="btn btn-light btn-apply coupon">Copy</button> </span> </div>
  </div>
</form>

</div>
</div>
</div>
</div>

@endsection
