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
<div id="content" class="p-4 p-md-5">
    @if(Cart::getTotalquantity()>0)
    <div class="row">
        <div class="col-md-12">
            <div class="container-fluid mt-2">
                <div class="container mb-3">
                    <div class="row">
                        <div class="col-md-8">
                            @include('admin.includes.messages')
                            <nav id="myTab" class="nav nav-tabs nav-justified">
                                <a class="nav-item nav-link btn btn-primary active one mr-2 mb-3"
                                    data-toggle="tab" href="#home"> SHIP TO</a>
                                <a class="nav-item nav-link btn btn-success two mr-2 mb-3" data-toggle="tab" href="#menu2">REVIEW ORDER</a>
                                <a class="nav-item nav-link btn btn-primary three mb-3" data-toggle="tab" href="#menu1">PAYMENT</a>
                                <a class="nav-item nav-link disabled" data-toggle="tab" href="#menu3"></a>
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
                                        <h5 style="background: #e7e7e7;padding:10px 4px;"><b>CHOSE PAYMENT OPTION</b>
                                        </h5>
                                         <span id="payment_msg" style="color: red;"></span>
                                        <div class="form-group">


                                          <div id="payment_option">
                                             <input id="FullPayment" type="radio" name="paymentMethod" value="FullPayment">
                                                <label for="male">Full Payment </label> <div id="cart_get_payment"></div><br>

                                                <input id="DeliveryChargeOnly" type="radio" name="paymentMethod" value="DeliveryChargeOnly">
                                                <label for="female">Delivery Charge Only</label><br>

                                                <input id="CashOnDelivery" type="radio" name="paymentMethod" name="payment_mode"
                                                    value="CashOnDelivery">
                                                <label for="other">Cash On Delivery</label>
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
                                            <th scope="col">#</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Item</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Option</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $order=0; @endphp
                                        @foreach ($info as $item)
                                        @php
                                        $order++;
                                        $image='no-image.png';
                                        $images=DB::table('postmeta')
                                        ->where('post_id',$item->id)
                                        ->where('meta_key','attachment')
                                        ->first();
                                        if($images>0):
                                        $image= $images->meta_value;
                                        endif;
                                        @endphp
                                        <tr>
                                            <th scope="row">{{$order}}</th>
                                            <td>
                                                @php
                                                $image=DB::table('postmeta')->where(['post_id'=>$item->id,'meta_key'=>'attached_file'])->select('meta_value')->first();
                                                @endphp
                                                <img width="100px" height="100px"
                                                    src="{{asset('backend/products/'.$image->meta_value)}}"
                                                    class="img-thumbnail" alt="Responsive image" />
                                            </td>
                                            <td>{{$item->name}}</td>
                                            <td>{{$total=$item->price}}</td>
                                            <td>
                                                <form id="cart_up" class="up" method="POST"
                                                    action="{{route('cart.update')}}" name="Updatequantity">
                                                    @csrf
                                                    <input type="hidden" name="product_id" value="{{$item->id}}">
                                                    <div class="quantity buttons_added" style="padding: 0;">
                                                        <!--  <input type="button" value="-" class="minus"> -->
                                                        <input type="number" id="cart_qty_data"
                                                            class="input-text quantity_text form-control" step="1"
                                                            min="1" max="" name="quantity"
                                                            value="{{$item->quantity}}" title="quantity" size="4"
                                                            inputmode="numeric">
                                                        <!-- <input type="button" value="+" class="plus"> -->
                                                        <!-- <input type="submit" value="" class="plus"> -->

                                                    </div>
                                                </form>
                                            </td>
                                            <td>
                                                <a onclick="return confirm('are you sure??')"
                                                    href="{{url('/remove/'.$item->id)}}">
                                                    <div class="buttons" style="margin-top:1px !important">
                                                        <span class="btn btn-danger"><i class="fa fa-trash"></i></span>
                                                    </div>
                                                </a>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                <ul class="list-group mb-3">
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                       <p>Sub Total:</p> <div class="float-right">{{Cart::getTotalquantity()}} pcs {{Cart::getTotal()}}</div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                       <p>Delivery Charge:</p> <div class="float-right" id="charge"></div> <input id="deli" type="hidden" value="" class="form-control">
                                    </li>

                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                       <p>Order Total:</p> <div class="float-right"> {{Cart::getTotal()}}</div> 
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                       <p>Apply Promo code:</p> <div class="float-right"> <input autocomplete="off" id="promo_code" type="number" step="any" name="promo_code" class="form-control" placeholder="Enter code"> </div>
                                    </li>
                                    <div id="coupon_data_div"></div>
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                       <p>Order Total After Discount:</p>  <div class="float-right"> <div id="cart_get_total"></div> </div> 
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
                <div class="col-md-4 d-flex flex-column">
                    <h5 style="background: #e7e7e7;padding:10px 4px;"><b> <div class="float-left" id="cart_get_payment_sidebar"></div> </b> BDT</h5>
                    </br></br>
                    <div class="row">
                        @php $order=0; @endphp
                        @foreach ($info as $item)
                        @php
                        $order++;
                        $image='no-image.png';
                        $images=DB::table('postmeta')
                        ->where('post_id',$item->id)
                        ->where('meta_key','attachment')
                        ->first();
                        if($images>0):
                        $image= $images->meta_value;
                        endif;
                        @endphp
                        <div class="col-md-3">
                            @php
                            $image=DB::table('postmeta')->where(['post_id'=>$item->id,'meta_key'=>'attached_file'])->select('meta_value')->first();
                            @endphp
                            <img width="100%" height="100px" src="{{asset('backend/products/'.$image->meta_value)}}"
                                class="img-thumbnail" alt="image" />
                        </div>
                        <div class="col-md-9">
                            <ul>
                                <li>Item:{{$item->name}}</li>
                                <li>Price:৳{{$total=$item->price}}</li>
                                <li>Quantity:{{$item->quantity}}</li>
                                <li>Total:৳{{$total=$item->price*$item->quantity}}</li>
                            </ul>
                            <hr>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
    @else
    <h1 class="text-center">Opp's You have no product in your shopping cart</h1>
    <div class="text-center"><a href="{{url('/')}}"><span style="color:orange;fornt-size:14px;">SHOP NOW</span></a>
    </div>
    @endif

</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
</script>




<script>
  $(document).ready(function() {
      document.getElementById('cart_get_total').innerHTML=<?php echo Cart::getTotal(); ?> 
      document.getElementById('cart_get_payment').innerHTML=<?php echo Cart::getTotal(); ?> 
      document.getElementById('cart_get_payment_sidebar').innerHTML=<?php echo Cart::getTotal(); ?> 
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





//check if cart quantity is 0 then show error
$("#cart_qty_data").change(function(){
    var val=$("#cart_qty_data").val();
    if(val==0){
      alert('Opp"s Error')
      return false;
    }
  $('#cart_up').delay(200).submit();
});

$("#cart_qty_data").keyup(function(){
    var val=$("#cart_qty_data").val();
    if(val==0){
      alert('Opp"s Error')
      return false;
    }
  $('#cart_up').delay(200).submit();
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
     var main_amount=document.getElementById('cart_get_total').innerHTML=<?php echo Cart::getTotal(); ?> 
     var main_amount_payment=document.getElementById('cart_get_payment').innerHTML=<?php echo Cart::getTotal(); ?> 
     var main_amount_payment_sidebar=document.getElementById('cart_get_payment_sidebar').innerHTML=<?php echo Cart::getTotal(); ?> 
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
 
     var main_amount=document.getElementById('cart_get_total').innerHTML=<?php echo Cart::getTotal(); ?> 
     var main_amount_payment=document.getElementById('cart_get_payment').innerHTML=<?php echo Cart::getTotal(); ?> 
     var main_amount_payment_sidebar=document.getElementById('cart_get_payment_sidebar').innerHTML=<?php echo Cart::getTotal(); ?> 

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
            console.log(result);
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
$(document).ready(function() {
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        localStorage.setItem('activeTab', $(e.target).attr('href'));
    });
    var activeTab = localStorage.getItem('activeTab');
    if (activeTab) {
        $('#myTab a[href="' + activeTab + '"]').tab('show');
    }
});


</script>
@endsection