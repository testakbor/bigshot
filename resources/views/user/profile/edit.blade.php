@extends('front.layouts.master')

@section('content')
    
        
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12">
      <div class="container-fluid">
        <div class="shopping-cart">
         
           <form action="{{route('profile.update',$user->id)}}" method="post">

            {{ csrf_field() }}
            {{ method_field('PATCH') }}
            
             <div class="form-group">
              <label for="name">Name</label>
              <input type="text" class="form-control" id="name" value="{{$user->name}}" aria-describedby="emailHelp" name="name" placeholder="Enter Name">
              
            </div>
           
            <button type="submit" class="btn btn-primary">Submit</button>

           </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
@endsection
