@extends('front.layouts.master')
@section('content')
<style>
    table,
    th,
    td {
        border: 1px solid black;
        border-collapse: collapse;
    }

    th,
    td {
        padding: 5px;
        text-align: left;
    }
</style>
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
        <div class="col-md-12 ">
            <div class="container-fluid mt-2">
                <div class="container">
                    @if (session('success'))
                    <div class="alert alert-success" role="alert" id="alert">
                        {{ session('success') }}
                    </div>
                    @endif
                    @if (session('error'))
                    <div class="alert alert-danger" role="alert" id="alert">
                        {{ session('error') }}
                    </div>
                    @endif
                    <article class="card">
                        <header class="card-header"> My Orders List </header>
                        <div class="card-body">
                            <!-- <h6>Order ID: OD45345345435</h6> -->
                            <article class="card">
                                <table style="width:100%">
                                    <tr>
                                        <th>#</th>
                                        <th>Order Id</th>
                                        <th>Order Date</th>
                                        <th>Order Status</th>
                                        <th>Action</th>
                                    </tr>
                                    @foreach($shop_order as $key=>$order)
                                    <tr>
                                        <td>{{++$key}}</td>
                                        <td>{{$order->ID}}</td>
                                        <td>{{date('d-M-Y',strtotime($order->post_date))}}</td>
                                        <td>{{$order->post_status}}</td>
                                        <td>
                                            <a class="btn btn-success btn-sm" href="{{route('customer_ordere_edit',$order->ID)}}"><span style="color:#ffffff">View</span></a>
                                            @if($order->post_status=='on-hold')
                                            <!-- <a onclick="return confirm('Are you sure??')" class="btn btn-danger btn-sm" href="{{route('customer_ordere_cancel',$order->ID)}}"><span style="color:#ffffff">Cancel Order</span></a> -->
                                            <!-- <a onclick="return confirm('Are you sure??')" class="btn btn-danger btn-sm" href=""><span style="color:#ffffff">Cancel Order</span></a> -->
                                            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#exampleModalLong" style="background-color: red !important;">
                                                  Cancel
                                            </button>
                                            <!-- Modal -->
                                                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                                  <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                      <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">Select item you want to cancelor return</h5>
                                                      </div>
                                                      <div class="modal-body">
                                                          <div class="container-fluid">
                                                            <div class="row">
                                                              <div class="col-md-6 bg-dark">
                                                                  <p>Order placed 01-06-2020</p>
                                                              </div>
                                                              <div class="col-md-6 bg-dark">
                                                                  <p>Processing 02-06-2020</p>
                                                              </div>
                                                            </div>
                                                            <div class="row">
                                                              <div class="col-md-12">
                                                                    <table class="table table-striped">
                                                                        <tbody>
                                                                          <tr>
                                                                          
                                                                          <td> 
                                                                            <input type="checkbox"  name="" value="">
                                                                                Picture <br>  &nbsp; &nbsp; SKU
                                                                          </td>
                                                                          <td class="right">Long Tunic </td>
                                                                          <td class="right">Qty 2</td>   
                                                                          </tr>

                                                                           <tr>   
                                                                              <td> 
                                                                                <input type="checkbox"  name="" value="">
                                                                                    Picture <br>  &nbsp; &nbsp; SKU
                                                                              </td>
                                                                              <td class="right">Long Tunic </td>
                                                                              <td class="right">Qty 2</td>   
                                                                          </tr>
                                                                           <tr>   
                                                                              <td colspan="3"> 
                                                                                <input type="checkbox"  name="" value="">
                                                                                    Full order cancel/return
                                                                              </td>  
                                                                            </tr>
                                                                           <tr>   
                                                                              <td colspan="3"> 
                                                                                <textarea placeholder="Reason for return/cancel" rows="4" cols="50"></textarea>
                                                                              </td>  
                                                                            </tr>
                                                                          
                                                                        </tbody>
                                                                      </table>
                                                              </div>
                                                             
                                                            </div>
                                                        </div>

                                                      <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="Submit" class="btn btn-primary">Submit</button>
                                                      </div>
                                                    </div>
                                                  </div>
                                                </div>
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                    {{$shop_order->links()}}
                                </table>
                            </article>
                            <hr>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

@endsection