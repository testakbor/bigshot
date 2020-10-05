<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        #invoice-POS {
            box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
            padding: 2mm;
            margin: 0 auto;
            width: 44mm;
            background: #FFF;

        }
    </style>
</head>

<body>
    <div id="invoice-POS">
        @php $price=0; $sku=0; $color=''; @endphp
        @foreach($product as $info)
        @if($info->meta_key=='sale_price') @php $price=$info->meta_value; @endphp @endif
        @if($info->meta_key=='_sku') @php $sku=$info->meta_value; @endphp @endif
        @endforeach

        <div class="col-md-12">
            <h4>Big Shot</h4>
            <p> Price: {{$price}}tk
                {{$category->cat_name}}</br>
                Colour- @foreach($arributeArray as $value)
                {{$value->term}}
                @endforeach</br>
                SKU-{{$sku}}</br>
            </p>
            <p class="ml-3"><?php echo '<img src="data:image/png;base64,' . DNS1D::getBarcodePNG($id, 'C39+', 3, 33, array(1, 1, 1)) . '" alt="barcode"   />'; ?></p>
        </div>

    </div>

</body>

</html>