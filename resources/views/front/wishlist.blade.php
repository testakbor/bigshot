@extends('front.layouts.master')

@section('content')
    
        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">
        <div class="row">
          <div class="col-md-12">
          <div class="container-fluid">
           
<div class="shopping-cart">
      <!-- Title -->
      <div class="title">
        Shopping Bag
      </div>

      <!-- Product #1 -->
      <div class="item">
        <div class="buttons">
          <span class="delete-btn"></span>
          <span class="like-btn"></span>
        </div>

        <div class="image">
          <img src="https://designmodo.com/demo/shopping-cart/item-1.png" alt="" />
        </div>

        <div class="description">
          <span>Common Projects</span>
          <span>Bball High</span>
          <span>White</span>
        </div>

        <div class="quantity">
          <button class="plus-btn" type="button" name="button">
            <img src="https://designmodo.com/demo/shopping-cart/plus.svg" alt="" />
          </button>
          <input type="text" name="name" value="1">
          <button class="minus-btn" type="button" name="button">
            <img src="https://designmodo.com/demo/shopping-cart/minus.svg" alt="" />
          </button>
        </div>

        <div class="total-price">$549</div>
      </div>

      <!-- Product #2 -->
      <div class="item">
        <div class="buttons">
          <span class="delete-btn"></span>
          <span class="like-btn"></span>
        </div>

        <div class="image">
          <img src="https://designmodo.com/demo/shopping-cart/item-2.png" alt=""/>
        </div>

        <div class="description">
          <span>Maison Margiela</span>
          <span>Future Sneakers</span>
          <span>White</span>
        </div>

        <div class="quantity">
          <button class="plus-btn" type="button" name="button">
            <img src="https://designmodo.com/demo/shopping-cart/plus.svg" alt="" />
          </button>
          <input type="text" name="name" value="1">
          <button class="minus-btn" type="button" name="button">
            <img src="https://designmodo.com/demo/shopping-cart/minus.svg" alt="" />
          </button>
        </div>

        <div class="total-price">$870</div>
      </div>

      <!-- Product #3 -->
      <div class="item">
        <div class="buttons">
          <span class="delete-btn"></span>
          <span class="like-btn"></span>
        </div>

        <div class="image">
          <img src="https://designmodo.com/demo/shopping-cart/item-3.png" alt="" />
        </div>

        <div class="description">
          <span>Our Legacy</span>
          <span>Brushed Scarf</span>
          <span>Brown</span>
        </div>

        <div class="quantity">
          <button class="plus-btn" type="button" name="button">
            <img src="https://designmodo.com/demo/shopping-cart/plus.svg" alt="" />
          </button>
          <input type="text" name="name" value="1">
          <button class="minus-btn" type="button" name="button">
            <img src="https://designmodo.com/demo/shopping-cart/minus.svg" alt="" />
          </button>
        </div>

        <div class="total-price">$349</div>

      </div>
        <button type="button" class="btn btn-light ml-5 mt-5 mb-3" style="width: 118px;border: 1px solid skyblue;color: skyblue;background-color: white;font-weight: 600;"><a href="/cart">Add to Cart</a></button>
    </div>   

          </div>
          </div>

        </div>
      

        
      </div>
    </div>
@endsection
