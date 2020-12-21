<!DOCTYPE html>
<html>
	<head>
		<title>Page Title</title>
		<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
         <meta content="utf-8" http-equiv="encoding">
		 <style>
		  .info{
		    border:1px solid #000000;
			width:400px;
		    height:300px;
		  }
		 </style>
   </head>
   @php $first_name=''; $address=''; $mobile=''; @endphp
    @foreach($customer_info as $info) 
     @if($info->meta_key=='first_name')  @php $first_name=$info->meta_value; @endphp @endif
     @if($info->meta_key=='address_one')  @php $address=$info->meta_value; @endphp @endif
     @if($info->meta_key=='phone')  @php $mobile=$info->meta_value; @endphp @endif
    @endforeach

        <body>
		     <div class="info">
			     <h3 style="text-align:center">BiGshot</h3>
			     <ul style="float:left;">
				     <li style="text-decoration:underline;list-style:none">
				       Shipping Address
					    <li style="list-style:none">
					      {{$first_name}}
						</li>
						<li style="list-style:none">
						{{$address}}
						</li>
						<li style="list-style:none">
							M: {{$mobile}}
						</li>
					   </p>
				    </li>
				 </ul>
				  <ul style="float:right;padding-right: 10px ">
				     <li style="list-style:none">
				       Total Quantity: {{$total_qty}}
				    </li>
					<li style="list-style:none">
					  Total Due: {{number_format($total_due)}} tk
					</li>
				 </ul>
				 
        <p style="margin-top: 200px;text-align:center;padding-bottom:15px 0;">
            <?php echo '<img src="data:image/png;base64,' . DNS1D::getBarcodePNG($id, 'C39+',3,33,array(1,1,1)) . '" alt="barcode"   />'; ?>
        </p>
			 </div>
		 </body>
	</html>
