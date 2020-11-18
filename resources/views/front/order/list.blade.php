
@extends('front.layouts.front_master')
@section('content')
<style>
    table tr td{
        font-size: 0.8em;
    }
</style>
<!-- Page Content  -->
<div class="container p-0">
    @include('admin.includes.messages')
    <h4 class="text-center">My Orders List</h4>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">           
            <tbody>
                @php $item_id=0; @endphp
                @foreach($shop_order as $key=>$order)
                <tr class="bg-light text-center">

                    <th>
                        Order placed: <br>
                        {{date('d-M-Y',strtotime($order->post_date))}}
                    </th>
                    <th>
                        {{$order->post_status}} <br>
                         {{date('d-M-Y',strtotime($order->post_modified))}}
                    </th>
                    <th>
                        @if($order->post_status=='delivered')
                        @else 
                          <a title="view invoice" href="{{route('customer_ordere_cancel',$order->ID)}}">
                            Cancel <br>
                            Return
                        </a>
                        @endif 
                    </th>
                    <th>
                        <a title="view invoice" href="{{route('customer_ordere_edit',$order->ID)}}"> Details</i></a>                      
                    </th>
                </tr>  
                @foreach($order->orderItem as $item)
                @foreach($item->orderMeta as $meta)
                @if($meta->order_item_id) @php $item_id=$meta->order_item_id; @endphp @endif
                @if($meta->meta_key=='_product_id')
                @php $id=$meta->meta_value; @endphp
                @endif
                @if($meta->meta_key=='_qty')
                @php $qty=$meta->meta_value; @endphp
                @endif
                @endforeach
                <tr class="text-center">
                    <td>
                        @php $product_img=DB::table('postmeta')->where('post_id',$id)->where('meta_key','attached_file')->first(); @endphp
                        <img width="50px" height="50px" src="{{asset('backend/products/'.$product_img->meta_value)}}">
                        <br>
                        @php $product_sku=DB::table('postmeta')->where('post_id',$id)->where('meta_key','_sku')->first(); @endphp
                         {{$product_sku->meta_value}}
                    </td>
                    <td>
                        {{$item->order_item_name}}
                    </td>
                    <td>
                         @php 
                         $cancel_qty=DB::table('order_itemmeta')
                         ->where('order_item_id',$item_id)
                         ->where('meta_key','cancel_quantity')
                         ->sum('meta_value');
                         @endphp
                        {{$qty-$cancel_qty}}
                    </td>
                    <td>
                    </td>
                </tr>
                @endforeach
                @endforeach
            </tbody>
        </table>
        {{$shop_order->links()}}
    </div>
</div>
@endsection