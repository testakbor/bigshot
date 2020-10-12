
<!DOCTYPE html>
<html>
<head>
    <style>
        ul,li{
            list-style: none;
        }
    </style>
</head>
<body>
  <div id="invoice-POS" style="border: 1px solid #000000;width:100%;height:300px;">
        <h2 style="text-align:center">BiGshot</h2>
       <div style="width:50%;float:left">
        <h4 style="margin-left:20px;">Shipping Address</h4>
        <ul>
         <li>{{$name->meta_value}}</li>
          <li>{{$address->meta_value}}</li>
            <li>Phone:{{$phone->meta_value}}</li>
         </ul>
       </div>
      <div style="width:50%;float:left">
         <ul>
             <li>Total Quantity: {{$total_qty}}</li>
            <li>Total Due: {{number_format($total_due)}} tk</li>
         </ul>
        <?php echo '<img src="data:image/png;base64,' . DNS1D::getBarcodePNG($order->ID, 'C39+',3,33,array(1,1,1)) . '" alt="barcode"   />'; ?>
      </div>
  </div>
</body>
</html>
