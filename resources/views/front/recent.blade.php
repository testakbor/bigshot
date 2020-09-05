
@extends('front.layouts.master')

@section('content')


<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
      <div class="col-md-10 ">
       <div class="container-fluid ml-5 mt-5" style="background-color: lightgray;padding: 15px;">
        <section style="margin-left: 120px" class="mt-5">
          <p class="text-center">No Product Found</p>
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

