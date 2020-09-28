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
              <h3>10</h3>
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
          <input type="hidden" id="start_date" value="{{date('Y-m-01')}}">
          <input type="hidden" id="end_date" value="{{date('Y-m-t')}}">
        </div>

        <div class="col-md-12">
          <div class="form-group">
            <label>Start</label>
            <input type="date" class="form-control" name="start" placeholder="start" required>
          </div>
          <div class="form-group">
            <label>End</label>
            <input type="date" class="form-control" name="end" placeholder="start" required>
          </div>
          <button type="submit" class="btn btn-success">Search</button>
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
              y: 50,
              label: "Sales"
            },
            {
              y: 60,
              label: "Delivere"
            },
            {
              y: 80,
              label: "Cancelled"
            },

          ]
        }]
      });
      chart.render();
    }
  </script>

  @endsection