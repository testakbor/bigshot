@extends('front.layouts.master')

@section('content')

<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12 ml-4">
      <div class="container">

        <style>
          h1 {
            color: #88B04B;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-weight: 900;

          }

          p {
            color: #404F5E;
            font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
            font-size: 20px;
            margin: 0;
          }

          .checkmark {
            color: #9ABC66;
            font-size: 100px;
            line-height: 200px;
            margin-left: -15px;
          }

          .card {
            background: white;
            /*padding: 60px;*/
            padding-top: 120px;
            padding-left: 60px;
            padding-right: 60px;
            border-radius: 4px;
            box-shadow: 0 2px 3px #C8D0D8;
            display: inline-block;
            /*margin: 0 auto;*/
            margin-left: 350px;
            left: 50;
          }
        </style>

        <div class="card">
          <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
            <i class="checkmark">✓</i>
          </div>
          <p>Thanking you to shop with BiGshot. Your order has successfully placed. You will
            receive your parcel within # Dhaka Metro 1-3 working days # Bangladesh wide 2-5 working days.
            You can find the update your order in your account under order history
            <a href="{{url('order-list')}}"> Your order details</a></p>
        </div>

      </div>
    </div>

  </div>



</div>
</div>
@endsection