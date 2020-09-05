@extends('front.layouts.master')

@section('content')

  

<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12 ">
      <div class="container-fluid mt-2">
       <div class="container">                    
          <div class="row">
            <div class="col-md-4 order">
             
                <!--our content goes here-->
                <div class="container">
                    <div class="row profile">
                      <div class="col-md-3">
                        <div class="profile-sidebar position-fixed">
                          <!-- SIDEBAR USERPIC -->
                          <div class="profile-userpic">
                            <img src="{{asset('assets/front/images/zhou_256x256.jpg')}}" class="img-responsive" alt="">
                          </div>
                          <!-- END SIDEBAR USERPIC -->
                          <!-- SIDEBAR USER TITLE -->
                          <div class="profile-usertitle">
                            <div class="profile-usertitle-name">
                              {{ Auth::user()->name }}
                            </div>
                            <div class="profile-usertitle-job">
                              Developer
                            </div>
                            <hr>
                          </div>
                          <!-- END SIDEBAR USER TITLE -->
                          <!-- SIDEBAR BUTTONS -->
                          <div class="d-flex flex-row">
                            
                              <p class="offset-2 p2 p-text"><span class="text-secondary">0</span><br> Followers </p>
                            
                            
                              <p class="offset-2 p2 p-text"><span class="text-secondary">0</span><br>Following</p>
                           
                          </div>
                          <!-- END SIDEBAR BUTTONS -->
                          <!-- SIDEBAR MENU -->
                          <!-- END MENU -->
                        </div>
                      </div>
                    </div>
                  </div>

            </div>
            <div class="col-md-7">

                <div class="container content" style="border: 2px solid rgb(212, 227, 235);background: #fff;height: 600px;">
                    <div class="row profile">
                      <h2>Wishlist</h2>
                          <img src="{{asset('assets/front/images/wishlist.png')}}" width="" class="img-fluid" alt="Responsive image">
                      </div>
                       <h4 class="text-center">Your wishlist is empty!</h4>
                      <p class="text-center">Create a wishlist to save your favorite items</p>
                        <div class="d-flex justify-content-center">    
                          <form class="searchform cf">                    
                            <input type="text" placeholder="Whislist Name"><br>  
                            <button type="button" class="btn btn-primary mt-1 wishlist-btn">Primary</button> 
                          </form>
                        </div>
                </div>
                  </div>
              </div>

            </div>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>
</div>

@endsection
