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
                  <th class="center">Qty</th>
                  <th class="right">Amount</th>
                  <th class="right">Status</th>
                  <!-- <th class="right">Action</th> -->
                  </tr>
                </thead>
                <tbody>
                @php $total_parcel=0; $product=''; $qty=0; $subtotal=0; $grandTotal=0; $mobile_no=''; $address=''; $sku=''; $customer=''; $first_name=''; $last_name=''; @endphp
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
                      <td class="right">
                            <table style="width:100%">
                              @foreach($item->orderItem as $meta)
                              <tr>
                                <td>{{$meta->order_item_name}}</td>
                              </tr>
                              @php $total_parcel++; @endphp
                              @endforeach
                            </table>
                      </td>
                      <td class="center">
                             <table style="width:100%">
                              @foreach($item->orderItem as $meta)
                              @foreach($meta->orderMeta as $value)
                                 @if($value->meta_key=='_qty')
                                    @php $qty=$value->meta_value; @endphp
                                  @endif 
                               @endforeach
                              <tr>
                                <td>{{$qty}}</td>
                              </tr>
                              @endforeach
                            </table>
                      </td>
                      <td class="right">
                             <table style="width:100%">
                              @foreach($item->orderItem as $meta)
                              @foreach($meta->orderMeta as $value)
                                 @if($value->meta_key=='_line_subtotal')
                                    @php $subtotal=$value->meta_value; @endphp
                                  @endif 
                               @endforeach
                              <tr>
                                <td>{{$subtotal}}</td>
                              </tr>
                              @php $grandTotal+=$subtotal; @endphp
                              @endforeach
                            </table>
                      </td>
                      <td class="right">{{$item->post_status}}</td>
                      <!-- <td class="right"></td> -->
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
                  {{$total_parcel}}
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