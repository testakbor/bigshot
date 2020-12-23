@extends('front.layouts.front_master')
@section('content')
<style>
    #featured{
        height: 380px;
        width: 100%;
    }
</style>
@php
$rprice=0;
$sprice=0;
$qty=0;
$image='no-image.png';
foreach ($product->productMeta as $meta):
if($meta['meta_key']=='_regular_price'):
$rprice=$meta['meta_value'];
endif;
if($meta['meta_key']=='sale_price'):
$sprice=$meta['meta_value'];
endif;
if($meta['meta_key']=='default_qty'):
$qty=$meta['meta_value'];
endif;
if($meta['meta_key']=='default_attribute'):
$metavalue=json_decode($meta['meta_value']);
endif;
if($meta['meta_key']=='attached_file'):
$image=$meta['meta_value'];
endif;
endforeach;
@endphp
<div class="container p-0">
    @if(session('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong> {{ session('error') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
    @if(session('status_error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
    <strong> {{ session('status_error') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
    @if(session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong> {{ session('success') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
      @if(session('status_success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong> {{ session('status_success') }}</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    @endif
    <div class="d-flex flex-column mt-2 ">
        <div class="d-flex flex-column ">
            <div class="empyt text-center border-bottom border-dark pt-3 pb-3">{{$product->post_title}} </div>
            <div class="d-flex flex-row flex-wrap mt-2">
                <div id="im_gallary" class="d-flex flex-column col-md-1 col-2 pr-0 pl-0">
                    @foreach($gallery_images as $g)
                    <div class="mb-2">
                            <img onmouseover="changeImage('{{$g->meta_value}}')" onclick="changeImage('{{$g->meta_value}}')" class="img-fluid rounded" src="{{asset('backend/products/'.$g->meta_value)}}" style="height: 70px;width: 100%" alt="">
                    </div>
                    @endforeach
                </div>
                <div class="proImag col-md-7 col-10">
                    <img id="featured" src="{{asset('backend/products/'.$image)}}" class="rounded"
                         alt="Responsive image"> 
                </div>
                <div class="d-flex flex-column col-md-4 p-0 col-12">
                    <div class="pname"></div>
                    <div class="attri">
                    </div>
                    <div class="d-flex flex-row mb-2">
                           <div class="col-4">Price: </div>
                    
                        <div class="h5 font-weight-bold col-8">tk. {{number_format($sprice)}}</div>
                    </div>
                    <div class="qty">
                        <form class="" action="{{route('addCart')}}" method="POST">
                            @csrf
                            <div class="d-flex flex-row align-items-center">
                                <div class="col-4 ">Quantity: </div>
                                <div class="col-8 mt-2">
                                    <input type="number" step="1" min="1" max="" name="quantity" class="form-control" id="" value="1" autocomplete="off">
                                </div>
                            </div>


                           @if($attributes->count()>0)


                             <div class="mt-2">
                                <lebel for="">Select color</lebel>                          
                                <select name="" id="att_select" class="form-control" required>
                                    <option value="">Select</option>
                                    @foreach($attributes as $att)
                                      <option value="{{$att->id}}">{{$att->term}}</option>
                                    @endforeach
                                </select>
                             </div>
                          <div class="mt-2">
                               <div id="attribut-value"  style="display:none">
                                    <lebel for="">Select Size</lebel> 
                                    <select name="" id="att_value" class="form-control"></select>
                                </div>
                           </div>
                            <input type="hidden" id="a_id" name="attribute_id" value="">
                            <input type="hidden" name="name" value="{{$product->post_title}}">
                            <input type="hidden" name="main_qty" value="{{$qty}}">
                            <input type="hidden" name="price" value="{{$sprice}}">
                               <input id="proid" type="hidden"  value="{{$product->ID}}">
                         
                            @else 
                            <input type="hidden" name="id" value="{{$product->ID}}">
                            <input type="hidden" name="name" value="{{$product->post_title}}">
                            <input type="hidden" name="main_qty" value="{{$qty}}">
                            <input type="hidden" name="price" value="{{$sprice}}">
                          @endif 





                            <div class="mt-3">
                                <button type="submit" id="final_cart_submit" class="btn btn-primary mb-2 btn-large btn-block"><i class="fas fa-shopping-bag"></i> Add To Cart</button>
                                <div class="text-center">
                                <a class="btn btn-success btn-large btn-block" href="{{url('/wishlist/product/'.$product->ID)}}">
                                   <i class="far fa-heart ml-2 h4"></i>
                                </a>
                                </div>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>

            <div>
                <div class="font-weight-bold mt-3 mb-3 h3">Description</div>
                <div>
                {!! $product->post_content !!}
                    <p>
                        <b>Delivery Guarantee</b> (Delivery Time and Delivery charge # Dhaka Metro 1-3
                        working
                        days, charge 60tk # Dhaka suburb area 2-5 working days, charge 100tk # Bangladesh
                        wide 2-5 working days,
                        120tk.)
                    </p>
            </div>
            </div>
            <div class="">
                <div class="font-weight-bold mt-3 mb-3 h3">Related Product</div>
                 <div class="row text-center text-lg-left">
                        @php
                        $rprice=0;
                        $sprice=0;
                        $img='';
                        @endphp
                        @foreach($product_related as $related)
                        @php
                        $product_info=DB::table('postmeta')->where('post_id',$related->ID)->get();
                        @endphp
                        @foreach($product_info as $info)
                        @if($info->meta_key=='regular_price') @php $rprice=$info->meta_value @endphp
                        @endif
                        @if($info->meta_key=='sale_price') @php $sprice=$info->meta_value @endphp
                        @endif
                        @if($info->meta_key=='attached_file')
                        @php $img=$info->meta_value @endphp
                        @endif
                        @endforeach
                        <div class="col-lg-3 col-md-4 col-6 mt-3">
                            <a href="{{url('product/'.$related->ID.'/'.urlencode($related->post_title))}}"
                               class="d-block mb-4 h-100 text-decoration-none">
                                <div class="card">
                                    <img src="{{asset('backend/products/'.$img)}}"
                                         class="img-fluid">
                                    <div class="text-center">
                                        <div class=" font-weight-bold">{{$related->post_title}}</div>
                                        <div class="">@if($rprice)
                                            <del style="color:red">৳{{$rprice}}</del>@endif
                                            <span style="color:#000000"> ৳{{$sprice}}</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        @endforeach
                    </div>
            </div>

        </div>
        </div>
        
    </div>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"
                    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
 </script>
  <script>
     function changeImage(imgName) {
        image = document.getElementById('im_gallary');
        var s=image.src = imgName;
        var path="{{asset('/backend/products/')}}"+"/"+s;
        var image1 = document.getElementById('featured');
          if (image1.src.match(path)) {
                image1.src = ss;
            }
            else {
                image1.src = path;
            }
     }



 $("#att_select").on('change', function() {
      var id = $("#att_select").val();
      var proid = $("#proid").val();
      $.ajax({
        type: "GET",
        url: "{{url('att')}}" + "/" + id+"/"+proid,
        dataType: "json",
        success: function(response) {
            if (response!=0){
                 $('#attribut-value').show();
                var schema_one = '';
                    schema_one +='<option>Select</option>'; 
                $.each(response, function(i, item) { 
                    schema_one += '<option value="' + item.term_id+ '">' + item.term + '</option>';
                    document.getElementById('a_id').value=item.product_parent
                });
                $('#att_value').html(schema_one);

            }else{
           var id = $("#att_select").val();
            var proids = $("#proid").val();
            $.ajax({
                    type: "GET",
                    url: "{{url('only')}}" + "/" + id+"/"+proids,
                    dataType: "json",
                    success: function(response) {
                    var schema_one = '';
                    $.each(response, function(i, item) {
                        document.getElementById('a_id').value=item.product_parent 
                    });
                    },
                    error: function(response) {
                    console.log(response);
                    }
                })
            }
        },
        error: function(response) {
          console.log(response);
        }
      })
    });


     $("#att_value").on('change', function() {
      var id = $("#att_value").val();
            var proidd = $("#proid").val();
      $.ajax({
        type: "GET",
        url: "{{url('atts')}}" + "/" + id+"/"+proidd,
        dataType: "json",
        success: function(response) {
          var schema_one = '';
          $.each(response, function(i, item) {
            document.getElementById('a_id').value=item.product_parent 
          });
        },
        error: function(response) {
          console.log(response);
        }
      })
    });


   


  </script>
@endsection