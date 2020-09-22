@extends('front.layouts.master')

@section('content')
    
@php $address_one=''; $address_two=''; $phone=''; $country='';$state=''; $city=''; $zip='';  @endphp
            @foreach($user_info as $info)
                    @if($info->meta_key=='address_one')
                     @php $address_one=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='address_two')
                     @php $address_two=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='phone')
                     @php $phone=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='country')
                     @php $country=$info->meta_value; @endphp
                    @endif
                    @if($info->meta_key=='state')
                     @php $state=$info->meta_value; @endphp
                    @endif
                    @if($info->meta_key=='city')
                     @php $city=$info->meta_value; @endphp
                    @endif
                    @if($info->meta_key=='zip')
                     @php $zip=$info->meta_value; @endphp
                    @endif
                  @endforeach 
        
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">

        <div class="shopping-cart">
   <!--       
           <form action="{{route('profile.update',$user->id)}}" method="post">

            {{ csrf_field() }}
            {{ method_field('PATCH') }}
            
             <div class="form-group">
              <label for="name">Name</label>
              <input type="text" class="form-control" id="name" value="{{$user->name}}" aria-describedby="emailHelp" name="name" placeholder="Enter Name">
              
            </div>
           
            <button type="submit" class="btn btn-primary">Submit</button>

           </form> -->
            <div class="col-md-12 order-md-1 " style="border: 1px solid rgb(212, 227, 235);">
              <h4 class="mb-3 title-text">User Profile</h4>
              <form action="{{route('profile.update',$user->id)}}" method="post">
                {{ csrf_field() }}
                {{ method_field('PATCH') }}
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="firstName">First name<span class="requiredField">*</span></label>
                  <input type="text" class="form-control" id="firstName" value="{{auth()->user()->name}}" name="first_name" placeholder="First Name">
                  <div class="invalid-feedback">
                    Valid first name is required.
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="lastName">Last name<span class="requiredField">*</span></label>
                  <input type="text" class="form-control" id="lastName" value="{{auth()->user()->name}}" name="last_name" placeholder="Last Name">
                  <div class="invalid-feedback">
                    Valid last name is required.
                  </div>
                </div>
              </div>
              <div class="mb-3">
                <label for="address">Address Line 1<span class="requiredField"></span></label>
                <input type="text" class="form-control" id="address" value="{{$address_one}}" name="address_one" placeholder="Address Line">
                <div class="invalid-feedback">
                  Please enter your shipping address.
                </div>
              </div>
              <div class="mb-3">
                <label for="address2">Address Line 2 <span class="text-muted"></span></label>
                <input type="text" class="form-control" id="address2" value="{{$address_two}}" name="address_two" placeholder="Optional">
              </div>
              <div class="mb-3">
                <label for="phone">Phone<span class="requiredField">*</span></label>
                <input type="text" class="form-control" name="phone" value="{{$phone}}" id="phone" placeholder="Phone" required>
              </div>
              <div class="row">
                <div class="col-md-6 mb-">
                  <label for="country">Country / Region<span class="requiredField"></span></label>
                  <input type="text" class="form-control" name="country" value="{{$country}}" id="phone" placeholder="Country">
             
                </div>                            
                <div class="col-md-6 mb-3">
                  <label for="state">State/Province/Regoin <span class="requiredField"></span></label>
                  <input type="text" class="form-control" id="state" value="{{$state}}" name="state" placeholder="State">
                  <div class="invalid-feedback">
                    Zip code required.
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="city">City<span class="requiredField"></span></label>
                  <input type="text" class="form-control" id="city" value="{{$city}}" name="city" placeholder="City">
                  <div class="invalid-feedback">
                    .
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="zip">Zip</label>
                  <input type="text" class="form-control" name="zip" value="{{$zip}}" id="zip" placeholder="Zip">
                  <div class="invalid-feedback">
                    Zip code required.
                  </div>
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
