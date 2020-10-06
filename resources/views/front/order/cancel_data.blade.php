@extends('front.layouts.master')
@section('content')
<style>
    table {
        border: none;
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

                      
                            <table class="table">
                                <thead>
                                    <tr style="background:#e7e7e7">
                                        <th>Order Id:</th>
                                        <th>
                                        </th>
                                        <th><a href=""><span style="color:#000000">Cancel/Return?</span></a></th>
                                        <th><a href=""><span style="color:#000000">Details</span></a></th>
                                    </tr>
                                </thead>
                                <tbody>
                               
                                    <tr>
                                        <td style="border:none">
                                           
                                            <img width="50px" height="50px" src="">
                                            Sku:
                                        </td>
                                        <td>
                                           
                                        </td>
                                        <td>
                                            pcs
                                        </td>
                                    </tr>
                               
                                </tbody>
                            </table>
                     
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

@endsection