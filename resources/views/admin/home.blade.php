@extends('admin.layouts.master')
@section('content')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Dashboard</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->
  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <!-- Small boxes (Stat box) -->
      <div class="row">



        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-primary">
            <div class="inner">
              <h3>{{$total_sales}}</h3>
              <p>Sales</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->

          </div>
        </div>

        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-success">
            <div class="inner">
              <h3>{{$total_delivered}}
              </h3>
              <p>Delivered</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
          </div>
        </div>


        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-danger">
            <div class="inner">
              <h3>{{$total_cancelled}}</h3>
              <p>Cancel</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
          </div>
        </div>


        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-warning">
            <div class="inner">
              <h3>{{$total_sale_amount}}</h3>
              <p>Sales Amount</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <!-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> -->
          </div>
        </div>

        <div class="col-md-12 text-center">
          {{date('Y-m-01')}} To {{date('Y-m-t')}}
          @if($start=='' && $end=='')
          <input type="hidden" id="start_date" value="{{date('Y-m-01')}}">
          <input type="hidden" id="end_date" value="{{date('Y-m-t')}}">
          @else
          <input type="hidden" id="start_date" value="{{$start}}">
          <input type="hidden" id="end_date" value="{{$end}}">
          @endif
        </div>
        <input type="text" id="sale_date" value="{{$total_sale_amount_date_wise}}">
        <input type="text" id="delivery_date" value="{{$total_delivery_amount_date_wise}}">
        <input type="text" id="cancel_date" value="{{$total_cancel_amount_date_wise}}">
        <div class="col-md-12">
          <form method="get" action="{{route('admin.home')}}">
            <div class="form-group">
              <label>Start</label>
              <input type="date" class="form-control" value="{{date('Y-m-01')}}" name="start" placeholder="start" required>
            </div>
            <div class="form-group">
              <label>End</label>
              <input type="date" class="form-control" value="{{date('Y-m-t')}}" name="end" placeholder="start" required>
            </div>
            <button type="submit" class="btn btn-success">Search</button>
          </form>
          <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        </div>


      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

  <script>
    window.onload = function() {
      var start = $("#start_date").val();
      var end = $("#end_date").val();
      var to = "To";
      var tot_sales = document.getElementById('sale_date').value();
      var delivery = $("#delivery_date").val();
      var cancel = $("#cancel_date").val();
      var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        theme: "light2",
        title: {
          text: "Monthly Report of Sales Delivere & Cancelled--" + start + to + end
        },
        axisY: {
          title: ""
        },
        data: [{
          type: "column",
          legendMarkerColor: "grey",
          legendText: "",
          dataPoints: [

            {
              y: tot_sales,
              label: "Sales"
            },
            {
              y: delivery,
              label: "Delivere"
            },
            {
              y: cancel,
              label: "Cancelled"
            },

          ]
        }]
      });
      chart.render();
    }
  </script>

  @endsection