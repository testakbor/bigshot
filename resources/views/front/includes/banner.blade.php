	<div class="banner">
        @if(isset($banner))
        @if($banner->meta_key=='banner_image') @php $img=$banner->meta_value; @endphp @endif
        <img src="{{asset('backend/banner/'.$img)}}" width="1267" class="img-responsive img-fluid" alt="Responsive image" width="1267">
        @endif
	 </div>