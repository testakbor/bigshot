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
              <li class="breadcrumb-item active">Top 10 Best Selling Items</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->

          <div class="s002">
      <form method="post" action="{{route('best.selling.search')}}">
       @csrf  
       <fieldset>
          <legend>Top 10 Best Selling Items List</legend>
        </fieldset>
        <div class="inner-form ml-5">
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="start" value="2020-10-12" id="depart" type="date" />
          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="end" value="2020-10-12" id="return" type="date" />
          </div>
          <div class="input-field fifth-wrap">
            <button type="submit" class="btn-search" type="button">SEARCH</button>
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
                  <th>#</th>
                  <th>SKU</th>
                  <th>Items</th>
                  <th class="right">Categories</th>
                  <th class="center">Quantity</th>
                  <th class="right">Cost</th>
                  <th class="right">Sale Price</th>
                </tr>
              </thead>
              <tbody>
                @foreach($order as $key=>$item)
                <tr>
                  <td class="center">{{++$key}}</td>
                  <td class="center">@php $sku=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','_sku')->first(); @endphp {{$sku->meta_value}}</td>
                  <td class="left strong">{{$item->order_item_name}}</td>
                  <td class="left">@php $category=DB::table('term_relationships')
                    ->where('object_id',$item->product_id)
                    ->where('taxonomy','product_cat')
                    ->join('term_taxonomy','term_relationships.term_taxonomy_id','=','term_taxonomy.term_taxonomy_id')
                    ->join('terms','terms.term_id','=','term_taxonomy.term_id')
                    ->select('terms.name as cat_name')
                    ->first(); @endphp @if(isset($category)) {{$category->cat_name}} @else @php $category=''; @endphp @endif</td>
                  <td class="right">{{$item->total_qty}}</td>
                  <td class="right">@php $cost=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','product_stock')->first(); @endphp {{$cost->meta_value}}tk</td>
                  <td class="right">@php $price=DB::table('postmeta')->where('post_id',$item->product_id)->where('meta_key','sale_price')->first(); @endphp {{$price->meta_value}}tk</td>
                </tr>   
               @endforeach
              </tbody>
            </table>
             </div> <div class="row">
              <div class="col-lg-4 col-sm-5">
              </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- /.row -->
</div><!-- /.container-fluid -->
<!-- /.content -->
  </div>
@endsection