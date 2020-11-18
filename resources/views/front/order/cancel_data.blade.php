@extends('front.layouts.front_master')
@section('content')
  <div class="container">
      @include('admin.includes.messages')
        <h4 class="text-center">Select item you want to cancel or return</h4>

                   <div class="table-responsive">
                    <table class="table">
                                    <thead>
                                        <tr style="background:#e7e7e7">
                                            <th>Order placed
                                                {{date('d-m-Y',strtotime($order->post_date))}}</th>
                                            <th>{{$order->post_status}}
                                                {{date('d-m-Y',strtotime($order->post_modified))}}
                                            </th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $qty=0; $id=0; $subtotal=0; $cancel_qty=0; @endphp
                                        @foreach($order_item as $item)
                                        @foreach($item->orderMeta as $value)
                                        @if($value->meta_key=='_qty') @php $qty=$value->meta_value; @endphp @endif
                                        @if($value->meta_key=='cancel_quantity') @php $cancel_qty=$value->meta_value; @endphp @endif
                                        @if($value->meta_key=='_product_id')@php $id=$value->meta_value;@endphp @endif
                                        @if($value->meta_key=='_line_subtotal')@php $subtotal=$value->meta_value;@endphp @endif
                                        @endforeach
                                        <tr>
                                            <td style="border:none">
                                                @php $product_img=DB::table('postmeta')->where('post_id',$id)->where('meta_key','attached_file')->first(); @endphp
                                                @php $product_sku=DB::table('postmeta')->where('post_id',$id)->where('meta_key','_sku')->first(); @endphp
                                                <img width="50px" height="50px" src="{{asset('backend/products/'.$product_img->meta_value)}}"></br> 
                                                Sku:{{$product_sku->meta_value}}
                                            </td>
                                            <td>
                                                @php $product_name=DB::table('posts')->where('ID',$id)->select('post_title')->first(); @endphp
                                                {{$product_name->post_title}}
                                            </td>
                                            <td>
                                              Order Quantity: {{$qty}} Pc's
                                            </td>
                                             <form method="post" action="{{route('customer_order_cancel_item')}}">
                                                 @csrf 
                                             <td> 
                                               @php $total_qtyy=$qty-$cancel_qty; @endphp  
                                               @if($total_qtyy<0)
                                                    <input type="text" class="form-control" name="request_qty" required placeholder="Enter no of quantity" autocomplete="off">
                                                    <input type="hidden" class="form-control" name="ac_qty" value="{{$qty}}">
                                                    <input type="hidden" class="form-control" name="cancel_order_id" value="{{$item->order_id}}">
                                                    <input type="hidden" class="form-control" name="cancel_item_id" value="{{$item->order_item_id}}">
                                                    <input type="hidden" class="form-control" name="product_id" value="{{$id}}">
                                            </td>
                                            <td>
                                                <button onclick="return confirm('Are you sure want to cancel this item??')" class="btn btn-danger btn-sm"><span style="color:white">Cancel</span></button>
                                            </td>
                                               @else 
                                                 Cancelled
                                                @endif
                                                </form>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                             </div>


                             <form method="post" action="{{route('customer_order_cancel_item_full')}}">
                                 @csrf 
                                 <div class="form-group">
                                  <label>Reason for return/cancel</label>
                                  <textarea cols="5" rows="5" class="form-control" name="reason" autocomplete="off" required></textarea>
                                 </div>
                                        @php $quantity=0; $product_id=0; @endphp
                                        @foreach($order_item as $item)
                                        @foreach($item->orderMeta as $value)
                                          @if($value->meta_key=='_product_id')@php $product_id=$value->meta_value;@endphp @endif
                                          @if($value->meta_key=='_qty') @php $quantity=$value->meta_value; @endphp @endif
                                        @endforeach
                                           <input type="hidden" class="form-control" name="order_id" value="{{$item->order_id}}">
                                           <input type="hidden" class="form-control" name="item_id[]" value="{{$item->order_item_id}}">
                                           <input type="hidden" class="form-control" name="product_id[]" value="{{$product_id}}">
                                           <input type="hidden" class="form-control" name="pro_id[]" value="{{$product_id}}">
                                           <input type="hidden" class="form-control" name="quantity[]" value="{{$quantity}}">
                                        @endforeach
                                <button onclick="return confirm('Are you sure want to cancel full order??')" class="btn btn-danger btn-sm mb-3"><span style="color:white">Cancel Full Order</span></button>
                             </form>  
            </div>
@endsection