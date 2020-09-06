@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;" id="app">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Edit Order</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Edit Order</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <form action="{{route('product.store')}}" method="POST" enctype="multipart/form-data">
        {{ csrf_field() }}
        <div class="row">      
          <div class="col-md-9">
           <div class="card card-default">
            <div class="card-header">
              <h3 class="card-title" style="width: 100%">Order #2005 details </h3>
              
              <h3 class="card-title">Payment via Cash on delivery. Customer IP: 103.150.57.30</h3>
              
            </div>
            <div class="card-body d-flex justify-content-between flex-row text-center" style="display: block;">
              <div class="genarel">
                <div class="font-weight-bold">Genarel</div>
                <div>
                  <form>
                    <div class="form-group">
                      <label for="exampleInputEmail1">Email address</label>
                      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1">Password</label>
                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                    </div>
                    <div class="form-check">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                      <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </form>
                </div>            
              </div>
              <div>
                <div class="font-weight-bold">Billing</div>
              </div>
              <div>              
               <div class="font-weight-bold">Shipping</div>
             </div>

           </div>
           <div class="card-footer">
            <button type="submit" value="draft" name="dreft" class="btn btn-warning">Draft</button>
            <button type="submit" value="submit" name="submit" class="btn btn-primary">Publish</button>
          </div>
        </div>
      </div>

      <div class="col-md-3">
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Publish</h3>
            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body d-flex flex-row text-center" style="display: block;">
            <input type="text" style="width: 30px" name="day" id="" value="<?php echo date('d')?>" >
            <input type="text" style="width: 30px" name="month" id="" value="<?php echo date('m')?>" >
            <input type="text" style="width: 50px" name="year" id="" value="<?php echo date('Y')?>" >
            <input type="text" style="width: 30px" name="HH" id="" value="<?php echo date('H')?>" >
            <input type="text" style="width: 30px" name="min" id="" value="<?php echo date('i')?>" >

          </div>
          <div class="card-footer">
            <button type="submit" value="draft" name="dreft" class="btn btn-warning">Draft</button>
            <button type="submit" value="submit" name="submit" class="btn btn-primary">Publish</button>
          </div>
        </div>
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Product Category</h3>
            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body" style="display: block;height:250px;overflow-x:scroll">
           @for($i=1;$i <= 10 ; $i++)
           <div class="custom-control custom-checkbox">
            <input class="custom-control-input" name="category[]" type="checkbox" id="4" value="4">
            <label for="4" class="custom-control-label">category {{$i}}</label>
          </div>
          @endfor
        </div>
      </div>
      <div class="card card-default">
        <div class="card-header">
          <h3 class="card-title">Product Tags</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
            </button>
          </div>
        </div>
        <div class="card-body" style="display: block;height:250px;overflow-x:scroll">
         @for($i=1;$i <= 10 ; $i++)
         <div class="custom-control custom-checkbox">
          <input class="custom-control-input" name="tag[]" type="checkbox" id="{{$i}}" value="{{$i}}">
          <label for="{{$i}}" class="custom-control-label"> tag {{$i}}</label>
        </div>
        @endfor
      </div>
      <!-- /.card-body -->
    </div>
    {{-- brand --}}
    <div class="card card-default">
      <div class="card-header">
        <h3 class="card-title">Product Brand</h3>
        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
          </button>
        </div>
      </div>
      <div class="card-body" style="display: block;height:250px;overflow-x:scroll">
        @for($i=1;$i <= 10 ; $i++)
        <div class="custom-control custom-radio">
          <input class="custom-control-input" type="radio" id="{{$i}}" value="{{$i}}" name="product_brand">
          <label for="{{$i}}" class="custom-control-label"> {{$i}}</label>
        </div>
        @endfor
      </div>
    </div>
    {{-- product image --}}
    <div class="card card-default">
      <div class="card-header">
        <h3 class="card-title">Product Image</h3>
        <div class="card-tools">
          <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
          </button>
        </div>
      </div>
      <div class="card-body" style="display: block;">
       <input type="file" name="product_image" id="" class="form-control">
     </div>
   </div>
   {{-- product Gallary --}}
   <div class="card card-default">
    <div class="card-header">
      <h3 class="card-title">Product Gallery</h3>
      <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
        </button>
      </div>
    </div>
    <div class="card-body" style="display: block;">
      <input type="file" name="galleryImage[]" id="" class="form-control" multiple>
    </div>
  </div>
</div>

</div>
</form>
<!-- /.col -->
</div>


<!-- /.row -->
</div><!-- /.container-fluid -->
</section>
<!-- /.content -->
</div>
@endsection

@section('js')
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>

<script src="{{asset('assets/admin/js/tinymce.min.js')}}" referrerpolicy="origin"></script>  
<script type="text/javascript">
  tinymce.init({
    selector: 'textarea',
    height: 400,
    menubar: false,
    plugins: [
    'advlist autolink lists link image charmap print preview anchor',
    'searchreplace visualblocks code fullscreen',
    'insertdatetime media table paste code help wordcount'
    ],
    toolbar: 'undo redo | formatselect | ' +
    'bold italic backcolor | alignleft aligncenter ' +
    'alignright alignjustify | bullist numlist outdent indent | ' +
    'removeformat | help',
    content_css: '//www.tiny.cloud/css/codepen.min.css'
  });
</script>    
@endsection