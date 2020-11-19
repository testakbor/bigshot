@extends('front.layouts.front_master')

@section('content')
<style type="text/css">
    nav a{
        font-size: 14px;
    }
</style>
<!-- Page Content  -->
<div id="content" class="container p-0 mb-2">
 


                <nav class="nav nav-tabs nav-justified">
                  <a class="nav-item nav-link active" data-toggle="tab" href="#general">General Enquiries</a>
                  <!-- <a class="nav-item nav-link" data-toggle="tab" href="#menu1">Specification</a> -->
                  <a class="nav-item nav-link" data-toggle="tab" href="#return">Request cancel/return</a>
                  
                </nav>

                <div id="my_side_tabs" class="tab-content side-tabs side-tabs-left">

                  <div class="tab-pane active " id="general" role="tabpanel">
                    
                      <form action=" {{route('genarelQuiry')}} " method="POST">
                        @csrf
                        <div class="h4 mt-2">General Enquiries Form</div>
                        <div class="form-group">
                          <br>
                          <label class=" control-label">Name</label>
                          <div class="">
                            <input class="form-control" type="text" name="name" ng-model="me.email" placeholder="Name" value="{{auth()->user()->name}}">

                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label">Email</label>
                          <div class="">
                            <input class="form-control" type="text" name="email" placeholder="Email" value="{{auth()->user()->email}}">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class=" control-label">Subject</label>
                          <div class="">
                            <input class="form-control" type="text" name="subject" placeholder="Subject">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class=" control-label">Your Message</label>
                          <div class="">
                            <textarea class="form-control" type="text" name="message" placeholder="Your Message"></textarea>
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
                      <form method="POST" action="{{route('genarelQuiry')}}">
                        @csrf
                        <div class="h4">Request cancel/return Form</div>
                        <div class="form-group">
                          <label class="control-label">Name</label>
                          <div class="">
                            <input class="form-control" type="text" name="name" placeholder="Name" value="{{auth()->user()->name}}">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label">Email</label>
                          <div class="">
                            <input class="form-control" type="text" name="email" placeholder="Email" value="{{auth()->user()->email}}">
                          </div>
                        </div>
                        <div class="form-group ml-3">

                          <div class="custom-control custom-radio">
                            <label>
                              <input type="radio" name="colorRadio"  value="full" id="f_cancel" > Full order cancel/return
                            </label>
                          </div>


                          <div class="custom-control custom-radio">
                            <label>
                              <input type="radio" name="colorRadio" value="partial" id="p_cancel" checked> Partial order cancel/return
                            </label>
                            <input type="hidden" name="" id="hidden">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="">
                            <input class="form-control" type="text" name="" placeholder="Oder id or invoice number">
                          </div>
                        </div>
                         <div class="form-group" id="skuDiv">
                            <div class="">
                              <input class="form-control box" type="text" name=""  placeholder="SKU or Product code" >
                            </div>
                          </div>

                        <div class="red">
                          <div class="form-group">
                            <label class=" control-label">
                              Reason for Cancellation
                            </label>
                            <div class="">
                              <textarea class="form-control" type="text" name=""  placeholder="Reason for Cancellation">
                          </textarea>
                            </div>
                          </div>

                        </div>
                          
                        <button type="button" class="btn btn-primary">Submit</button>
                          
                        
                      </form>
                    </div>
                  
         
  </div>
  </div>
  </div>

  @endsection