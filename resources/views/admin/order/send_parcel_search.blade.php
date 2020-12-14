@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Send Parcel List</li>
            </ol>
          </div>
        </div>
      </div>
      <div class="s002">
       <div class="d-flex font-weight-bold justify-content-center h2 mb-3">Search Send Parcel List</div>
      <div class="d-flex justify-content-center mb-3">
        <form class="form-inline" method="post" action="{{route('send.parcel.search')}}" >
          @csrf() 
          <div class="form-group mb-2">
            <label for="depart" class="mr-2">Order Id</label>
            <input required type="text" class="form-control" name="order_id" placeholder="Scanner or Order Id" />
          </div>

          <button type="submit" class="btn btn-primary mb-2">SEARCH</button>
        </form>
      </div>
    </div>
    </section>
    <section class="content">
      <div class="container">
        <div class="card">
          <div class="card-body">
              <form method="post" action="{{route('parcel_print')}}">
              @csrf 
            <div class="table-responsive-sm">
              <table class="table table-striped">
                <thead>
                  <tr>
                  <th class="center">Oder Id</th>
                  <th>Name</th>
                  <th>Address</th>
                  <th>Mobile</th>
                  <th class="right">Items</th>
                  <th class="right">Delivery Charge</th>
                  <th class="right">Amount</th>
                  <th class="right">Action</th>
                  </tr>
                </thead>
                <tbody>
                @php $tot_parcel=0; $to_amount_charge=0; $att=0; $q=0;$s=0; $att=0; $total_parcel=0; $product=''; $qty=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $first_name=''; $last_name=''; @endphp
                @foreach($orders as $item)
                @foreach($item->productMeta as $info) 
                     @if($info->meta_key=='phone')
                     @php $mobile_no=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='address_one')
                     @php $address=$info->meta_value; @endphp
                    @endif  
                      @if($info->meta_key=='first_name')
                     @php $first_name=$info->meta_value; @endphp
                    @endif 
                    @if($info->meta_key=='last_name')
                     @php $last_name=$info->meta_value; @endphp
                    @endif 
                @endforeach
                  <tr>
                      <td class="left">{{$item->ID}} <input type="hidden" name="order[]" value="{{$item->ID}}"></td>
                      <td class="left">{{$first_name}} {{$last_name}}</td>
                      <td class="left">{{$address}}</td>
                      <td class="left">{{$mobile_no}}</td>
                      <td class="left">
                      @foreach($item->orderItem as $meta)
                       <table style="width:100%">
                            <tr>
                              <th>Name</th>
                              <th>Attribute</th>
                              <th>Qty</th>
                              <th>Amount</th>
                            </tr>
                            <tr>
                              <td>{{$meta->order_item_name}}</td>
                              <td>
                                 @foreach($meta->orderMeta as $value)
                                        @if($value->meta_key=='attribute_parent')
                                          @php $att=$value->meta_value; @endphp
                                        @endif 
                                   @endforeach
                             @php 
                                $list_att=DB::table('postmeta')->where('post_id',$att)
                                ->where('meta_key','attribute')->get(); 
                             @endphp
                             @foreach($list_att as $a)
                              @php $data_att=json_decode($a->meta_value); @endphp 
                                  @foreach($data_att as $da)
                                      {{strtoupper($da->taxonomy)}} : {{strtoupper($da->term)}}
                                       </br>
                                @endforeach 
                             @endforeach 
                              </td>
                              <td>
                                   @foreach($meta->orderMeta as $value)
                                        @if($value->meta_key=='_qty')
                                          @php $q=$value->meta_value; @endphp
                                        @endif 

                                        @if($value->meta_key=='attribute_parent')
                                          @php $att=$value->meta_value; @endphp
                                        @endif 
                                
                                   @endforeach
                                 {{$q}} @php $tot_parcel+=$q; @endphp
                              </td>
                              <td>
                                 @foreach($meta->orderMeta as $value)
                                 @if($value->meta_key=='_line_subtotal')
                                    @php $s=$value->meta_value; @endphp
                                  @endif 
                                  
                               @endforeach
                                 {{number_format($s)}} 
                                @php $to_amount_charge+=$s; $grandTotal+=$s; @endphp
                              </td>
                            </tr>
                           
                          </table>
                      @endforeach

                      </td>

                      <td class="left">
                        @php $delivery=DB::table('order_itemmeta')->where('order_id',$item->ID)->where('meta_key','delivery_charge')->first(); @endphp @if(isset($delivery)) @php $charge=$delivery->meta_value; @endphp @else @php $charge=0; @endphp @endif {{$charge}}
                      </td>
                      <td class="left">{{$to_amount_charge+$charge}}</td>
                      <td class="right"><a onclick="return confirm('are you sure?')" class="btn btn-danger btn-sm" href="{{route('send.parcel.search.remove',$item->ID)}}"><i class="fa fa-times"></i> Remove from here<td></td>
                  </tr>
                  @endforeach 
                </tbody>
              </table>
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
          @if($orders->count()>0)
           <div class="col-md-3">
             <input type="text" class="form-control" name="delivery_company" placeholder="Delivery Company" autocomplete="off" required>
           </div>
          
              <div class="col-md-3">   
                <button class="btn btn-danger">            
                   {{$total_orders}}
                   Processing
                </button>
              </div>
              <div class="col-md-3">          
               <button class="btn btn-success">            
                  {{$grandTotal+$charge}}
                  Total Percel
                </button>
              </div>
              <div class="col-md-3">
                  <button onclick="return confirm('Do you want to Submit?')" class="btn btn-primary" type="Submit">Submit & Print</button>
              </div>
             @endif 
          </div>  
        </form>     
      </div>
    </section>
 </div>
@endsection
@section('js')
@endsection