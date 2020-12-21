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
                  <th>Items</th>
                  <th class="center">Quantity</th>
                  <th class="center">Alert Quantity</th>
                  <th class="right">Action</th>
                </tr>
              </thead>
              <tbody>
                <!-- default product -->
              @foreach($d_pro as $dd) 
                @php $d_alert_qty=DB::table('postmeta')->where('post_id',$dd->ID)->where('meta_key','alert_qty')->first(); @endphp
                @if(isset($d_alert_qty)) @php $alert_default=$d_alert_qty->meta_value; @endphp @endif
                @php 
                $data_default=DB::table('postmeta')
                ->where('post_id',$dd->ID)->where('meta_key','default_qty')
                ->where('meta_value','<=',$alert_default)
                ->select('post_id')
                ->get();
                @endphp 
                  @foreach($data_default as $d)
                               <tr>
                                <td class="left strong">Demo {{$d->post_id}}</td>
                                <td class="left strong"></td>
                                <td class="left strong"></td>
                                <td class="left strong"></td>
                                </td>
                              </tr>
                  @endforeach 
              @endforeach
              <!-- default product -->


               <!-- attribute product -->
               @php $a_stock=''; $a_alert='';  @endphp
              @foreach($a_pro as $aa) 
                 @foreach($aa->productMeta as $meta)

                 @endforeach 
                  <tr>
                                <td class="left strong">1</td>
                                <td class="left strong"></td>
                                <td class="left strong"></td>
                                <td class="left strong"></td>
                                </td>
                              </tr>           
              @endforeach 
                             
              <!-- attribute product -->

                            
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
