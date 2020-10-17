@extends('front.layouts.master')

@section('content')
@php  $l_name=''; $address1=''; $address2=''; $phone='';$country='';$dist_rict=''; $city='';$zip=''; $name=''; $email=''; @endphp
<!-- Page Content  -->

@if(Auth::check()) @php $name=auth()->user()->name; $email=auth()->user()->email; @endphp @endif
@foreach($user_info as $in)
@if($in->meta_key=='address_one')
@php $address1=$in->meta_value; @endphp
@endif
@if($in->meta_key=='last_name')
@php $l_name=$in->meta_value; @endphp
@endif
@if($in->meta_key=='address_two')
@php $address2=$in->meta_value; @endphp
@endif
@if($in->meta_key=='phone')
@php $phone=$in->meta_value; @endphp
@endif
@if($in->meta_key=='country')
@php $country=$in->meta_value; @endphp
@endif
@if($in->meta_key=='district')
@php $dist_rict=$in->meta_value; @endphp
@endif
@if($in->meta_key=='city')
@php $city=$in->meta_value; @endphp
@endif
@if($in->meta_key=='zip')
@php $zip=$in->meta_value; @endphp
@endif
@endforeach
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12 ">
      <div class="container-fluid mt-2">
        <div class="container">
          @if (session('status'))
          <div class="alert alert-success" role="alert" id="alert">
            {{ session('status') }}
          </div>
          @endif
          <form role="form" action="{{route('checkout')}}" method="POST">
            @csrf
            <div class="row">
              <div class="col-md-4 order-md-2 mb-4">
                <h4 class="d-flex justify-content-between align-items-center Title mb-3">
                  <span class="text-muted">Order Summary</span>
                  @if(\Cart::getTotalquantity()==0)
                  @else
                  <span class="badge badge-secondary badge-pill">
                    {{ \Cart::getTotalquantity()}}
                    @endif
                  </span>
                </h4>
                <ul class="list-group mb-3">
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>

                      <small class="text-muted">Item Total</small>
                    </div>
                    <span class="text-muted"> {{ \Cart::getTotalquantity()}}</span>
                  </li>
                  <!-- <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                    <small class="text-muted">Shipping</small>
                  </div>
                  <span class="text-muted">$8</span>
                </li> -->
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                      <small class="text-muted">Order Total</small>
                    </div>
                    <span class="text-muted">{{Cart::getTotal()}}</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                      <small>*Approx</small>
                    </div>
                    <span class="text-muted">৳ {{Cart::getTotal()}} BDT</span>
                  </li>
                </ul>

                {{-- <form class="card p-2" action="/order-success"> --}}
                <div class="input-group">
                  <!-- <input type="text" name="promo_code" class="form-control" placeholder="Promo code" style="width: 50px;">
                  <div class="input-group-append">
                    <button type="submit" name="reedeem" class="btn btn-secondary">Redeem</button>
                  </div> -->
                  @if(\Cart::getTotalquantity()>0)
                  <div class="input-group">
                    <button class="btn btn-primary btn-lg btn-block mt-3" type="submit">Continue to checkout</button>
                  </div>
                  @endif
                </div>
                {{-- </form> --}}
              </div>
              <div class="col-md-7 order-md-1 ml-5" style="border: 1px solid rgb(212, 227, 235);">
                @if(\Cart::getTotalquantity()==0) You have no product in your cart!! <a href="{{url('/')}}" style="color: #28a745 !important;">Shop Now</a> @endif
                <h4 class="mb-3 title-text">Billing address</h4>

                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label for="firstName">First name<span class="requiredField">*</span></label>
                    @if($name=='') @php  @endphp @php $name='Guest'; @endphp @endif
                    <input type="text" class="form-control" id="firstName" value="{{$name}}" name="first_name" placeholder="First Name" required>
                    <div class="invalid-feedback">
                      Valid first name is required.
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="lastName">Last name<span class="requiredField">*</span></label>
                     @if($l_name=='') @php  @endphp @php $l_name='Guest'; @endphp @endif
                    <input type="text" class="form-control" id="lastName" value="{{$l_name}}" name="last_name" placeholder="Last Name" required>
                    <div class="invalid-feedback">
                      Valid last name is required.
                    </div>
                  </div>
                </div>
                <div class="mb-3">
                  <label for="address">Address<span class="requiredField">*</span></label>
                      @if($address1=='') @php  @endphp @php $address1='Uttara,Dhaka'; @endphp @endif
                  <input type="text" class="form-control" id="address" value="{{$address1}}" name="address_one" placeholder="Address" required>
                  <div class="invalid-feedback">
                    Please enter your shipping address.
                  </div>
                </div>

                <!-- <div class="mb-3">
                <label for="address2">Address Line 2 <span class="text-muted"></span></label>
                <input type="text" class="form-control" value="{{$address2}}" id="address2" name="address_two" placeholder="Optional">
              </div>
 -->
                <div class="mb-3">
                      @if($phone=='') @php  @endphp @php $phone='0000000001'; @endphp @endif
                  <label for="phone">Mobile Number<span class="requiredField">*</span></label>
                  <input type="text" class="form-control" value="{{$phone}}" name="phone" id="phone" placeholder="Mobile Number" required>
                </div>

                <div class="mb-3">
                  @if($email=='') @php  @endphp @php $email='guest@email.com'; @endphp @endif
                  <label for="phone">Email<span class="requiredField">*</span></label>
                  <input type="text" class="form-control" value="{{$email}}" name="email" id="email" placeholder="Email" required>
                </div>

                <div class="row">
                  <div class="col-md-6 mb-">
                    <label for="country">Country<span class="requiredField">*</span></label>
                    <input type="text" class="form-control" value="Bangladesh" name="country" placeholder="Country" readonly required>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="state">District <span class="requiredField">*</span></label>
                    <select class="form-control" name="state" id="state" required>
                      <option value="">Select District</option>
                      @foreach($district as $dist)
                       <option value="{{$dist->term_id}}"@if($dist->term_id == $dist_rict) selected='selected' @endif>{{ $dist->district }}</option>
                      @endforeach
                    </select>
                    <div class="invalid-feedback">
                      Zip code required.
                    </div>
                  </div>

                </div>
                <div class="row">

                  <div class="col-md-6 mb-3">
                    <label for="city">City/Thana<span class="requiredField">*</span></label>
                    @if($city=='') 
                        <select class="form-control" id="city" name="city" required>
                          <option value="">Select District First</option>
                        </select>
                      @else 
                      @php
                       $data=DB::table('term_taxonomy')->where(['taxonomy'=>'city','parent'=>$dist_rict])
                      ->join('terms','terms.term_id','=','term_taxonomy.term_id')
                      ->select('terms.name as city_name','terms.term_id')
                      ->first();
                   
                      @endphp
                        <select class="form-control" id="city" name="city" required>
                          <option value="{{$data->term_id}}">{{$data->city_name}}</option>
                        </select>
                      @endif
                  
                    <div class="invalid-feedback">
                      .
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="zip">Postcode</label>
                    @if($city=='')
                    <input type="text" class="form-control" value="" name="zip" id="zip" placeholder="Postcode">
                    @else 
                        @php
                        $posts_codes = DB::table('term_taxonomy')->where(['taxonomy' => 'postcode','parent'=>$city])
                      ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
                      ->select('terms.name as zip')
                      ->first();
                      @endphp
                    <input type="text" class="form-control" value="{{$posts_codes->zip}}" name="zip" id="zip" placeholder="Postcode">
                    @endif 
                    <div class="invalid-feedback">
                      Zip code required.
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6 mb-3">
                  </div>
                  <!-- <div class="col-md-6 mb-3">
                  <button type="button" class="btn btn-light ml-1" style="width: 118px;border: 1px solid skyblue;color: skyblue;background-color: white;font-weight: 600;">Cancel</button>
                  <button type="button" class="btn btn-info ml-3">Use this Address</button>
                </div> -->
                </div>
                <!-- <hr class="mb-4"> -->
                <hr class="mb-4">
                <h4 class="mb-3">Payment<span class="requiredField">*</span></h4>
                <div class="d-block my-3">
                  <div class="custom-control custom-radio">
                    <input id="credit" name="paymentMethod" type="radio" value="cradit" class="custom-control-input" required>
                    <label class="custom-control-label" for="credit">Credit card</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input id="debit" name="paymentMethod" value="debit" type="radio" class="custom-control-input" required>
                    <label class="custom-control-label" for="debit">Debit card</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input id="Bkash" name="paymentMethod" value="Bkash" type="radio" class="custom-control-input" required>
                    <label class="custom-control-label" for="Bkash">Bkash</label>
                  </div>
                  <div class="custom-control custom-radio">
                    <input id="cash" name="paymentMethod" type="radio" value="cash" class="custom-control-input" checked required>
                    <label class="custom-control-label" id="cash" for="cash">Cash on delivery</label>
                  </div>
                </div>
                <div class="row" id="hnf" style="display:none">
                  <div class="col-md-6 mb-3">
                    <label for="cc-name">Name on card<span class="requiredField">*</span></label>
                    <input type="text" class="form-control" id="cc-name" name="cardName" placeholder="Name of card">
                    <small class="text-muted">Full name as displayed on card</small>
                    <div class="invalid-feedback">
                      Name on card is required
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="cc-number">Credit card number<span class="requiredField">*</span></label>
                    <input type="text" class="form-control" id="cc-number" placeholder="Creadit Card Number" name="cc-number">
                    <div class="invalid-feedback">
                      Credit card number is required
                    </div>
                  </div>
                </div>
                <!-- bkash -->
                <div class="row" id="bks_num" style="display:none">
                  <div class="col-md-6 mb-3">
                    <label for="cc-name">Bkash Number<span class="requiredField">*</span></label>
                    <input type="text" class="form-control" id="bksnum" name="bksnum" placeholder="Bkash Number">
                    <div class="invalid-feedback">
                      Number on Bkash is required
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="cc-number">Reference number<span class="requiredField">*</span></label>
                    <input type="text" class="form-control" id="rfnum" placeholder="Bkash Reference Number" name="rfnum">
                    <div class="invalid-feedback">
                      Reference number is required
                    </div>
                  </div>
                </div>
                <!-- bkash end -->
                <div class="row" id="hnf1" style="display:none">
                  <div class="col-md-3 mb-3">
                    <label for="cc-expiration">Expiration<span class="requiredField">*</span></label>
                    <input type="text" class="form-control" id="cc-expiration" name="cc-expiration" placeholder="Expiration">
                    <div class="invalid-feedback">
                      Expiration date required
                    </div>
                  </div>
                  <div class="col-md-3 mb-3">
                    <label for="cc-cvv">CVV<span class="requiredField">*</span></label>
                    <input type="text" class="form-control" id="cc-cvv" name="cc-cvv" placeholder="Security code">
                    <div class="invalid-feedback">
                      Security code required
                    </div>
                  </div>
                </div>
                <hr class="mb-4">
                @if(\Cart::getTotalquantity()>0)
                <button class="btn btn-primary btn-lg btn-block" name="paymentSubmit" type="submit">Use Payment Method</button>
                @endif
                <div class="btn btn-success btn-lg btn-block">
                  Items In Cart
                </div>
          </form>
          @foreach ($info as $item)
          @php
          $image='no-image.png';
          $images=DB::table('postmeta')
          ->where('post_id',$item->id)
          ->where('meta_key','attachment')
          ->first();
          if($images>0):
          $image= $images->meta_value;
          endif;
          @endphp
          <div class="d-flex flex-row mb-3">
            <div class="col-md-2 p-0 ">
              <img src="{{asset('assets/backend/products/'.$image)}}" alt="" class="img-fluid">
            </div>
            <div class="col-md-8">
              <div class="d-flex flex-column">
                <div>
                  {{$item->name}} <br>
                  {{$item->id}}
                  {{$item->quantity}}
                </div>
                <div>
                  Green <br>
                  Shipping:$2<br>
                  (Sep 7 - Nov 1)
                </div>
                <div class="d-flex flex-row">
                  <div>
                    <form method="POST" action="{{route('cart.update')}}" name="Updatequantity">
                      @csrf
                      <input type="hidden" name="product_id" value="{{$item->id}}">
                      <div class="quantity buttons_added" style="padding: 0;">
                        <!--  <input type="button" value="-" class="minus"> -->
                        <input type="number" id="" class="input-text quantity_text" step="1" min="1" max="" name="quantity" value="{{$item->quantity}}" title="quantity" size="4" inputmode="numeric">
                        <!-- <input type="button" value="+" class="plus"> -->
                        <!-- <input type="submit" value="" class="plus"> -->
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                      </div>
                    </form>
                  </div>
                  <div class="ml-3">
                    <a href="{{url('/remove/'.$item->id)}}">
                      <div class="buttons" style="margin-top:3px !important">
                        <span class="delete-btn"></span>
                      </div>
                    </a>
                  </div>
                </div>

              </div>
            </div>
            <div class="col-md-2"> ${{$total=$item->price*$item->quantity}}</div>
          </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script>
  $("#state").change(function() {
    var district_id = $("#state").val();
    $.ajax({
      url: "{{url('/district/city/')}}" + '/' + district_id,
      type: "GET",
      success: function(response) {
        var items = "";
        $.each(response, function(i, item) {
          items += "<option value=''>Select City</option>";
          items += "<option value='" + item.term_id + "'>" + (item.city_name) + "</option>";
        });
        $("#city").html(items);
      },
      error: function(response) {
        console.log(response);
      },
    });
  });


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
</script>
@endsection