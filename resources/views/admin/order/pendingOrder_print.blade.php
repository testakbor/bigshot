<!DOCTYPE html>
<html>

<head>
  <style>
    table {
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }

    td,
    th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even) {
      background-color: #dddddd;
    }
  </style>
</head>

<body>


  <h1>Company Name : Bigshot</h1>
  <p>Company Email: Demo@email.com</p>
  <p>Company Address : Demo Address</p>
  <table class="table table-striped">
    <thead>
      <tr>
        <th class="center">Oder Id</th>
        <th>Name</th>
        <th>SKU</th>

        <!-- <th class="right">Color</th> -->
        <th class="center">Qty</th>
        <th class="right">Item</th>
        <th class="right">Address</th>
        <th class="right">Mobile</th>
        <th class="right">Amount</th>
        <th class="right">Status</th>
        <!-- <th class="right">Comments</th> -->
      </tr>
    </thead>

    <tbody>
      @php $grandTotal=0; $color_array=[]; $arributeArray=''; $sku=0; $color=''; $product_general_info=[]; $product_color_info=[]; $item_name=''; $product_name=[]; $product_id=0; $qty=0; $amount=0; $order_info=[]; $customer_first_name=''; $customer_last_name=''; $customer_address=''; $customer_mobile=''; $customer_info=[]; @endphp
      @foreach($orders as $order)
      @php
      $customer_info=DB::table('order_itemmeta')
      ->where('order_id',$order->ID)
      ->join('usermeta','usermeta.user_id','=','order_itemmeta.customer_id')
      ->select('usermeta.*')
      ->get();
      $order_info=DB::table('order_itemmeta')
      ->where('order_id',$order->ID)
      ->get();
      @endphp
      @foreach($customer_info as $user_info)
      @if($user_info->meta_key=='first_name') @php $customer_first_name=$user_info->meta_value; @endphp @endif
      @if($user_info->meta_key=='last_name') @php $customer_last_name=$user_info->meta_value; @endphp @endif
      @if($user_info->meta_key=='address_one') @php $customer_address=$user_info->meta_value; @endphp @endif
      @if($user_info->meta_key=='phone') @php $customer_mobile=$user_info->meta_value; @endphp @endif
      @endforeach

      @foreach($order_info as $orders_info)
      @if($orders_info->meta_key=='_qty') @php $qty=$orders_info->meta_value; @endphp @endif
      @if($orders_info->meta_key=='_line_subtotal') @php $amount=$orders_info->meta_value; @endphp @endif
      @if($orders_info->meta_key=='_product_id') @php $product_id=$orders_info->meta_value; @endphp @endif
      @php $product_name=DB::table('posts')->where('ID',$product_id)->get(); @endphp
      @php
      $product_general_info=DB::SELECT("SELECT ID,meta_value
      FROM posts
      LEFT JOIN postmeta ON posts.ID=postmeta.post_id
      WHERE post_type='product'AND ID=$product_id AND postmeta.meta_key='_sku'");
      $product_color_info=DB::SELECT("SELECT ID,meta_value
      FROM posts
      LEFT JOIN postmeta ON posts.ID=postmeta.post_id
      WHERE post_type='product'AND ID=$product_id AND postmeta.meta_key='default_attribute'");
      @endphp
      @endforeach

      @foreach($product_name as $product_names)
      @php $item_name=$product_names->post_title; @endphp
      @endforeach

      @foreach($product_general_info as $product_general_infos)
      @php $sku=$product_general_infos->meta_value; @endphp
      @endforeach

      @foreach($product_color_info as $product_color_infos)
      @php $arributeArray=$product_color_infos->meta_value; @endphp
      @endforeach
      <tr>
        <td class="center">{{$order->ID}}</td>
        <td class="left strong">{{$customer_first_name}} {{$customer_last_name}}</td>
        <td class="left">
          <table>
            <tr>
              <td>{{$sku}}</td>
            </tr>

          </table>
        </td>

        <!-- <td class="right">
                    <table>

                      <tr>
                        <td></td>
                      </tr>

                    </table>
                  </td> -->
        <td class="center">
          <table>

            <tr>
              <td>{{$qty}}</td>
            </tr>

          </table>
        </td>
        <td class="right">
          <table>

            <tr>
              <td>{{$item_name}}</td>
            </tr>

          </table>
        </td>
        <td class="right">{{$customer_address}}</td>
        <td class="right">{{$customer_mobile}}</td>
        <td class="right">{{$sub=$amount}}</td>
        <td class="right">Pending</td>
        <!-- <td class="right">hello</td> -->
      </tr>
      @php
      $grandTotal += $sub;
      @endphp
      @endforeach



    </tbody>
    <tfoot>
      <tr>
        <td>Total</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>{{ $grandTotal}}</td>
        <td></td>
      </tr>
    </tfoot>
  </table>
</body>

</html>