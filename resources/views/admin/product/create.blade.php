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
                            <p>Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu deserunt excepteur ea incididunt minim occaecat.</p>
                            </div>
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <p>Culpa dolor voluptate do laboris laboris irure reprehenderit id incididunt duis pariatur mollit aute magna pariatur consectetur. Eu veniam duis non ut dolor deserunt commodo et minim in quis laboris ipsum velit id veniam. Quis ut consectetur adipisicing officia excepteur non sit. Ut et elit aliquip labore Lorem enim eu. Ullamco mollit occaecat dolore ipsum id officia mollit qui esse anim eiusmod do sint minim consectetur qui.</p>
                            </div>
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            <p>Fugiat id quis dolor culpa eiusmod anim velit excepteur proident dolor aute qui magna. Ad proident laboris ullamco esse anim Lorem Lorem veniam quis Lorem irure occaecat velit nostrud magna nulla. Velit et et proident Lorem do ea tempor officia dolor. Reprehenderit Lorem aliquip labore est magna commodo est ea veniam consectetur.</p>
                            </div>
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            <p>Eu dolore ea ullamco dolore Lorem id cupidatat excepteur reprehenderit consectetur elit id dolor proident in cupidatat officia. Voluptate excepteur commodo labore nisi cillum duis aliqua do. Aliqua amet qui mollit consectetur nulla mollit velit aliqua veniam nisi id do Lorem deserunt amet. Culpa ullamco sit adipisicing labore officia magna elit nisi in aute tempor commodo eiusmod.</p>
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