@extends('front.layouts.master')
@section('content')
<style type="text/css">
  		.ajax-load{
  			/* background-color: #e1e1e1; */
        /* left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        position: absolute;
        margin: auto;
        width: 50px;
        height: 50px; */
        padding: 10px 0px;
		    width: 100%;
  		}
  	</style>
<!-- Page Content  -->
<div id="content" class=" p-md-5">
  <div class="col-md-10 ">
    <div class="container-fluid">
      <section class="banner-img ml-5">
        @if(isset($banner))
        @if($banner->meta_key=='banner_image') @php $img=$banner->meta_value; @endphp @endif
        <img src="{{asset('backend/banner/'.$img)}}" width="1267" class="img-responsive img-fluid" alt="Responsive image">
        @endif
      <div  id="post-data">
		@include('front.product_ajax_data')
	    </div>
      </section>
    </div>
  </div>
  <div class="col-md-2 col-sm-12 mt-4 d-none d-lg-block" style="background-color: #fff;position: fixed;
right: 10px;top:96px;">
    <div class="img-box mt-3">
      <img src="{{asset('assets/front/images/offer.png')}}" height="200" width="210">
    </div>
    <p class="text-justify mt-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>
</div>
</div>
<div class="ajax-load text-center main-loader" style="display:none">
	<div class="loader">
    <img src="{{asset('img/loading.gif')}}" height="100" width="120">
  </div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript">
	var page = 1;
	$(window).scroll(function() {
	    if($(window).scrollTop() + $(window).height() >= $(document).height()) {
	        page++;
	        loadMoreData(page);
	    }
	});
	function loadMoreData(page){
	  $.ajax(
	        {
	            url: '?page=' + page,
	            type: "get",
	            beforeSend: function()
	            {
	                $('.ajax-load').show();
	            }
	        })
	        .done(function(data)
	        {
	            if(data.html == " "){
	                $('.ajax-load').html("No more records found");
	                return;
	            }
	            $('.ajax-load').show();
	            $("#post-data").append(data.html);
	        })
	        .fail(function(jqXHR, ajaxOptions, thrownError)
	        {
	              alert('server not responding...');
	        });
	}
</script>


@endsection