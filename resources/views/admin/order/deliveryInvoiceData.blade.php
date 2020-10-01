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
        <!-- <div class="s002">
            <form method="post" action="{{route('order.delivery.invoice.data')}}">
                @csrf
                <div class="inner-form ml-5">
                    <div class="input-field second-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                            </svg>
                        </div>
                        <input type="text" class="form-control" name="order_id" placeholder="Invoice No" autocomplete="off" />
                    </div>
                    <div class="input-field second-wrap">
                        <div class="icon-wrap">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                            </svg>
                        </div>
                        <input type="date" class="form-control" name="order_date"  placeholder="Invoice No" />
                    </div>
                    <div class="input-field fifth-wrap">
                        <button type="submit" class="btn-search" type="button">SEARCH</button>
                    </div>
            </form>
        </div> -->
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
                                @foreach($order as $key=>$item)
                                <tr>
                                    <td>{{++$key}}</td>
                                    <td>{{$item->ID}}</td>
                                    <td>{{date('Y-m-d',strtotime($item->post_date))}}</td>
                                    <td><a class="btn btn-success btn-sm" href="{{route('order.delivery.invoice.data.details',$item->ID)}}">View Details</a>
                                    </td>
                                </tr>
                                @endforeach
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