@extends('front.layouts.front_master')

@section('content')



<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">

    <div class="shopping-cart">
   
      <div class="col-md-12 order-md-1 " style="border: 1px solid rgb(212, 227, 235);">
        <h4 class="mb-3 title-text">User Profile</h4>
        <form action="{{route('password.update',$user->id)}}" method="post" enctype="multipart/form-data">
          {{ csrf_field() }}
       
            <div class="row">
                <div class="col-md-12 mb-3">
                <label for="n_password">New Password</label>
                  <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="n_password" required autocomplete="new-password" placeholder="New Password" >
              </div>
            </div>
            <button type="submit" class="btn btn-primary float-right mb-3">Update Information</button>
         
          
        </form>
      </div>
    </div>
  </div>
</div>
</div>
</div>
@endsection