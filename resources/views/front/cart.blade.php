@extends('front.layouts.front_master')
@section('content')
<style>
    li {
        list-style: none;
    }
    .nav-tabs {
        border-bottom: 0px solid #dee2e6; 
    }
    * {
        margin: 0;
        padding: 0;
    }

    .loader {
        display: none; 
        top: 50%;
        left: 50%;
        position: absolute;
        transform: translate(-50%, -50%);
    }

    .loading {
        border: 2px solid #ccc;
        width: 60px;
        height: 60px;
        border-radius: 50%;
        border-top-color: #1ecd97;
        border-left-color: #1ecd97;
        animation: spin 1s infinite ease-in;
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }
    .overlay {
        background-color:#EFEFEF;
        position: fixed;
        width: 100%;
        height: 100%;
        z-index: 1000;
        top: 0px;
        left: 0px;
        opacity: .5; /* in FireFox */ 
        filter: alpha(opacity=50); /* in IE */
    }

    @media (max-width: 767px) {

     .poductDiv{
         padding: 0px !important;     
     }
 }
 .nav a{
    font-size: 14px;    
    padding: 10px 0px;
    text-align: center;
}
</style>
@php $l_name='';
$address1='';
$address2='';
$phone='';
$country='';
$dist_rict='';
$city='';
$zip='';
$name='';
$email='';
@endphp @if(Auth::check()) @php $name=auth()->user()->name;
$email=auth()->user()->email;
@endphp @endif @foreach($user_info as $in) @if($in->meta_key=='address_one') @php $address1=$in->meta_value;
@endphp @endif @if($in->meta_key=='last_name') @php $l_name=$in->meta_value;
@endphp @endif @if($in->meta_key=='address_two') @php $address2=$in->meta_value;
@endphp @endif @if($in->meta_key=='phone') @php $phone=$in->meta_value;
@endphp @endif @if($in->meta_key=='country') @php $country=$in->meta_value;
@endphp @endif @if($in->meta_key=='district') @php $dist_rict=$in->meta_value;
@endphp @endif @if($in->meta_key=='city') @php $city=$in->meta_value;
@endphp @endif @if($in->meta_key=='zip') @php $zip=$in->meta_value;
@endphp @endif @endforeach
<div id="" class="container p-0">
    @if(Auth::check())
     @php
      $cart_user_count=DB::table('user_cart')
      ->where('user_id',auth()->user()->id)
      ->sum('quantity'); 
     @endphp 
     @else 
     @php $cart_user_count=Cart::getTotalquantity(); @endphp
    @endif
    @if($cart_user_count>0)
    <div class="d-flex flex-row mt-2 flex-wrap  mb-3">
        <div class="col-md-8 col-12 p-0 mb-3 poductDiv">
            @include('admin.includes.messages')
             @if(session('status'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong> {{ session('status') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                @endif

              @if(session('status_error_update'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong> {{ session('status_error_update') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                @endif

            <nav id="myTab" class="nav nav-tabs nav-justified">
                <a class="nav-item nav-link btn btn-primary active mr-2 "
                data-toggle="tab" href="#home"> Ship to</a>
                <a class="nav-item nav-link btn btn-success mr-2 " data-toggle="tab" href="#menu2">Review Order</a>
                <a class="nav-item nav-link btn btn-primary " data-toggle="tab" href="#menu1">Payment</a>

            </nav>
            <form id="check_out_form" role="form" action="{{route('checkout')}}" method="POST">
                @csrf
                <div class="tab-content">
                    <div id="home" class="tab-pane active">
                        <h5 style="padding: 5px 5px;"><b>SHIP TO</b></h5>
                        <span id="message" style="color: red;"></span>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName">First name<span
                                    class="requiredField">*</span></label>
                                    @if($name=='') @php @endphp @php $name='Guest'; @endphp @endif
                                    <input type="text" class="form-control" id="firstName" value="{{$name}}"
                                    name="first_name" placeholder="First Name">
                                    <div class="invalid-feedback">
                                        Valid first name is required.
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Last name<span
                                        class="requiredField">*</span></label>
                                        @if($l_name=='') @php @endphp @php $l_name='Guest'; @endphp @endif
                                        <input type="text" class="form-control" id="lastName"
                                        value="{{$l_name}}" name="last_name" placeholder="Last Name">
                                        <div class="invalid-feedback">
                                            Valid last name is required.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="address">Address<span class="requiredField">*</span></label>
                                        @if($address1=='') @php @endphp @php $address1='Uttara,Dhaka'; @endphp
                                        @endif
                                        <input type="text" class="form-control" id="address"
                                        value="{{$address1}}" name="address_one" placeholder="Address">
                                        <div class="invalid-feedback">
                                            Please enter your shipping address.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        @if($phone=='') @php @endphp @php $phone='0000000001'; @endphp @endif
                                        <label for="phone">Mobile Number<span
                                            class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="{{$phone}}" name="phone"
                                            id="phone" placeholder="Mobile Number">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            @if($email=='') @php @endphp @php $email='guest@email.com'; @endphp
                                            @endif
                                            <label for="phone">Email<span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="{{$email}}" name="email"
                                            id="email" placeholder="Email">
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label for="country">Country<span class="requiredField">*</span></label>
                                            <input type="text" class="form-control" value="Bangladesh"
                                            name="country" placeholder="Country" readonly>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="state">District <span class="requiredField">*</span></label>
                                            <select class="form-control" name="state" id="state">
                                                <option value="">Select District</option>
                                                @foreach($district as $dist)
                                                <option value="{{$dist->term_id}}">{{ $dist->district }}</option>
                                                @endforeach
                                            </select>
                                            <div class="invalid-feedback">
                                                Zip code required.
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="city">City/Thana<span class="requiredField">*</span></label>
                                            <select class="form-control" id="city" name="city">
                                                <option value="">Select District First</option>
                                            </select>
                                            <div class="invalid-feedback">
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-3">
                                            <label for="zip">Postcode</label>
                                            <input type="text" class="form-control" value="" name="zip" id="zip"
                                            placeholder="Postcode">
                                            <div class="invalid-feedback">
                                                Zip code required.
                                            </div>
                                        </div>
                                    </div>

                                    <button type="button" class="btn btn-success float-right" id="first_btn">Next <i class="fas fa-arrow-right"></i></button>

                                </div>


                                <div id="menu1" class="tab-pane fade">
                                    <h5 style="background: #e7e7e7;padding:10px 4px;" class="mt-2"><b>CHOSE PAYMENT OPTION</b>
                                    </h5>
                                    <span id="payment_msg" style="color: red;"></span>
                                    <div class="form-group">


                                        <div id="payment_option">
                                            <input id="FullPayment" type="radio" name="paymentMethod" value="FullPayment">
                                            <label for="FullPayment">Full Payment </label> <span id="cart_get_payment"></span> tk<br>

                                            <input id="DeliveryChargeOnly" type="radio" name="paymentMethod" value="DeliveryChargeOnly">
                                            <label for="DeliveryChargeOnly">Delivery Charge Only</label><br>

                                            <input id="CashOnDelivery" type="radio" name="paymentMethod" name="payment_mode"
                                            value="CashOnDelivery">
                                            <label for="CashOnDelivery">Cash On Delivery</label>
                                        </div>

                                    </div>
                                    <div id="payment_div" style="display: none;">
                                        <h5 style="background: #e7e7e7;padding:10px 4px;"><b>PAYMENT METHOD</b></h5>
                                        <div class="form-group">
                                            <select id="payment_mode" class="form-control">
                                                <option value="bkash">Bkash</option>
                                                <option value="visa">Visa</option>
                                                <option value="master">Master</option>
                                            </select>
                                        </div>
                                    </div>
                                  
                              
                                    <button type="submit" id="order_submit" class="btn btn-primary btn-block btn-lg">Place
                                    Order</button>
                                </form>
                            </div>



                            <div id="menu2" class="tab-pane fade">
                                <div class=" btn-lg btn-block">
                                    Items In Cart
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <td >#</td>
                                                <td >Image</td>                                               
                                                <td >Price</td>
                                                <td >Qty</td>
                                                <td >Remove</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @php $order=0; @endphp
                                            @foreach ($info as $item)
                                            @php
                                              $order++;
                                            @endphp
                                            <tr>
                                                <th scope="row">{{$order}}</th>
                                                <td>
                                                    @php 
                                                    $image=DB::table('posts')
                                                     ->where('ID',$item->id) 
                                                     ->where('meta_key','attached_file') 
                                                     ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                                                     ->select('meta_value')
                                                     ->first();
                                                      $d_image=DB::table('postmeta')
                                                     ->where('post_id',$item->id) 
                                                     ->where('meta_key','attached_file') 
                                                     ->select('meta_value')
                                                     ->first();
                                                    @endphp
                                                    @if(isset($image)) 
                                                     @php $img=$image->meta_value; @endphp
                                                    @endif
                                                    @if(isset($d_image)) 
                                                     @php $img=$d_image->meta_value; @endphp
                                                    @endif
                                                    <img width="100px" height="100px"
                                                    src="{{asset('backend/products/'.$img)}}"
                                                    class="img-thumbnail" alt="Responsive image" />
                                                    <br>
                                                    {{$item->name}} 

                                                    @php $att_name=DB::table('postmeta')
                                                    ->where('post_id',$item->id)
                                                    ->where('meta_key','attribute')
                                                    ->select('meta_value')
                                                    ->first();
                                                     @endphp

                                                     @if(isset($att_name)) 
                                                       @php $j_decode=json_decode($att_name->meta_value);  @endphp
                                                        @foreach($j_decode as $j_value) 
                                                        {{$j_value->taxonomy}} : {{$j_value->term}} 
                                                        @endforeach 
                                                     @endif
                                                    
                                                </td>
                                                <td>
                                                    @if(Auth::check())
                                                    {{$total=$item->actual_price}}
                                                    @else 
                                                      {{$total=$item->price}}
                                                    @endif
                                                </td>
                                                <td>
                                                    <form id="cart_up" class="up" method="POST"
                                                    action="{{route('cart.update')}}" name="Updatequantity">
                                                    @csrf
                                                    <input type="hidden" name="product_id[]" value="{{$item->id}}">
                                                    <div class="quantity buttons_added" style="padding: 0;">
                                                        <!--  <input type="button" value="-" class="minus"> -->
                                                        <input type="number" id="cart_qty_data"
                                                        class="input-text quantity_text form-control" step="1"
                                                        min="1" max="" name="quantity[]"
                                                        value="{{$item->quantity}}" title="quantity" size="4"
                                                        inputmode="numeric">
                                                        <!-- <input type="button" value="+" class="plus"> -->
                                                        <!-- <input type="submit" value="" class="plus"> -->
                                                    </div>
                                            </td>
                                            <td>
                                                <a onclick="return confirm('are you sure??')"
                                                href="{{url('/remove/'.$item->id)}}">
                                                <div class="buttons text-danger" style="margin-top:1px !important">
                                                    <i class="fa fa-trash"></i>
                                                </div>
                                            </a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <button style="width: 100%;" type="submit" class="btn btn-success">Update Cart</button>
                                </form>
                            <ul class="list-group mb-3">
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <p>Sub Total:</p> <div class="float-right">@if(Auth::check()) @php $user_qtyy=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('quantity'); @endphp @else @php $user_qtyy=Cart::getTotalquantity(); @endphp @endif {{$user_qtyy}} pcs @if(Auth::check()) @php $user_pricee=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); @endphp @else @php $user_pricee=Cart::getTotal(); @endphp @endif {{$user_pricee}}  tk</div>
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <p>Delivery Charge:</p> <div class="float-right" id="charge"></div> <input id="deli" type="hidden" value="" class="form-control">
                                </li>

                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <p>Order Total:</p> <div class="float-right">@if(Auth::check()) @php $user_pricee=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); @endphp @else @php $user_pricee=Cart::getTotal(); @endphp @endif {{$user_pricee}} tk</div> 
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <p>Apply Promo code:</p> <div class="float-right"> <input autocomplete="off" id="promo_code" type="number" step="any" name="promo_code" class="form-control" placeholder="Enter code"> </div>
                                </li>
                                <div id="coupon_data_div"></div>
                                <li class="list-group-item d-flex justify-content-between lh-condensed">
                                    <p>Order Total After Discount:</p>  <div class="float-right"> <span id="cart_get_total"></span> tk </div> 
                                </li>
                            </ul>
                               
                        </div>
                        <button type="button" class="btn btn-primary" id="first_btn_back"><i class="fas fa-arrow-left"></i> Back</button>
                        <button type="button" class="btn btn-success float-right" id="second_btn">Next <i class="fas fa-arrow-right"></i> </button>
                    </div>
                    <div class="loader">
                        <div class="loading">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex flex-column col-12 poductDiv">
                
                <div class="text-center bg-info btn text-white font-weight-bold"> Item list </div>
            </br></br>
            <div class="">
                @php $order=0; @endphp
                @foreach ($info as $item)
                @php
                $order++;
                @endphp
                @php 
                $image=DB::table('posts')
                ->where('ID',$item->id) 
                ->where('meta_key','attached_file') 
                ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                ->select('meta_value')
                ->first();
                $d_image=DB::table('postmeta')
                ->where('post_id',$item->id) 
                ->where('meta_key','attached_file') 
                ->select('meta_value')
                ->first();
                @endphp
               @if(isset($image)) 
                @php $imgg=$image->meta_value; @endphp
              @endif
              @if(isset($d_image)) 
                   @php $imgg=$d_image->meta_value;
                   @endphp
              @endif
                <div class="col-md-12 p-0 col-12">
                    <div class="d-flex justify-content-between item-align-center mt-2">
                        <div class="d-flex flex-column text-center">
                            <div>
                                <img src="{{asset('backend/products/'.$imgg)}}"
                                class="img-thumbnail" alt="image" style="width: 100px;height: 100px" />
                            </div>
                            <div> {{$item->name}}</div>  
                        </div>
                        <div>@if(Auth::check()) {{$total=$item->actual_price}} tk @else {{$total=$item->price}} @endif</div>
                        <div> x </div>
                        <div>{{$item->quantity}} </div>
                        <div> = </div>
                        <div>@if(Auth::check()) {{$total=$item->actual_price*$item->quantity}} tk  @else {{$total=$item->price*$item->quantity}} @endif</div>

                    </div>
                </div>
                     
                                @endforeach
                            </div>
                                <div class="bg-success btn d-flex justify-content-between pl-2 pr-2 text-white font-weight-bold">
                                    <div>Price: </div>
                                    <div><span id="cart_get_payment_sidebar"></span> tk</div>
                            </div>
                        </div>
                    </div>
                    @else
                    <h4 class="text-center">Opp's You have no product in your shopping cart</h4>
                    <div class="text-center"><a href="{{url('/')}}"><span style="color:orange;fornt-size:14px;">SHOP NOW</span></a>
                    </div>
                    </div>
                    @endif
                    </div>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"
                    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
 </script>
<script>
  $(document).ready(function() {
      document.getElementById('cart_get_total').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?> 
      document.getElementById('cart_get_payment').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?> 
      document.getElementById('cart_get_payment_sidebar').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?> 
  });
  function spinner() {
        document.getElementsByClassName("loader")[0].style.display = "block";
  }
//cart update form submit
$("#first_btn").click(function(){
    var dist=$("#state").val();
    var ci=$("#city").val();
    var zi=$("#zip").val();
     if(dist=='' || ci=='' || zi==''){
        var msg="Please Select District,Thana & Postcode"; 
        document.getElementById("message").innerHTML=msg;
        $('#myTab a[href="#home"]').tab('show');
        return false;
     }else{
       $('#myTab a[href="#menu2"]').tab('show');
     } 
});

$(".two").click(function(){
    var dist=$("#state").val();
    var ci=$("#city").val();
    var zi=$("#zip").val();
     if(dist=='' || ci=='' || zi==''){
        var msg="Please Select District,Thana & Postcode"; 
        document.getElementById("message").innerHTML=msg;
        $('#myTab a[href="#home"]').tab('show');
        return false;
     }else{
       $('#myTab a[href="#menu2"]').tab('show');
     } 
});

$("#first_btn_back").click(function(){
  $('#myTab a[href="#home"]').tab('show');
});
$("#second_btn").click(function(){
  $('#myTab a[href="#menu1"]').tab('show');
});
//check order submit to some validation
$("#order_submit").click(function(e){
  e.preventDefault();
     var dist=$("#state").val();
    var ci=$("#city").val();
    var zi=$("#zip").val();
    var payment_one=$("#FullPayment").val();
    var payment_two=$("#DeliveryChargeOnly").val();
    var payment_three=$("#CashOnDelivery").val();
     if(dist=='' || ci=='' || zi==''){
         var msg="Please Select District,Thana & Postcode"; 
        document.getElementById("message").innerHTML=msg;
        $('#myTab a[href="#home"]').tab('show');
        return false;
     }
     
     if( $('#FullPayment').is(':checked') ||  $('#DeliveryChargeOnly').is(':checked') || $('#CashOnDelivery').is(':checked') ) {
         $('.loader').show(); 
        $('#check_out_form').delay(200).submit();
         var div= document.createElement("div");
    div.className += "overlay";
    document.body.appendChild(div);
     }else{
          var msg="Please Select Payment Option"; 
          document.getElementById("payment_msg").innerHTML=msg;
     }
});
//radio button click wise div show hide 
$('input:radio').on('click', function(e) {
    var value =e.currentTarget.value;
    if (value == 'FullPayment') {
        $("#payment_div").show();
    } else if (value == 'DeliveryChargeOnly') {

    } else {
        $("#payment_div").hide();
    }
});

//state dropdown change ajax call 
$("#state").change(function() {
    var district_id = $("#state").val();
     var main_amount=document.getElementById('cart_get_total').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?>  
     var main_amount_payment=document.getElementById('cart_get_payment').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?>  
     var main_amount_payment_sidebar=document.getElementById('cart_get_payment_sidebar').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?>  
    $.ajax({
        url: "{{url('/district/city/')}}" + '/' + district_id,
        type: "GET",
        success: function(response) {
            var items = ""; 
            items += "<option value=''>Select City</option>";
            $.each(response.data, function(i, item) {
                items += "<option value='" + item.term_id + "'>" + (item
                        .city_name) +
                    "</option>";
            });
            $("#city").html(items);

             $.each(response.charge, function(i, item) {
                var result=parseInt(item.description) || 0;
                document.getElementById("charge").innerHTML=result+"tk";
                document.getElementById("deli").value=result;
                document.getElementById('cart_get_total').innerHTML=main_amount+result;
                document.getElementById('cart_get_payment').innerHTML=main_amount_payment+result;
                document.getElementById('cart_get_payment_sidebar').innerHTML=main_amount_payment_sidebar+result;
            });
           
           },
           error: function(response) {
            console.log(response);
           },
        });
   });
//city dropdown change ajax call  
$("#city").change(function() {
    var city_id = $("#city").val();
    $.ajax({
        url: "{{url('/district/city/postcode/')}}" + '/' + city_id,
        type: "GET",
        success: function(response) {
            var items = "";
            $.each(response, function(i, item) {
                items += item.zip;
            });
            document.getElementById('zip').value = items;
        },
        error: function(response) {
            console.log(response);
        },
    });
});
//promo code input keyup change ajax call  
$("#promo_code").keyup(function() {
    var codes = $("#promo_code").val();
    var d=$("#deli").val();
    var ac_delivery_charge=parseInt(d) || 0;
     var main_amount=document.getElementById('cart_get_total').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?>  
     var main_amount_payment=document.getElementById('cart_get_payment').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?> 
     var main_amount_payment_sidebar=document.getElementById('cart_get_payment_sidebar').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?>  
    if(codes==''){
            var discount_totall=main_amount+ac_delivery_charge;
            var discount_totall_payment=main_amount_payment+ac_delivery_charge;
            var discount_totall_sidebar=main_amount_payment_sidebar+ac_delivery_charge;
            document.getElementById('cart_get_total').innerHTML=discount_totall;
            document.getElementById('cart_get_payment').innerHTML=discount_totall_payment;
            document.getElementById('cart_get_payment_sidebar').innerHTML=discount_totall_sidebar;
            return false;
    }
    $.ajax({
        url: "{{url('/apply/promocode/ajax/')}}" + '/' + codes,
        type: "GET",
        success: function(response) {
              var items = ''; 
              $.each(response, function(i, item) {
                items+='<input type="hidden" id="coupon_amountss" name="coupon_taka" type="text" value="'+item.coupon_amount+'">'; 
            });
         $("#coupon_data_div").html(items);
        //  document.getElementById('cart_get_total').innerHTML 
            var c_amount=$("#coupon_amountss").val();
            var result=parseInt(c_amount) || 0;
            var main_delivery_charge=parseInt(d) || 0;
            var discount_total=(main_amount+main_delivery_charge)-result;
            var discount_total_payment=(main_amount_payment+main_delivery_charge)-result;
            var discount_total_sidebar=(main_amount_payment_sidebar+main_delivery_charge)-result;
            document.getElementById('cart_get_total').innerHTML=discount_total;
            document.getElementById('cart_get_payment').innerHTML=discount_total_payment;
            document.getElementById('cart_get_payment_sidebar').innerHTML=discount_total_sidebar;
        },
        error: function(response) {
            console.log(response);
        },
    });
});
$("#promo_code").change(function() {
    
      var codes = $("#promo_code").val();
    var d=$("#deli").val();
    var ac_delivery_charge=parseInt(d) || 0;
 
     var main_amount=document.getElementById('cart_get_total').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?> 
     var main_amount_payment=document.getElementById('cart_get_payment').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?>  
     var main_amount_payment_sidebar=document.getElementById('cart_get_payment_sidebar').innerHTML=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price'); }else{echo Cart::getTotal(); } ?>  

    if(codes==''){
            var discount_totall=main_amount+ac_delivery_charge;
            var discount_totall_payment=main_amount_payment+ac_delivery_charge;
            var discount_totall_sidebar=main_amount_payment_sidebar+ac_delivery_charge;
            document.getElementById('cart_get_total').innerHTML=discount_totall;
            document.getElementById('cart_get_payment').innerHTML=discount_totall_payment;
            document.getElementById('cart_get_payment_sidebar').innerHTML=discount_totall_sidebar;
            return false;
    }
    
    $.ajax({
        url: "{{url('/apply/promocode/ajax/')}}" + '/' + codes,
        type: "GET",
        success: function(response) {
              var items = ''; 
              $.each(response, function(i, item) {
                var coupon_amount=item.coupon_amount;
                if(item.coupon_type==2){          
                 var main_delivery_charge=parseInt(d) || 0;           
                coupon_amount=((main_amount+main_delivery_charge)*(item.coupon_amount))/100;
                }
                items+='<input type="hidden" id="coupon_amountss" name="coupon_taka" type="text" value="'+coupon_amount+'">'; 
            });
         $("#coupon_data_div").html(items);
        //  document.getElementById('cart_get_total').innerHTML 
            var c_amount=$("#coupon_amountss").val();
            var result=parseInt(c_amount) || 0;
            var main_delivery_charge=parseInt(d) || 0;
            var discount_total=(main_amount+main_delivery_charge)-result;
            var discount_total_payment=(main_amount_payment+main_delivery_charge)-result;
            var discount_total_sidebar=(main_amount_payment_sidebar+main_delivery_charge)-result;
            document.getElementById('cart_get_total').innerHTML=discount_total;
            document.getElementById('cart_get_payment').innerHTML=discount_total_payment;
            document.getElementById('cart_get_payment_sidebar').innerHTML=discount_total_sidebar;
        },
        error: function(response) {
            console.log(response);
        },
    });
});
//page refresh but tab will be active 
</script>
    @endsection