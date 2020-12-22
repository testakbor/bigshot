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
                  <th class="center">Quantity</th>
                  <th class="center">Alert Quantity</th>
                  <!-- <th class="right">Action</th> -->
                </tr>
              </thead>
              <tbody>
                
              @foreach($d_pro as $dd) 
                @php $d_alert_qty=DB::table('postmeta')->where('post_id',$dd->ID)->where('meta_key','alert_qty')->first(); @endphp
                
                @php 
               

                $data_default=DB::table('postmeta')
                ->where('post_id',$dd->ID)
                ->where('meta_key','product_stock')
                ->where('meta_value','<=',$d_alert_qty->meta_value)                
                ->get();
             

                @endphp 
                  @foreach($data_default as $d)
                    @php

                    $d_all=DB::table('postmeta')->where('post_id',$d->post_id)->get();                   
               

                    foreach($d_all as $allInfo):
             
                    if($allInfo->meta_key=='_sku'):
                     $sku=$allInfo->meta_value;
                    endif; 
             
                    if($allInfo->meta_key=='product_stock'):
                     $product_stock=$allInfo->meta_value;
                    endif;
             
                    endforeach;
                    @endphp 
                    
                               <tr>
                                <td class="center">{{$sku}}</td>
                                <td class="left strong">{{$dd->post_title}}</td>
                                <td class="left strong">{{$product_stock}}</td>
                                <td class="left strong">{{$d_alert_qty->meta_value}}</td>
                                <td class="left strong"></td>
                                </td>
                              </tr>
                  @endforeach 
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
</div>
@endsection
