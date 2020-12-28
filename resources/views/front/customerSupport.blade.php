@extends('front.layouts.front_master')

@section('content')
<style type="text/css">
    nav a{
        font-size: 14px;
    }
</style>
<!-- Page Content  -->
<div id="content" class="container p-0 mb-2">
 
               @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong> {{ session('success') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                @endif

                <nav class="nav nav-tabs nav-justified">
                  <a class="nav-item nav-link active" data-toggle="tab" href="#general">General Enquiries</a>
                  <!-- <a class="nav-item nav-link" data-toggle="tab" href="#menu1">Specification</a> -->
                  <a class="nav-item nav-link" data-toggle="tab" href="#return">Request cancel/return</a>
                  
                </nav>

                <div id="my_side_tabs" class="tab-content side-tabs side-tabs-left">

                  <div class="tab-pane active " id="general" role="tabpanel">
                     <table class="table">
                      <thead>
                        <tr>
                          <th>Subject</th>
                          <th>Admin Reply</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($admin_reply as $reply)
                        <tr>
                          <td>{{$reply->post_title}}</td>
                          <td>{{$reply->post_excerpt}}</td> 
                        </tr>
                        @endforeach 
                      </tbody>
                    </table>
                      <form action=" {{route('genarelQuiry')}} " method="POST">
                        @csrf
                        <div class="h4 mt-2">General Enquiries Form</div>
                       
                        <div class="form-group">
                          <label class=" control-label">Subject</label>
                          <div class="">
                            <input class="form-control" type="text" name="subject" placeholder="Subject">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class=" control-label">Your Message</label>
                          <div class="">
                            <textarea class="form-control"  type="text" name="message" placeholder="Your Message"></textarea>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="">
                            <button type="submit" class="btn btn-primary ">Submit</button>
                          </div>
                        </div>
                      </form>
                   

                  </div>


                  <div class="tab-pane fade" id="return" role="tabpanel">
                    <div class="col-sm-12 p-0">
                      <form method="POST" action="{{route('s_cancel')}}">
                        @csrf
                        <div class="h4">Request cancel/return Form</div>
                      

                        <div class="form-group ml-3">
                          <div class="custom-control custom-radio">
                            <label id="f_cancel">
                              <input type="radio" name="cancel_option"  value="full" id="f_cancel"> Full order cancel/return
                            </label>
                          </div>


                          <div class="custom-control custom-radio">
                            <label id="p_cancel">
                              <input type="radio" name="cancel_option" value="partial" id="p_cancel"> Partial order cancel/return
                            </label>
                          </div>
                        </div>


                        <div id="order_id" class="form-group" style="display:none">
                          <select id="customer_order_id" class="form-control" name="customer_order_id">
                            <option value="">Chose Order Id</option>
                            @foreach($order_list as $single_order)
                              <option value="{{$single_order->order_id}}">{{$single_order->order_id}}</option>
                            @endforeach 
                          </select>
                        </div>

                        
                        <div id="order_id_search" class="form-group" style="display:none">
                          <select class="form-control" id="customer_orders_id" name="customer_orders_id">
                            <option value="">Chose Order Id</option>
                            @foreach($order_list as $single_order)
                              <option value="{{$single_order->order_id}}">{{$single_order->order_id}}</option>
                            @endforeach 
                          </select>
                        </div>

                        <div id="p_data_show" style="display:none">
                           <table style="width:100%" id="data_show">
                                <tr>
                                  <th>Item</th>
                                </tr>
                              </table>
                        </div>

                        <div class="red">
                          <div class="form-group">
                            <label class=" control-label">
                              Reason for Cancellation
                            </label>
                            <textarea class="form-control" type="text" name="c_reason"  placeholder="Reason for Cancellation"></textarea>
                          </div>
                        </div>

                          
                        <button type="submit" class="btn btn-primary">Submit</button>
                      </form>
                    </div>
                </div>
           </div>
      </div>
      <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
      <script>
        $("#f_cancel").click(function(){
           $("#order_id").show();
             $("#order_id_search").hide();
               $("#p_data_show").hide();
        });
          $("#p_cancel").click(function(){
           $("#order_id_search").show();
           $("#order_id").hide();
        });


       $("#customer_orders_id").change(function(){
        var id=$("#customer_orders_id").val();
        $.ajax({
        url: "{{url('/p_cancel_order/')}}" + '/' +id,
        type: "GET",
        success: function(response) {
            $("#p_data_show").show();
            var item_name = ""; 
            item_name+= "<tr><th></th><th>Item</th><th>Attribute</th><th>Qty</th></tr>";
            $.each(response.product_name, function(i, item) {
                 var input_value="<input type='number' name='quantity[]' value='"+item.qt+"'>";
                 var input_proid="<input type='hidden' name='pro_id[]' value='"+item.product_id+"'>";
                 item_name+="<tr><td><input type='checkbox' name='check_id[]' value="+item.product_id+"></td> <td>"+item.product_name+"</td>  <td>"+item.att+"</td>  <td>"+input_value+"</td><td>"+input_proid+"</td> </tr>";
            });
            $("#data_show").html(item_name);
            },
           error: function(response) {
            console.log(response);
           },
        });
       });

        $("#customer_order_id").change(function(){
        var id=$("#customer_order_id").val();
        $.ajax({
        url: "{{url('/f_cancel_order/')}}" + '/' +id,
        type: "GET",
        success: function(response) {
          console.log(response);
            $("#p_data_show").show();
            var item_name = ""; 
            item_name+= "<tr><th></th><th></th></tr>";
            $.each(response.product_name_full, function(i, item) {
                var input_proid="<input type='hidden' name='pro_id[]' value='"+item.product_id+"'>";
                var input_qty="<input type='hidden' name='quantity[]' value='"+item.qt+"'>";
                item_name+="<tr> <td>"+input_proid+"</td>  <td>"+input_qty+"</td></tr>";
            });
            $("#data_show").html(item_name);
            },
           error: function(response) {
            console.log(response);
           },
        });
       });



      </script>
  @endsection