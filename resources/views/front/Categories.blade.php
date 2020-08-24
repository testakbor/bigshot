@extends('front.layouts.master')

@section('content')
<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar" class="active">

        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a isemphasized="1" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component jtgkGA" href="/Categories"><svg viewBox="0 0 17 17" style="width: 100%; height: 25px; margin-top: 12px;"><path d="M11.044 5.588c6.307.633 6.326.672 1.577 5.064 1.375 6.405 1.283 6.482-4.126 3.126-5.408 3.356-5.482 3.28-4.107-3.126-4.767-4.392-4.73-4.43 1.559-5.064 2.548-6.117 2.567-6.117 5.097 0z" stroke="#C0952B" fill="#FFD560" fill-rule="evenodd"></path></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Popular</div></a>
        </li>
        <li>
          <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="/pickup-tab"><svg viewBox="0 0 13 15" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 25px; margin-top: 12px;"><path d="M6.5 0C10.09 0 13 2.82 13 6.298a6.052 6.052 0 0 1-1.904 4.411l.001.001L6.5 15l-4.28-4.009C.86 9.859 0 8.188 0 6.298 0 2.82 2.91 0 6.5 0zm0 4.618c-.957 0-1.733.752-1.733 1.68 0 .927.776 1.679 1.733 1.679.957 0 1.733-.752 1.733-1.68 0-.927-.776-1.679-1.733-1.679z" fill="#2eaa77"></path></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Local</div></a>
      </li>
      
    <li>
        <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="/recent"><svg viewBox="0 0 22 22" style="width: 100%; height: 25px; margin-top: 12px;"><g fill="none" fill-rule="evenodd"><circle fill="#0098D3" fill-rule="nonzero" cx="11" cy="11" r="11"></circle><path d="M11 20.5a9.5 9.5 0 1 0 0-19 9.5 9.5 0 0 0 0 19z" fill="#DBF3FC" fill-rule="nonzero"></path><path d="M11 1.5v9.445l6.745 6.745A9.5 9.5 0 1 1 11 1.5z" fill="#FFF" fill-rule="nonzero"></path><path stroke="#0098D3" stroke-width="1.54" stroke-linecap="round" stroke-linejoin="round" d="M14.818 14.663L11 11.018v-6.39"></path></g></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Recent</div></a>
    </li>
    <li>
        <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="/Categories"><svg viewBox="0 0 24 24" style="width: 100%; height: 28px; margin-top: 12px;"><g id="Icons/18/ic_brand_shield_18" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g><rect id="Rectangle" x="0" y="0" width="23.4" height="23.4"></rect><g id="Brand-sheild_18" transform="translate(1.600000, 1.600000)"><g id="Geen-Shield"><path d="M-5.32907052e-15,4.60986842 C2.27808404,3.08888308 6.58459094,1.37356911 10.5368421,0 C13.572825,1.19653322 17.4129136,2.43182498 21.0736842,4.60986842 C21.0736842,7.90263158 20.1782317,11.4844418 19.7565789,13.1710526 C18.8785088,16.6833333 15.8052632,19.3175439 10.5368421,21.0736842 C5.26842105,19.3175439 2.19517544,16.6833333 1.31710526,13.1710526 C0.893406177,11.4762563 -5.32907052e-15,7.90263158 -5.32907052e-15,4.60986842 Z" id="Path-4-Copy-7" fill="#65BD37"></path><path d="M15.9383044,7.13117972 C15.6466105,6.78339725 15.1282126,6.73792842 14.7804301,7.02962224 C14.7597268,7.04698661 14.7398924,7.06536142 14.7209993,7.08467971 L9.08978918,12.8426019 L9.08978918,12.8426019 L6.45570184,10.1438387 C6.10983825,9.78948304 5.54219836,9.78259881 5.18784265,10.1284624 C5.18078715,10.1353488 5.17384572,10.1423511 5.16702119,10.1494665 C4.80867009,10.5230898 4.80911084,11.1129569 5.16801987,11.4860442 L8.62100984,15.0754405 C8.86988722,15.3341495 9.28136728,15.3421196 9.54007627,15.0932422 C9.54623951,15.0873132 9.55228514,15.0812631 9.55820962,15.0750955 L15.8928254,8.48052725 C16.2503312,8.10835058 16.2699393,7.52658345 15.9383044,7.13117972 Z" id="Fill-1-Copy-2" fill="#FFFFFF"></path></g></g></g></g></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Brands</div></a>
    </li>
    <li>
        <ul class="menus">
            <li> <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="#">
                <svg viewBox="0 0 24 24" style="width: 100%; height: 25px; margin-top: 12px;"><g id="Icons/Main/ic_grid_24" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="Group-14-Copy"><rect id="Rectangle-4" x="0" y="0" width="24" height="24"></rect><g id="Group" transform="translate(2.000000, 2.000000)" fill="#79D6FA" stroke="#006BA0" stroke-width="1.4"><rect id="Rectangle-5" x="0.7" y="0.7" width="7.6" height="7.6" rx="1.4"></rect><rect id="Rectangle-5-Copy-2" x="11.7" y="0.7" width="7.6" height="7.6" rx="1.4"></rect><rect id="Rectangle-5-Copy-3" x="11.7" y="11.7" width="7.6" height="7.6" rx="1.4"></rect><rect id="Rectangle-5-Copy-4" x="0.7" y="11.7" width="7.6" height="7.6" rx="1.4"></rect></g></g></g></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Categories</div></a>
                

                <div class="megadrop">

                    <div class="col">
                      <!-- <h3>Title</h3> -->
                      <ul>
                        <li><a href="/Categories">
                          <table>
                            <tr>
                              <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/fashion_m.png" class="ml-1" height="30" width="50"></th>
                              <th class="tb-text">Fashion</th>
                          </tr>
                      </table>
                  </a>
              </li>
              <li><a href="/Categories">
                  <table>
                    <tr>
                      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/gadgets_m.png" class="ml-1" height="30" width="50"></th>
                      <th class="tb-text">Gadgets</th>
                  </tr>
              </table>
            </a>
          </li>
          <li><a href="/Categories">
              <table>
                <tr>
                  <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/accessories_m.png" class="ml-1" height="30" width="50"></th>
                  <th class="tb-text">Accessories</th>
              </tr>
          </table>
        </a>
      </li>
      <li><a href="/Categories">
          <table>
            <tr>
              <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/hobbies_m.png" class="ml-1" height="30" width="50"></th>
              <th class="tb-text">Hobbies</th>
          </tr>
      </table>
    </a>
  </li>
  <li><a href="/Categories">
      <table>
        <tr>
          <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/cpg_m.png" class="ml-1" height="30" width="50"></th>
          <th class="tb-text">Household Supplies</th>
      </tr>
  </table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/home_decor_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Home Decor</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/shoes_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Shoes</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/wallets_and_bags_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Wallets & Bags</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/phone_upgrades.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Phone Upgrades</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/watches.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Watches</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/tools.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Tools</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/tops_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Tops</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/pet_accessories.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Pet Accessories</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/stationery_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Stationery</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/underwear_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Underwear</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/kitchen_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Kitchen</th>
  </tr>
</table>
</a>
</li>
<li><a href="/Categories">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/bottoms_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Bottoms</th>
  </tr>
</table>
</a>
</li>
</ul>
</div>

</div>

</li>


</ul>

</li>
</ul>

<div class="footer">

</div>
</nav>

<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
      <div class="col-md-10 ">
       <div class="container-fluid">

          <section style="margin-left: 120px" class="mt-5">

              <img src="{{asset('assets/front/images/add.png')}}" width="980">

              <ul class="wrapper cf mt-3">
                  <li class="product fl-l">
                    <a href="/product-page">
                      <div class="container-prod">
                        <div class="image" style="background-image:url({{asset('assets/front/images/1.jpg')}});"></div>
                        <div class="container-information">
                          <div class="title">
                              Splatter hoodie
                              <a href="#" class="more close"><i class="fa fa-times"></i></a>                
                          </div>
                      </div>

                      <div class="buttons cf">
                        <span style="margin-left: 3px;font-size: 12px;">
                          <span class="add ml-2">20,000+ bought this</span>

                      </span>

                  </div>
              </div>
                    </a>

          </li>
          <li class="product fl-l">
          <a href="/product-page">
            <div class="container-prod">
              <div class="image" style="background-image:url({{asset('assets/front/images/3.jpg')}});"></div>
              <div class="container-information">
                  <div class="title">Indian hoodie</div>
              </div>

              <div class="buttons cf">
                <span style="margin-left: 3px;font-size: 12px;">
                    <span class="add ml-2">20,000+ bought this</span>            
                </span>

              </div>
            </div>
          </a>

          </li>
        <li class="product fl-l">
          <a href="/product-page">
            <div class="container-prod">
              <div class="image" style="background-image:url({{asset('assets/front/images/4.jpg')}});"></div>
              <div class="container-information">
                  <div class="title">Face hoodie</div>
              </div>

              <div class="buttons cf">
                <span style="margin-left: 3px;font-size: 12px;">
                    <span class="add ml-2">20,000+ bought this</span>            
                </span>

              </div>
            </div>
          </a>
        </li>
    <li class="product fl-l">
      <a href="/product-page">
        <div class="container-prod">
          <div class="image" style="background-image:url({{asset('assets/front/images/5.jpg')}});"></div>
          <div class="container-information">
              <div class="title">Face hoodie</div>
              <div class="description">Siebdruck print<br>100% cotton<br>Color available: black on gray<br>Size available: XL, XXL</div>
          </div>
          
          <div class="buttons cf">
              <span style="margin-left: 3px;font-size: 12px;">
                <span class="add ml-2">20,000+ bought this</span>            
            </span>

        </div>
    </div>
      </a>
    </li>
</ul>
<ul class="wrapper cf mt-3">
  <li class="product fl-l">
    <a href="/product-page">
        <div class="container-prod">
        <div class="image" style="background-image:url({{asset('assets/front/images/6.jpg')}});"></div>
        <div class="container-information">
          <div class="title">
              Splatter hoodie
              <a href="javascript:void(0)" class="more close"><i class="fa fa-times"></i></a>                
          </div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: white on gray<br>Size available: L, XL</div>
      </div>

      <div class="buttons cf">
          <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>

    </div>
</div>
    </a>
  </li>
<li class="product fl-l">
  <a href="/product-page">
    <div class="container-prod">
      <div class="image" style="background-image:url({{asset('assets/front/images/7.jpg')}});"></div>
      <div class="container-information">
          <div class="title">Indian hoodie</div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: white on black<br>Size available: L, XL, XXL</div>
      </div>
      <div class="buttons cf">
         <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>
    </div>
</div>

  </a>
</li>
<li class="product fl-l">
  <a href="/product-page">
    <div class="container-prod">
      <div class="image" style="background-image:url({{asset('assets/front/images/8.jpg')}});"></div>
      <div class="container-information">
          <div class="title">Face hoodie</div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: black on gray<br>Size available: XL, XXL</div>
      </div>

      <div class="buttons cf">
          <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>
    </div>
</div>
  </a>
</li>
<li class="product fl-l">
  <a href="/product-page">
    <div class="container-prod">
      <div class="image" style="background-image:url({{asset('assets/front/images/12.jpg')}});"></div>
      <div class="container-information">
          <div class="title">Face hoodie

          </div>
          <div class="description">Siebdruck print<br>100% cotton<br>Color available: black on gray<br>Size available: XL, XXL</div>
      </div>            
      <div class="buttons cf">
          <span style="margin-left: 3px;font-size: 12px;">
            <span class="add ml-2">20,000+ bought this</span>            
        </span>
    </div>
</div>
  </a>
</li>
</ul>
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
