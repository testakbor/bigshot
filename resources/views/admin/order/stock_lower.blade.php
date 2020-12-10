@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <div class="row mb-2">
        <div class="col-sm-6">
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Lower Stock</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
    <div class="s002">
      <form method="post" action="{{route('stock.sku.search.lower')}}">
        @csrf
        <fieldset>
          <legend class="text-center">Lower Stock List</legend>
        </fieldset>
       
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
                  <th class="right">Categories</th>
                  <th class="center">Quantity</th>
                  <th class="center">Alert Quantity</th>
                  <th class="right">Cost</th>
                  <th class="right">Sale Price</th>
                  <th class="right">Status</th>
                  <th class="right">Action</th>
                </tr>
              </thead>
              <tbody>
               @php $qty=0; $qtyy=0; $qtyy_low=0; $low_stock_qty=0; $img=''; $imgg=''; $default_alert=0; $low_alert=0;  $stock_alert=0; $sku=0; $skuu=0; $cost=0; $costt=0; $sprice=0; $spprice=0; @endphp
                @foreach($products as $item)
                    @foreach($item->productMeta as $meta)
                        @if($meta->meta_key=='alert_qty')  @php $default_alert=$meta->meta_value; @endphp @endif
                        @if($meta->meta_key=='attribute_low_stock')  @php $low_alert=$meta->meta_value; @endphp @endif
                        @if($meta->meta_key=='attached_file')
                        @php $img=$meta->meta_value; @endphp
                        @endif
                        @if($meta->meta_key=='_sku')
                        @php $sku=$meta->meta_value; @endphp
                        @endif
                        @if($meta->meta_key=='default_qty')
                       @php $qty=$meta->meta_value; @endphp
                      @endif
                       @if($meta->meta_key=='alert_qty')
                        @php $low_stock_qty=$meta->meta_value; @endphp
                        @endif
                          @if($meta->meta_key=='product_stock')
                        @php $cost=$meta->meta_value; @endphp
                        @endif
                         @if($meta->meta_key=='sale_price')
                      @php $price=$meta->meta_value; @endphp
                      @endif
                    @endforeach 

                       @php 
                       $d_data=DB::table('postmeta')
                      ->where('post_id',$item->ID) 
                      ->where('meta_key','default_qty') 
                      ->where('meta_value','<=',$default_alert) 
                      ->select('post_id')
                      ->get();
                      @endphp

                
                      @foreach($d_data as $d_item)
                               <tr>
                                <td class="center"><img width="50px" height="50px" src="{{asset('backend/products/'.$img)}}"></br> {{ $sku ? $sku : 'No SKU Found' }}</td>
                                <td class="left strong">{{$item->post_title}}</td>
                                <td class="left">@php $category=DB::table('term_relationships')
                                ->where('object_id',$item->ID)
                                ->where('taxonomy','product_cat')
                                ->join('term_taxonomy','term_relationships.term_taxonomy_id','=','term_taxonomy.term_taxonomy_id')
                                ->join('terms','terms.term_id','=','term_taxonomy.term_id')
                                ->select('terms.name as cat_name')
                                ->first(); @endphp @if(isset($category)) {{$category->cat_name}} @else @php $category=''; @endphp @endif</td>
                                <td class="right">{{$qty}}</td>
                                <td class="right">{{$low_stock_qty}}</td>
                                <td class="right">{{number_format($cost)}} tk</td>
                                <td class="right">{{number_format($price)}} tk</td>
                                <td class="right">@if($qty>0) In Stock @else Out of stock @endif</td>
                                <td class="right">
                                 <i class="fas fa-print"><a href="{{route('stock.print.sticker',$item->ID)}}">Print</a></i><br>
                                 <i class="fas fa-edit"><a href="{{route('product.edit',$item->ID)}}">Edit</a></i><br>
                                </td>
                              </tr>
                      @endforeach


                      @php 
                       $at_data=DB::table('posts')
                      ->where('post_parent',$item->ID) 
                      ->where('meta_key','attribute_low_stock') 
                      ->join('postmeta','postmeta.post_id','=','posts.ID')
                      ->select('post_id','meta_value')
                      ->first();
                      @endphp
                    
                      @if(isset($at_data)) 
                       @php 
                       $stock_data=DB::table('posts')
                      ->where('post_parent',$item->ID) 
                      ->where('meta_key','attribute_stock') 
                      ->where('meta_value','<=',$at_data->meta_value) 
                      ->join('postmeta','postmeta.post_id','=','posts.ID')
                      ->select('post_id','meta_value','post_parent')
                      ->get();
                      @endphp





                       @foreach($stock_data as $data)
                           @php 
                            $imgg=DB::table('postmeta')->where('post_id',$data->post_parent)->where('meta_key','attached_file')->first();
                            $skuu=DB::table('postmeta')->where('post_id',$data->post_parent)->where('meta_key','_sku')->first();
                            $qtyy=DB::table('postmeta')->where('post_id',$data->post_id)->where('meta_key','attribute_stock')->first();
                            $qtyy_low=DB::table('postmeta')->where('post_id',$data->post_id)->where('meta_key','attribute_low_stock')->first();
                            $costt=DB::table('postmeta')->where('post_id',$data->post_parent)->where('meta_key','product_stock')->first();
                            $spprice=DB::table('postmeta')->where('post_id',$data->post_parent)->where('meta_key','sale_price')->first();
                            $lists=DB::table('postmeta')->where('post_id',$data->post_id)->where('meta_key','attribute')->get();
                           @endphp
                           <tr>
                                <td class="center"><img width="50px" height="50px" src="{{asset('backend/products/'.$imgg->meta_value)}}"></br> {{$skuu->meta_value}}</td>
                                <td class="left strong">
                                {{$item->post_title}}
                                <table class="table table-responsive">
                                  <tbody>
                                    @php $i=0; @endphp 
                                    @foreach($lists as $a) 
                                      @php 
                                      $i++;
                                      $attribute=json_decode($a->meta_value);
                                      @endphp
                                          <tr>
                                            <td>
                                              @foreach($attribute as $att)
                                              <b> {{$att->taxonomy}}</b> :
                                              {{$att->term}}     
                                              @endforeach
                                          </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                  </table>
                                </td>
                                <td class="left">
                                    @php $category=DB::table('term_relationships')
                                ->where('object_id',$data->post_parent)
                                ->where('taxonomy','product_cat')
                                ->join('term_taxonomy','term_relationships.term_taxonomy_id','=','term_taxonomy.term_taxonomy_id')
                                ->join('terms','terms.term_id','=','term_taxonomy.term_id')
                                ->select('terms.name as cat_name')
                                ->first(); @endphp @if(isset($category)) {{$category->cat_name}} @else @php $category=''; @endphp @endif
                                </td>
                                <td class="right">{{$qtyy->meta_value}}</td>
                                <td class="right">{{$qtyy_low->meta_value}}</td>
                                <td class="right">{{number_format($costt->meta_value)}} tk</td>
                                <td class="right">{{number_format($spprice->meta_value)}} tk</td>
                                <td class="right">@if($qtyy->meta_value>0) In Stock @else Out of stock @endif</td>
                                <td class="right">
                                  <i class="fas fa-print"><a href="{{route('stock.print.sticker',$data->post_parent)}}">Print</a></i><br>
                                 <i class="fas fa-edit"><a href="{{route('product.edit',$data->post_parent)}}">Edit</a></i><br>
                                </td>
                              </tr>
                        @endforeach
                     @endif


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
    <!-- <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="box bg-primary">
            <h3 class="text-center">1</h3>
            <p class="lead text-center font-weight-bold">Total Stock </p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="box bg-success">
            <h3 class="text-center">1</h3>
            <p class="lead text-center font-weight-bold">Total Cost</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="box bg-info">
            <h3 class="text-center">1</h3>
            <p class="lead text-center font-weight-bold">Total Sell Price</p>
          </div>
        </div>
      </div>
    </div> -->
  </section>
</div>
@endsection
