@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      @include('admin.includes.messages')
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Order Processing</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
            <li class="breadcrumb-item active">Order Processing</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->

    <div class="d-flex font-weight-bold justify-content-center h2 mb-3">Search Processing Order</div>
    <div class="d-flex justify-content-center">
      <form class="form-inline" method="post" action="{{route('process.order.date.wise')}}" >
        @csrf() 
        <div class="form-group mb-2">
          <label for="depart" class="mr-2">Start Date </label>
          <input class="form-control datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date"/>
        </div>
        <div class="form-group mx-sm-3 mb-2">
          <label for="return" class="mr-2">End Date </label>
          <input class="form-control datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date"/>
        </div>
        <button type="submit" class="btn btn-primary mb-2">SEARCH</button>
      </form>
    </div>
  
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container">
      <div class="card">

        <div class="card-header">Invoice
          <strong>{{date('d-m-Y')}}</strong>
          <!-- <span class="float-right"> <strong>Status:</strong> Pending</span> -->
        </div>

        <div class="card-body">


          <div class="table-responsive-sm">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="center">Oder Id</th>
                  <th>Name</th>
                  <th class="right">Address</th>
                  <th class="right">Mobile</th>
                  <th class="right">Amount</th>
                  <!-- <th class="right">Comments</th> -->
                  <th class="right">Action</th>
                </tr>
              </thead>

              <tbody>
                @php $sub=0; $first_name=''; $last_name=''; $address=''; $phone=''; $subtotal=0; $total_amount=0; @endphp
                @foreach($order as $orders)
                @foreach($orders->productMeta as $meta)
                @if($meta->meta_key=='first_name') @php $name=$meta->meta_value; @endphp @endif
                @if($meta->meta_key=='last_name') @php $last_name=$meta->meta_value; @endphp @endif
                @if($meta->meta_key=='address_one') @php $address_one=$meta->meta_value; @endphp @endif
                @if($meta->meta_key=='phone') @php $phone=$meta->meta_value; @endphp @endif
                @endforeach
                @foreach($orders->orderItem as $info)
                @foreach($info->orderMeta as $value)
                @if($value->meta_key=='_line_subtotal')
                @php $subtotal=$value->meta_value; @endphp
                @endif

                @endforeach
                @endforeach
                <tr>
                  <td class="center">{{$orders->ID}} Date:{{date('d-m-Y',strtotime($orders->post_date))}}</td>
                  <td>{{$name}} {{$last_name}}</td>
                  <td class="right">{{$address_one}}</td>
                  <td class="right">{{$phone}}</td>
                  <td class="right">{{$sub=$subtotal}}</td>
                  <td class="right">
                  <a href="{{route('order.processing.print',$orders->ID)}}" class="btn btn-primary mb-2">  <i class="fas fa-print"> </i> Print</a><br>
                    <a href="{{route('order.processing.edit',$orders->ID)}}" class="btn btn-success mb-2"><i class="fas fa-edit"></i> Edit</a><br>
                    <a onclick="return confirm('Are you sure??')" href="{{route('order.processing.dispatch',$orders->ID)}}" class="btn btn-danger"><i class="fas fa-window-close"></i> Dispatch</a>
                    <a onclick="return confirm('Are you sure??')" href="{{route('order.processing.cancel',$orders->ID)}}" class="btn btn-danger"><i class="fas fa-window-close"></i> Cancel</a>
                  </td>
                  <!-- <td class="right">hello</td> -->
                </tr>
                @php $total_amount+=$sub; @endphp
                @endforeach
              </tbody>
            </table>
            {{$order->links()}}
          </div>

          <div class="row">
            <div class="col-lg-4 col-sm-5">

            </div>

          </div>

        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="box bg-primary">
            <!-- <i class="fa fa-lemon ml-1"></i> -->

            <h3 class="text-center">{{$total_order}}</h3>

            <p class="lead text-center font-weight-bold">Total Order</p>
          </div>
        </div>

        <div class="col-md-4 ">
          <div class="box bg-info">
            <!-- <i class="fa fa-handshake ml-1"></i> -->


            <h3 class="text-center">{{$total_amount}}</h3>

            <p class="lead text-center font-weight-bold">Total Amount</p>
          </div>
        </div>
      </div>

    </div>
  </section>
  <!-- /.row -->
</div><!-- /.container-fluid -->

<!-- /.content -->
<!--  </div> -->
@endsection

@section('js')

@endsection