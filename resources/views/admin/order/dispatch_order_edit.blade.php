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
            <div class="row">
                <input type="hidden" name="id" value="">
                <div class="col-md-9">
                    <div class="card card-default">
                        <div class="card-header">

                            <h3 class="card-title" style="width: 100%">Order #{{$order->ID}} details </h3>



                        </div>
                        <div class="card-body d-flex justify-content-between flex-row " style="display: block;">
                            <div class="genarel">
                                <div class="font-weight-bold text-center">Genarel</div>
                                <div class="mt-3">

                                    <div class="form-group">
                                        <label for="dateCreated">Date created:</label>
                                        {{date('d-m-Y',strtotime($order->post_date))}}

                                    </div>
                                    <div class="form-group">
                                        <label for=""> Status:</label>
                                        {{$order->post_status}}
                                    </div>

                                </div>
                            </div>
                            @php $name=''; $phone=''; @endphp
                            @foreach($order->productMeta as $meta)
                            @if($meta->meta_key=='first_name') @php $name=$meta->meta_value; @endphp @endif
                            @if($meta->meta_key=='phone') @php $phone=$meta->meta_value; @endphp @endif
                            @endforeach
                            <div>
                                <div class="font-weight-bold">Customer</div>
                                <div class="mt-3">
                                    {{$name}}
                                </div>


                                <div class="font-weight-bold mt-2">Phone</div>
                                <div>{{$phone}}</div>
                            </div>


                        </div>
                    </div>
                    <form action="{{route('update.order.quantity')}}" method="POST">
                        @csrf
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
                                        @php $product_name=''; @endphp
                                        @foreach($order_item as $items)
                                        @foreach($items->orderItem as $item_data)
                                        @php $product_name=$item_data->order_item_name; @endphp
                                        @endforeach
                                        <tr>
                                            <th scope="row">43543</th>
                                            <td>435435 </td>
                                            <td>43543</td>
                                            <td><input type="number" name="qty[]" value=""></td>
                                            <td>4354</td>
                                            <input type="hidden" name="product_id[]" value="">
                                            <input type="hidden" name="order_id" value="">
                                            <input type="hidden" name="order_item_id[]" value="">
                                            <input type="hidden" name="total[]" value="">
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>

                            </div>
                            <div class="card-footer ">
                                <div class="d-flex flex-column justify-content-end">
                                    <div class="d-flex flex-row justify-content-end">
                                        <div> item Sub total:</div>
                                        <div> 4354</div>
                                    </div>
                                    <div class="d-flex flex-row justify-content-end">
                                        <div> Order Total: </div>
                                        <div> 43543</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 text-center">
                                <button type="submit" value="submit" name="submit" class="btn btn-primary">Full Order Cancel</button>
                                <button type="submit" value="submit" name="submit" class="btn btn-primary">Partial Order Cancel</button>
                            </div>
                    </form>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

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