@extends('front.layouts.master')

@section('content')

<div class="container-fluid my-5 d-flex justify-content-center">
    <div class="card card-1">
        <div class="card-header bg-white">
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                    <h4 class="mb-0">Thanks for your Order <span class="text-dark">{{Auth::user()->name}}</span></h4>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                <div class="col-auto">
                    <h6 class="color-1 mb-0 change-color">Receipt</h6>
                </div>
                <div class="col-auto "> <small>Receipt Voucher : 1KAU9-84UIL</small> </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card card-2">
                        <div class="card-body">
                            <div class="media">
                                {{-- <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="{{asset('assets/front/images/RJOW4BL.jpg')}}" width="135" height="135" /> </div> --}}
                                <div class="media-body my-auto text-right">

                                    {{-- <div class="row my-auto flex-column flex-md-row">
                                        <div class="col my-auto">
                                            <h6 class="mb-0"> Jack Jacs</h6>
                                        </div>
                                        <div class="col-auto my-auto"> <small>Golden Rim </small></div>
                                        <div class="col my-auto"> <small>Size : M</small></div>
                                        <div class="col my-auto"> <small>Qty : 1</small></div>
                                        <div class="col my-auto">
                                            <h6 class="mb-0">Tk&#8377;3,600.00</h6>
                                        </div>
                                    </div> --}}
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
                                         $grandTotal=0;
                                         $subtotal=0;
                                         $qty=0;
                                        @endphp
                                        @foreach($products as $item)
                                       
                                          @foreach($item->orderMeta as $value)
                                          @php                  
                                          if($value->meta_key=='_line_subtotal'){
                                            $subtotal=$value->meta_value;
                                          }
                                          if($value->meta_key=='_qty'){
                                            $qty=$value->meta_value;
                                          }
                        
                                          @endphp
                                          @endforeach
                                          <tr>
                                            <th scope="row">{{$i}}</th>
                                            <td>{{$item->order_item_name}}</td>
                                            <td>{{$subtotal}}</td>
                                            <td>{{$qty}}</td>
                                            <td>{{$sub = $subtotal*$qty}}</td>
                                          </tr>   
                                           @php 
                                        $i++;
                                        $grandTotal += $sub;
                                        @endphp   
                                          @endforeach          
                                        </tbody>
                        
                                      </table>
                                </div>
                            </div>
                            <hr class="my-3 ">

                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col">
                    <div class="row justify-content-between">
                        <div class="col-auto">
                            <p class="mb-1 text-dark"><b>Order Details</b></p>
                        </div>
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">{{$grandTotal}}</p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"> <b>Discount</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Tk. {{$i=10}} </p>
                        </div>
                    </div>
                   
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Delivery Charges</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Tk. 80</p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1"><b>Grand Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1">Tk. {{$grandTotal+$i+80}}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row invoice ">
                <div class="col">
                    <p class="mb-1"> Invoice Number : 788152</p>
                    <p class="mb-1">Invoice Date : 22 Dec,2019</p>
                    <p class="mb-1">Recepits Voucher:18KU-62IIK</p>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <div class="jumbotron-fluid">
                <div class="row justify-content-between ">
                    <div class="col-auto my-auto ">
                        <h2 class="mb-0 font-weight-bold">TOTAL PAID</h2>
                    </div>
                    <div class="col-auto my-auto ml-auto">
                        <h1 class="display-3 ">Tk {{$grandTotal+$i+80}}</h1>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection
