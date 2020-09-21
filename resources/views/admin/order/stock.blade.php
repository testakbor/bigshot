@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Stock</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form>
        <fieldset>
          <legend>Stock</legend>
        </fieldset>
        <div class="inner-form ml-5">
          
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="depart" type="date" placeholder="29 Aug 2018" />

          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="return" type="date" placeholder="30 Aug 2018" />
          </div>
        
          <div class="input-field fifth-wrap">
            <button class="btn-search" type="button">SEARCH</button>
          </div>
        </div>
      </form>
    </div>

       
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <div class="card">

          <div class="card-body">

            <div class="table-responsive-sm">
              <table class="table table-striped">
                <thead>
                  <tr>
                  <th>SKU</th>
                  <th>Items</th>
                  <!-- <th class="right">Categories</th> -->
                  <th class="center">Quantity</th>
                  <th class="right">Cost</th>
                  <th class="right">Sale Price</th>
                  <th class="right">Status</th>
                  <th class="right">Action</th>
                  </tr>
                </thead>

                <tbody>
                @php $qty=0; $i=0; $price=0; $sprice=0; $sku='';  $total_sell_price=0; $total_cost=0; @endphp
                @foreach($products as $item)
                  @php $product_info=DB::table('postmeta')->where('post_id',$item->ID)->get(); @endphp
                  @foreach($product_info as $info)
                     @if($info->meta_key=='qty')
                      @php $qty=$info->meta_value; @endphp 
                     @endif
                     @if($info->meta_key=='sale_price')
                      @php $price=$info->meta_value; @endphp 
                     @endif
                     @if($info->meta_key=='stock_status')
                      @php $status=$info->meta_value; @endphp 
                     @endif
                     @if($info->meta_key=='_sku')
                      @php $sku=$info->meta_value; @endphp 
                     @endif
                   @endforeach 
                      @if($qty>0)
                      @php $i++ @endphp
                      <tr>
                        <td class="center">{{$sku}}</td>
                        <td class="left strong">{{$item->post_title}}</td>
                        <!-- <td class="left">Women</td> -->
                        <td class="right">{{$qty}}</td>
                        <td class="right"> Tk {{$tot=$qty*$price}}</td>
                        <td class="right">Tk {{$price}}</td>
                        <td class="right">{{$status}}</td>
                        <td class="right">
                          <i class="fas fa-print"><a href="#">Print</a></i><br>
                          <i class="fas fa-edit"><a href="#">Edit</a></i><br>
                          <i class="fas fa-trash-alt"><a href="#">Delete</a></i><br>
                        </td>
                    </tr>
                     @php $total_cost+=$tot; $total_sell_price+=$price; @endphp
                   @endif 
                  @endforeach   
                </tbody>
              </table>
              {{$products->links()}}
            </div>

            <div class="row">
                <div class="col-lg-4 col-sm-5">

                </div>
            </div>

          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
           <div class="col-md-4">
                <div class="box bg-primary">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">{{$i}}</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Stock </p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-success">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">{{$total_cost}}</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Cost</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-info">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center">{{$total_sell_price}}</h3>
                  
                  <p class="lead text-center font-weight-bold">Total Sell Price</p>
                </div>
              </div>
        </div>       
            
      </div>
    </section>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
   
    <!-- /.content -->
 <!--  </div> -->
@endsection

@section('js')

@endsection