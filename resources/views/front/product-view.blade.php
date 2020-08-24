@extends('front.layouts.master')

@section('content')
<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar" class="active">

        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a isemphasized="1" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component jtgkGA" href="#"><svg viewBox="0 0 17 17" style="width: 100%; height: 25px; margin-top: 12px;"><path d="M11.044 5.588c6.307.633 6.326.672 1.577 5.064 1.375 6.405 1.283 6.482-4.126 3.126-5.408 3.356-5.482 3.28-4.107-3.126-4.767-4.392-4.73-4.43 1.559-5.064 2.548-6.117 2.567-6.117 5.097 0z" stroke="#C0952B" fill="#FFD560" fill-rule="evenodd"></path></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Popular</div></a>
        </li>
        <li>
          <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="/pickup-tab"><svg viewBox="0 0 13 15" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 25px; margin-top: 12px;"><path d="M6.5 0C10.09 0 13 2.82 13 6.298a6.052 6.052 0 0 1-1.904 4.411l.001.001L6.5 15l-4.28-4.009C.86 9.859 0 8.188 0 6.298 0 2.82 2.91 0 6.5 0zm0 4.618c-.957 0-1.733.752-1.733 1.68 0 .927.776 1.679 1.733 1.679.957 0 1.733-.752 1.733-1.68 0-.927-.776-1.679-1.733-1.679z" fill="#2eaa77"></path></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Local</div></a>
      </li>
     <!--  <li>
        <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="#"><svg viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg" style="width: 100%; height: 25px; margin-top: 12px;"><g fill="none" fill-rule="evenodd"><g><circle fill="#C0952B" cx="10.952" cy="10.952" r="10.952"></circle><path d="M10.917 11.067l-.004.003L2.79 6.347a9.413 9.413 0 0 1 8.15-4.722l-.023 9.442z" fill="#F9D798"></path><path d="M10.918 11.067l.022-9.441A9.344 9.344 0 0 1 15.666 2.9a9.4 9.4 0 0 1 3.424 3.43l-8.172 4.736z" fill="#F1BE40"></path><path d="M19.097 15.83l-8.179-4.757v-.006l8.172-4.735a9.493 9.493 0 0 1 .007 9.498" fill="#F7D48E"></path><path d="M10.91 11.074v-.006L2.789 6.345a9.493 9.493 0 0 0-.02 9.449l8.143-4.72z" fill="#F5C24F"></path><path d="M10.91 11.074l-8.142 4.72a9.391 9.391 0 0 0 3.453 3.48 9.352 9.352 0 0 0 4.667 1.276l.022-9.476z" fill="#F9D798"></path><path d="M19.096 15.828l-8.18-4.757-.006.003-.022 9.476a9.41 9.41 0 0 0 8.208-4.722" fill="#F1BE40"></path></g><path d="M11 13.463a2.4 2.4 0 0 0 2.4-2.4c0-.884-.8-2.025-2.4-3.423-1.6 1.398-2.4 2.539-2.4 3.423a2.4 2.4 0 0 0 2.4 2.4z" fill="#FFF"></path><path d="M-1-1h24v24H-1z"></path></g></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Blitz Buy</div></a>
    </li> -->
    <li>
        <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="/recent"><svg viewBox="0 0 22 22" style="width: 100%; height: 25px; margin-top: 12px;"><g fill="none" fill-rule="evenodd"><circle fill="#0098D3" fill-rule="nonzero" cx="11" cy="11" r="11"></circle><path d="M11 20.5a9.5 9.5 0 1 0 0-19 9.5 9.5 0 0 0 0 19z" fill="#DBF3FC" fill-rule="nonzero"></path><path d="M11 1.5v9.445l6.745 6.745A9.5 9.5 0 1 1 11 1.5z" fill="#FFF" fill-rule="nonzero"></path><path stroke="#0098D3" stroke-width="1.54" stroke-linecap="round" stroke-linejoin="round" d="M14.818 14.663L11 11.018v-6.39"></path></g></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Recent</div></a>
    </li>
    <li>
        <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="#"><svg viewBox="0 0 24 24" style="width: 100%; height: 28px; margin-top: 12px;"><g id="Icons/18/ic_brand_shield_18" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g><rect id="Rectangle" x="0" y="0" width="23.4" height="23.4"></rect><g id="Brand-sheild_18" transform="translate(1.600000, 1.600000)"><g id="Geen-Shield"><path d="M-5.32907052e-15,4.60986842 C2.27808404,3.08888308 6.58459094,1.37356911 10.5368421,0 C13.572825,1.19653322 17.4129136,2.43182498 21.0736842,4.60986842 C21.0736842,7.90263158 20.1782317,11.4844418 19.7565789,13.1710526 C18.8785088,16.6833333 15.8052632,19.3175439 10.5368421,21.0736842 C5.26842105,19.3175439 2.19517544,16.6833333 1.31710526,13.1710526 C0.893406177,11.4762563 -5.32907052e-15,7.90263158 -5.32907052e-15,4.60986842 Z" id="Path-4-Copy-7" fill="#65BD37"></path><path d="M15.9383044,7.13117972 C15.6466105,6.78339725 15.1282126,6.73792842 14.7804301,7.02962224 C14.7597268,7.04698661 14.7398924,7.06536142 14.7209993,7.08467971 L9.08978918,12.8426019 L9.08978918,12.8426019 L6.45570184,10.1438387 C6.10983825,9.78948304 5.54219836,9.78259881 5.18784265,10.1284624 C5.18078715,10.1353488 5.17384572,10.1423511 5.16702119,10.1494665 C4.80867009,10.5230898 4.80911084,11.1129569 5.16801987,11.4860442 L8.62100984,15.0754405 C8.86988722,15.3341495 9.28136728,15.3421196 9.54007627,15.0932422 C9.54623951,15.0873132 9.55228514,15.0812631 9.55820962,15.0750955 L15.8928254,8.48052725 C16.2503312,8.10835058 16.2699393,7.52658345 15.9383044,7.13117972 Z" id="Fill-1-Copy-2" fill="#FFFFFF"></path></g></g></g></g></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Brands</div></a>
    </li>
    <li>
        <ul class="menus">
            <li> <a isemphasized="0" isinsidemenubarshowv2="0" class="SideTabBar__SideTabItem-sc-18isgdb-0-Component gaHUxX" href="#">
                <svg viewBox="0 0 24 24" style="width: 100%; height: 25px; margin-top: 12px;"><g id="Icons/Main/ic_grid_24" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="Group-14-Copy"><rect id="Rectangle-4" x="0" y="0" width="24" height="24"></rect><g id="Group" transform="translate(2.000000, 2.000000)" fill="#79D6FA" stroke="#006BA0" stroke-width="1.4"><rect id="Rectangle-5" x="0.7" y="0.7" width="7.6" height="7.6" rx="1.4"></rect><rect id="Rectangle-5-Copy-2" x="11.7" y="0.7" width="7.6" height="7.6" rx="1.4"></rect><rect id="Rectangle-5-Copy-3" x="11.7" y="11.7" width="7.6" height="7.6" rx="1.4"></rect><rect id="Rectangle-5-Copy-4" x="0.7" y="11.7" width="7.6" height="7.6" rx="1.4"></rect></g></g></g></svg><div class="SideTabBar__SideTabTitle-sc-18isgdb-1 jyOheE">Categories</div></a>
                

                <div class="megadrop">

                    <div class="col">
                      <!-- <h3>Title</h3> -->
                      <ul>
                        <li><a href="#">
                          <table>
                            <tr>
                              <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/fashion_m.png" class="ml-1" height="30" width="50"></th>
                              <th class="tb-text">Fashion</th>
                          </tr>
                      </table>
                  </a>
              </li>
              <li><a href="#">
                  <table>
                    <tr>
                      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/gadgets_m.png" class="ml-1" height="30" width="50"></th>
                      <th class="tb-text">Gadgets</th>
                  </tr>
              </table>
            </a>
          </li>
          <li><a href="#">
              <table>
                <tr>
                  <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/accessories_m.png" class="ml-1" height="30" width="50"></th>
                  <th class="tb-text">Accessories</th>
              </tr>
          </table>
        </a>
      </li>
      <li><a href="#">
          <table>
            <tr>
              <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/hobbies_m.png" class="ml-1" height="30" width="50"></th>
              <th class="tb-text">Hobbies</th>
          </tr>
      </table>
    </a>
  </li>
  <li><a href="#">
      <table>
        <tr>
          <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/cpg_m.png" class="ml-1" height="30" width="50"></th>
          <th class="tb-text">Household Supplies</th>
      </tr>
  </table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/home_decor_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Home Decor</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/shoes_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Shoes</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/wallets_and_bags_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Wallets & Bags</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/phone_upgrades.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Phone Upgrades</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/watches.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Watches</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/tools.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Tools</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/tops_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Tops</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/pet_accessories.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Pet Accessories</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/stationery_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Stationery</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/underwear_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Underwear</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
  <table>
    <tr>
      <th align="left"><img src="https://main.cdn.wish.com/web/13b0da884ee5/img/categories/kitchen_m.png" class="ml-1" height="30" width="50"></th>
      <th class="tb-text">Kitchen</th>
  </tr>
</table>
</a>
</li>
<li><a href="#">
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
        <div class="col-md-12 ">
      		<div class="container-fluid">

<div class="codepen-container">
  <div class="content-container">
    <div class="left-container">
      <div class="triangle-topleft">
        <div class="back-arrow" id="buy-toaster"></div>
      </div>
      <div class="product-image--container">
        <img class="product-image--featured" id="featured" src="{{asset('assets/front/images/1.jpg')}}" alt="toaster"/>
        <ul class="product-image--list">
          <li class="item-selected"><img src="{{asset('assets/front/images/1.jpg')}}" class="product-image--item"/></li>
          <li><img src="{{asset('assets/front/images/2.jpg')}}" class="product-image--item"/></li>
          <li><img src="{{asset('assets/front/images/3.jpg')}}" class="product-image--item"/></li>
          <li><img src="{{asset('assets/front/images/4.jpg')}}" class="product-image--item"/></li>
          <li><img src="{{asset('assets/front/images/5.jpg')}}" class="product-image--item"/></li>
        </ul>
      </div>
    </div>
    <div class="right-container">
      <div>
        <h1 class="title">Black & Decker</h1>
        <h2 class="subtitle subtitle-container">TR1278B 2-Slice Toaster</h2>
        <div>
          <span class="rating">
            <input type="radio" class="rating-input" id="rating-input-1-5" name="rating-input-1"/>
            <label for="rating-input-1-5" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-4" name="rating-input-1"/>
            <label for="rating-input-1-4" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-3" name="rating-input-1"/>
            <label for="rating-input-1-3" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-2" name="rating-input-1"/>
            <label for="rating-input-1-2" class="rating-star"></label>
            <input type="radio" class="rating-input"
                    id="rating-input-1-1" name="rating-input-1"/>
            <label for="rating-input-1-1" class="rating-star"></label>
          </span>
          <span>|</span>
          <span>
            <a href="#" class="reviews">
              232 customer reviews
            </a>
          </span>
        </div>
      </div>
      <span>
        <p>Price: 
          <span class="emphasize">$19.99</span>
        </p>
        <div class="tm-size-color-single">
        <label for="quantity">Quantity:</label>
        <select name="quantity" class="select-dropdown">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>
        </div>
      </span>
      <div>
        <h2 class="title">Product Description</h2>
        <div class="tm-size-color-single">
            <label>Size</label>
				<select name="product-size">
                    <option value="1">XXL</option>
                    <option value="2">XL</option>
                    <option value="3">L</option>
                    <option value="4">M</option>
                    <option value="5">S</option>
                </select>
        </div>
        <div class="tm-size-color-single">
             <label>Color</label>
                <select name="product-color">
                    <option value="1">White</option>
                    <option value="2">BLack</option>
                    <option value="3">Green</option>
                    <option value="4">Yellow</option>
                    <option value="5">Blue</option>
                    <option value="6">Gray</option>
                </select>
        </div>
        <p>
          This Black & Decker toaster allows selection 
of the perfect toast shade and centers bread for even 
toasting results. It has easy crumb removal with the 
drop down crumb tray.
        </p>
      </div>
      <div>
        <a href="/cart" class="my-btn flex-btn">
			 <span class="btn-text" >Buy</span>
        </a>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	$('.product-image--list li').hover(function() {
  var url = $(this).children('img').attr('src');
  $('.item-selected').removeClass('item-selected');
  $(this).addClass('item-selected');
  $('#featured').attr('src', url);
});

$('#buy-toaster').click(function() {
  alert("BUY ME PLS!");
});
</script>


			</div>
		</div>

</div>
</div>
</div>

@endsection
