<?php

use App\Model\front\Order_item;
?>
@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <section class="content-header">
        <div class="container-fluid">
            @include('admin.includes.messages')
            <div class="row mb-2">
                <div class="col-sm-6">
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
                        <li class="breadcrumb-item active">Delivery Invoice
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="s002">
    <div class="d-flex font-weight-bold justify-content-center h2 mb-3">Delivery Invoice</div>
      <div class="d-flex justify-content-center mb-3">
        <form class="form-inline" method="post" action="{{route('order.delivery.invoice.data')}}" >
          @csrf() 
          <div class="form-group mb-2">
            <label for="depart" class="mr-2">Order Id</label>
            <input  type="text" class="form-control" name="order_id" placeholder="Scanner or Order Id" />
          </div>

          <div class="form-group mb-2">
            <label for="depart" class="mr-2">Date</label>
            <input  type="date" class="form-control" name="order_date" placeholder="Scanner or Order Id" />
          </div>

          <button type="submit" class="btn btn-primary mb-2">SEARCH</button>
        </form>
      </div>
        </div>
    </section>
    <section class="content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive-sm">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="center">#</th>
                                    <th class="center">Invoice Number</th>
                                    <th>Date</th>
                                    <!-- <th>Delivery Company</th> -->
                                    <th class="right">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-sm-5">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
@section('js')
@endsection