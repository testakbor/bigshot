@extends('front.layouts.front_master')
@section('content')

<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
        <div class="col-md-12 ">
            <div class="container-fluid mt-2">
                <div class="container">
                    @include('admin.includes.messages')
                    <article class="card">
                        <header class="card-header text-center"><b>Select item you want to cancel or return</b></header>
                        <div class="card-body">

                            <form method="post" action="{{route('customer_order_cancel_item')}}">
                                @csrf
                                <table class="table" style="border: 1px solid #000000;">
                                    <thead>
                                        <tr style="background:#e7e7e7">
                                            <th>Order placed
                                                {{date('d-m-Y',strtotime($order->post_date))}}</th>
                                            <th>{{$order->post_status}}
                                                {{date('d-m-Y',strtotime($order->post_modified))}}
                                            </th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $qty=0; $id=0; $subtotal=0; @endphp
                                        @foreach($order_item as $item)
                                        @foreach($item->orderMeta as $value)
                                        @if($value->meta_key=='_qty') @php $qty=$value->meta_value; @endphp @endif
                                        @if($value->meta_key=='_product_id')@php $id=$value->meta_value;@endphp @endif
                                        @if($value->meta_key=='_line_subtotal')@php $subtotal=$value->meta_value;@endphp @endif
                                        @endforeach
                                        <tr>
                                            <td style="border:none">
                                                @php $product_img=DB::table('postmeta')->where('post_id',$id)->where('meta_key','attached_file')->first(); @endphp
                                                @php $product_sku=DB::table('postmeta')->where('post_id',$id)->where('meta_key','_sku')->first(); @endphp
                                                <img width="50px" height="50px" src="{{asset('backend/products/'.$product_img->meta_value)}}">
                                                Sku:{{$product_sku->meta_value}}
                                            </td>
                                            <td>
                                                @php $product_name=DB::table('posts')->where('ID',$id)->select('post_title')->first(); @endphp
                                                {{$product_name->post_title}}
                                            </td>
                                            <td>
                                                {{$qty}} Qty
                                                @php $product_status=DB::table('order_itemmeta')->where(['order_item_id'=>$item->order_item_id,'meta_key'=>'product_status'])->first(); @endphp
                                                @if(isset($product_status)) @php $status=$product_status->meta_value; @endphp @else @php $status=''; @endphp {{$status}} @endif
                                                @if($status=='cancel')
                                                @php $id=0; $order_id=0;$item_id=0;$subtotal=0; @endphp
                                                @else
                                                @php $id=$id; $order_id=$order->ID;$item_id=$item->order_item_id;$subtotal=$subtotal; @endphp
                                                @endif
                                                <input type="hidden" name="product_id[]" value="{{$id}}">
                                                <input type="hidden" name="order_id" value="{{$order_id}}">
                                                <input type="hidden" name="order_item_id[]" value="{{$item_id}}">
                                                <input type="hidden" name="total[]" value="{{$subtotal}}">
                                                <input type="hidden" name="default_order_id" value="{{$order->ID}}">
                                            </td>
                                            <td>
                                                @if($status=='cancel')
                                                Cancelled
                                                @else
                                                <a onclick="return confirm('Are you sure want to cancel this item??')" class="btn btn-danger btn-sm" href="{{route('customer_single_item_cancel',$item->order_item_id)}}"><span style="color:white">Cancel</span></a>
                                                @endif
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                @if($order->post_content=='')
                                <div class="col-md-12 text-center">
                                    <label>Reason for return/cancel</label>
                                    <textarea class="form-control" name="comment" cols="5" rows="5" required></textarea>
                                    <button onclick="return confirm('Are you sure want to cancel all item??')" type="submit" class="btn btn-primary">Full Order Cancel</button>
                                </div>
                                @endif 
                            </form>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

@endsection