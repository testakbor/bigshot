
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
                @foreach($shop_order as $key=>$order)
                <tr class="bg-light text-center">

                    <th>
                        Order placed: <br>
                        {{date('d-M-Y',strtotime($order->post_date))}}
                    </th>
                    <th>
                        Processing <br>
                        18-Nov-2020
                    </th>
                    <th>
                        <a title="view invoice" href="{{route('customer_ordere_cancel',$order->ID)}}">
                            Cancel <br>
                            Return
                        </a>
                    </th>
                    <th>
                        <a title="view invoice" href="{{route('customer_ordere_edit',$order->ID)}}"> Details</i></a>                      
                    </th>
                </tr>  
                @foreach($order->orderItem as $item)
                @foreach($item->orderMeta as $meta)
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
                        {{$qty}}
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