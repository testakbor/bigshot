@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add New Product</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Category List</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        @include('admin.includes.messages')
        <div class="row">
           
          <div class="col-md-9">
            
              <!-- /.card-header -->
              <div class="">
                <form action="">
                    <div class="form-group">
                    <input type="text" name="product_name" placeholder="Product Name" class="form-control">
                </div>
                <div class="form-group">
                    <label for="">Product Description</label>
                    <textarea name="" id="" cols="30" rows="10" class="form-control"></textarea>
                </div>
               
                <div class="row form-group">
                    <div class="col-md-3 ">
                        
                        <div class="nav flex-column nav-pills bg-white" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                          <a class="nav-link active show" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">General</a>
                          <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Inventory</a>
                          <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Shipping</a>
                          <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Attribute</a>
                        </div>
                      </div>

                     <div class="col-md-9 bg-white">
                        <div class="tab-content " id="v-pills-tabContent">
                            <div class="tab-pane fade active show" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                            <div class="col-md-12 mt-3">
                              <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Regular Price (৳ )</label>
                                <div class="col-sm-10">
                                  <input type="text" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Sale Price (৳ )</label>
                                <div class="col-sm-10">
                                  <input type="text" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>
                              </div>
                            </div>

                            </div>
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                              <div class="col-md-12 mt-3">
                                <div class="form-group row">
                                  <label for="inputEmail3" class="col-sm-2 col-form-label">Regular Price (৳ )</label>
                                  <div class="col-sm-10">
                                      <select name="" class="form-control" id="">
                                        <option value="instock">In Stock</option>
                                        <option value="outstock">Out of Stock</option>
                                      </select>
                                  </div>
                                </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                              <div class="form-group row mt-3">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Weight (kg)</label>
                                <div class="col-sm-10">
                                   <input type="text" name="" class="form-control" id="">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Dimensions (cm)</label>
                                <div class="col-sm-10 d-flex flex-row">
                                  <input type="text" name="" class="form-control" id="" placeholder="Length" style="width: 30%">
                                  <input type="text" name="" class="form-control" id="" placeholder="Width" style="width: 30%">
                                  <input type="text" name="" class="form-control" id="" placeholder="Height" style="width: 30%">
                                </div>
                              </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                              <div class="form-group row mt-3">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">Attribute</label>
                                <div class="col-sm-8">
                                  <select name="" id="" class="form-control">
                                    <option value="">vlaue</option>
                                  </select>
                                </div>
                                <button type="button" class="btn btn-info">Add </button>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="">Product short Description</label>
                    <textarea name="" id="" cols="30" rows="10" class="form-control"></textarea>
                </div>
                </form>
              </div>
            <!-- /.card -->        
          </div>
          <div class="col-md-3">
            <div class="card card-default">
                <div class="card-header">
                  <h3 class="card-title">Publish</h3>
  
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body" style="display: block;">
                  The body of the card
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <button type="submit" value="draft" class="btn btn-warning">Draft</button>
                    <button type="submit" value="submit" class="btn btn-primary">Publish</button>
                </div>
              </div>
            <div class="card card-default">
                <div class="card-header">
                  <h3 class="card-title">Product Category</h3>
  
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body" style="display: block;height:250px;overflow-x:scroll">
                 @foreach($categories as $category)
                 <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" id="{{$category->term_id}}" value="option1">
                    <label for="{{$category->term_id}}" class="custom-control-label"> {{$category->name}}</label>
                  </div>
                 @endforeach
                </div>
                <!-- /.card-body -->
              </div>
               {{-- product tags --}}
            <div class="card card-default">
                <div class="card-header">
                  <h3 class="card-title">Product Tags</h3>
  
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body" style="display: block;">
                 <input type="text" name="" id="" class="form-control" placeholder="Product Tags">
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
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body" style="display: block;height:250px;overflow-x:scroll">
                  @foreach ($brands as $brand)
                 
                <div class="custom-control custom-radio">
                    <input class="custom-control-input" type="radio" id="{{$brand->term_id}}" name="customRadio">
                    <label for="{{$brand->term_id}}" class="custom-control-label"> {{$brand->name}}</label>
                  </div>
                  @endforeach
                </div>
                <!-- /.card-body -->
              </div>
              {{-- product image --}}
            <div class="card card-default">
                <div class="card-header">
                  <h3 class="card-title">Product Image</h3>
  
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body" style="display: block;">
                 <input type="file" name="" id="" class="form-control">
                </div>
                <!-- /.card-body -->
              </div>
              {{-- product Gallary --}}
            <div class="card card-default">
                <div class="card-header">
                  <h3 class="card-title">Product Gallery</h3>
  
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                    </button>
                  </div>
                  <!-- /.card-tools -->
                </div>
                <!-- /.card-header -->
                <div class="card-body" style="display: block;">
                    <input type="file" name="" id="" class="form-control" multiple>
                </div>
                <!-- /.card-body -->
              </div>

          </div>
        

          </div>
          <!-- /.col -->
        </div>
      
      
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
@endsection
@section('js')
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