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
            <div class="card-body d-flex justify-content-between flex-row " style="display: block;">
              <div class="genarel">
                <div class="font-weight-bold text-center">Genarel</div>
                <div class="mt-3">
                  <form>
                    <div class="form-group">
                      <label for="dateCreated">Date created:</label>
                      <input type="text" class="form-control" id="dateCreated" value="{{date('Y-m-d')}}">
                    </div>
                    <div class="form-group">
                      <label for="sattus">Status</label>
                      <select name="status" id="status" class="form-control">
                        <option value="1">Processing</option>
                        <option value="1">On Hold</option>
                        <option value="1">Completed</option>
                        <option value="1">Cancelled</option>
                        <option value="1">Refunded</option>
                        <option value="1">Failed</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="customer">Customer</label>
                      <select name="customer" id="customer" class="form-control">
                        <option value="1">Guest</option>
                      </select>
                    </div>
                    
                  </form>
                </div>            
              </div>
              <div>
                <div class="font-weight-bold">Billing</div>
                <div class="mt-3">
                  akbor,Hossain <br>
                  Khilkhat,Dhaka <br>
                  Bangladesh
                </div>
                <div class="font-weight-bold">Email Address</div>
                <div>user@gmail.com</div>

                <div class="font-weight-bold mt-2">Phone</div>
                <div>user@gmail.com</div>
              </div>
              <div>              
               <div class="font-weight-bold">Shipping</div>
               <div class="mt-3">
               Address<br>
                No Shipping Address <br>
                
              </div>
             </div>

           </div>
           </div>

           <div class="card card-default">
            <div class="card-header">
              <h3 class="card-title" style="width: 100%">Item Info</h3>                                         
            </div>
            <div class="card-body d-flex justify-content-between flex-row " style="display: block;">
              
              <table class="table table-striped">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Item</th>
                    <th scope="col">Cost</th>
                    <th scope="col">Qty</th>
                    <th scope="col">Total</th>
                  </tr>
                </thead>
                <tbody>
                @php 
                $i=1;
                @endphp
                @foreach($products as $item)
                  <tr>
                    <th scope="row">{{$i}}</th>
                    <td>{{$item->order_item_name}}</td>
                    <td>Cost</td>
                    <td>Qty</td>
                    <td>Total</td>
                  </tr>   
                   @php 
                $i++;
                @endphp   
                  @endforeach          
                </tbody>

              </table>

           </div>
           <div class="card-footer ">
             <div class="d-flex flex-column justify-content-end">
              <div class="d-flex flex-row justify-content-end">
                 <div> item Sub total:</div>
                 <div> $ 42</div>
              </div>
              <div class="d-flex flex-row justify-content-end">
                <div> Order Total: </div>
                 <div> $ 42</div>
              </div>
             </div>
          </div>
          
        </div>
      </div>

      <div class="col-md-3">
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Order Action</h3>
            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body d-flex flex-row text-center" style="display: block;">
           <select name="" class="form-control" id="">
             <option value="">Choose an action</option>
             <option value="">Email</option>
             <option value="">Resend</option>
             <option value="">Regenarate</option>
           </select>

          </div>
          <div class="card-footer">
            <button type="submit" value="draft" name="dreft" class="btn text-danger" >Move to trash</button>
            <button type="submit" value="submit" name="submit" class="btn btn-primary">Publish</button>
          </div>
        </div>
        
      </div>
     
      <!-- /.card-body -->
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