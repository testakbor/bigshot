@extends('front.layouts.front_master')
@section('content')
<style>
    table tr td{
        font-size: 0.8em;
    }
    .table td, .table th{
        padding: 10px 5px
    }
    ::placeholder{
        font-size: 12px;
    }
    @media (max-width: 767px) {
    .productChanQty{
        padding: 0px;
        min-width: 20px;
    }
}
</style>
<div class="container p-0">
    @include('admin.includes.messages')
    <h4 class="text-center">Select item you want to cancel or return</h4>

    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr style="background:#e7e7e7">
                    <td>Order placed
                        {{date('d-m-Y',strtotime($order->post_date))}}</td>
                    <td>{{$order->post_status}}
                        {{date('d-m-Y',strtotime($order->post_modified))}}
                    </td>
                 
                    <td></td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                @php $qty=0; $att=0; $id=0; $subtotal=0; $all_qty_cancel=0; @endphp
                @foreach($order_item as $item)
                @foreach($item->orderMeta as $value)
                @if($value->meta_key=='_qty') @php $qty=$value->meta_value; @endphp @endif
                @if($value->meta_key=='attribute_parent') @php $att=$value->meta_value; @endphp @endif
                @if($value->meta_key=='_product_id')@php $id=$value->meta_value;@endphp @endif
                @if($value->meta_key=='_line_subtotal')@php $subtotal=$value->meta_value;@endphp @endif
                @endforeach
                <tr>
                    <td style="border:none">
                        @php $product_img=DB::table('postmeta')->where('post_id',$id)->where('meta_key','attached_file')->first(); @endphp
                        @php $product_sku=DB::table('postmeta')->where('post_id',$id)->where('meta_key','_sku')->first(); @endphp
                          @php $product_name=DB::table('posts')->where('ID',$id)->select('post_title')->first(); @endphp
                        {{$product_name->post_title}}  <br>
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$product_img->meta_value)}}"></br> 
                        Sku:{{$product_sku->meta_value}}

                        <table class="table">
                          <tbody>
                             @php 
                                $list_att=DB::table('postmeta')->where('post_id',$att)
                                ->where('meta_key','attribute')->get(); 
                             @endphp
                             @foreach($list_att as $a)
                              @php $data_att=json_decode($a->meta_value); @endphp 
                                  @foreach($data_att as $da)
                                    <tr>
                                      <td>{{strtoupper($da->taxonomy)}}</td>
                                      <td>{{strtoupper($da->term)}}</td>
                                    </tr>
                                @endforeach 
                             @endforeach 
                          </tbody>
                        </table>
                    </td>
                    <td>
                       @php 
                       $cancel_qty=DB::table('order_itemmeta')
                       ->where('order_item_id',$item->order_item_id)
                       ->where('meta_key','cancel_quantity')
                       ->sum('meta_value');
                        @endphp
                        Order Quantity: {{$acq=$qty-$cancel_qty}} Pc's 
                        @php $all_qty_cancel+=$acq; @endphp
                    </td>
               <form method="post" action="{{route('customer_order_cancel_item')}}">
                 @csrf 
                <td> 
                    @if($acq>0)
                    <select name="request_qty" id="request_qty" class="form-control productChanQty">
                        @for($i=1;$i<=$acq;$i++)
                        <option value="{{$i}}" class="p-0">{{$i}}</option>
                        @endfor
                    </select>
                    <input type="hidden" class="form-control" name="ac_qty" value="{{$qty}}">
                    <input type="hidden" class="form-control" name="cancel_order_id" value="{{$item->order_id}}">
                    <input type="hidden" class="form-control" name="cancel_item_id" value="{{$item->order_item_id}}">
                    <input type="hidden" class="form-control" name="product_id" value="{{$id}}">
                    <input type="hidden" class="form-control" name="att_parent" value="{{$att}}">
                </td>
                <td>    
                 <button onclick="return confirm('Are you sure want to cancel this item??')" class="btn btn-danger btn-sm"><span style="color:white"> <i class="fa fa-times"></i> </span></button>
                </td>
                @else 
                Cancelled
                @endif
                <input type="hidden" name="stock_order_qty" value="{{$all_qty_cancel}}">
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