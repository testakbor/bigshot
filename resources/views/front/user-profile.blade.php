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
                  
                    <div class="profile-sidebar position-fixed">
                      <!-- SIDEBAR USERPIC -->
                      <div class="profile-userpic">
                        <img src="{{asset('assets/front/images/zhou_256x256.jpg')}}" class="img-responsive" alt="">
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                          <div class="profile-usertitle-name">
                              {{ Auth::user()->name }} <br>
                              Email : {{ Auth::user()->email }}
                          </div>
                          <!--   <div class="profile-usertitle-job">
                              Developer
                            </div> -->
                          <hr>
                          </div>
                          <!-- END SIDEBAR USER TITLE -->
                          <!-- SIDEBAR BUTTONS -->
                          <div class="d-flex flex-row"></div>
                          <!-- END SIDEBAR BUTTONS -->
                          <!-- SIDEBAR MENU -->
                          <!-- END MENU -->
                        </div>
                    
                
                </div>
                <div class="col-md-7" style="border: 2px solid rgb(212, 227, 235);background: #fff;height: 600px;">
                  <!-- Title -->
                  <div class="title">
                    WishList
                  </div>
                  <!-- Product #1 -->
        
                 @foreach($wishProduct as $item)
                 @foreach ($item->productMeta as $meta)
                         @if($meta['meta_key']=='_price')
                          @php                            
                          $price=$meta['meta_value'];
                          @endphp
                        @endif
                @endforeach
                  <div class="item">

                    <div class="buttons">
                      <span class="delete-btn"></span>
                    </div>
                    <div class="image">
                      <img src="{{asset('assets/backend/products/')}}" alt="" />
                    </div>
                    <div class="description">
                      <span>demo</span>
                    
                    </div>
                    
                    <div class="total-price">{{$price}}</div>
                    <div class="quantity">
                      <button type="submit" class="my-btn flex-btn ml-2" style="width: 115px;height: 42px;font-weight: 100;font-size: 12px;">
                        <span class="btn-text text-dark" style="width: 195px">Buy</span>
                      </button>
                    </div>
                  </div>
                  @endforeach
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div></div>

@endsection
