
<!DOCTYPE html>
<html>
<head>
  <title>Product Sku</title>
</head>
<body>
      <div style="border:1px solid #000000;text-align:center;width:120">
        <h4>Big Shot</h4></br>
        <p> Price: {{number_format($price->meta_value)}}tk</br>
            {{$name->post_title}}</br>
            Colour-
            @foreach($arributeArray as $a)
                @if($a->taxonomy=='pa_color')
                 Color:{{$a->term}}
                @endif
            @endforeach
            </br>
            SKU-{{$sku->meta_value}}</br>
        </p>
        <div style="padding:10px 0"><?php echo '<img width="150px"  src="data:image/png;base64,' . DNS1D::getBarcodePNG($id, 'C39+',3,33,array(1,1,1)) . '" alt="barcode"   />'; ?></div>
      </div>
</body>
</html>
