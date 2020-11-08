@extends('front.layouts.front_master')

@section('content')
<style type="text/css">

</style>
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
  <div class="row">
    <div class="col-md-12">

      <article class="card ml-5">

        <div class="container">


                <nav class="nav nav-tabs nav-justified">
                  <a class="nav-item nav-link active" data-toggle="tab" href="#general">General Enquiries</a>
                  <!-- <a class="nav-item nav-link" data-toggle="tab" href="#menu1">Specification</a> -->
                  <a class="nav-item nav-link" data-toggle="tab" href="#return">Request cancel/return</a>
                  <a class="nav-item nav-link disabled" data-toggle="tab" href="#menu3"></a>
                </nav>





                <div id="my_side_tabs" class="tab-content side-tabs side-tabs-left">

                  <div class="tab-pane active " id="general" role="tabpanel">
                    
                      <form action=" {{route('genarelQuiry')}} " method="POST">
                        @csrf
                        <h3>General Enquiries Form</h3>
                        <div class="form-group">
                          <br>
                          <label class="col-sm-3 control-label">Name</label>
                          <div class="col-sm-8">
                            <input class="form-control" type="text" name="name" ng-model="me.email" placeholder="Name" value="{{auth()->user()->name}}">

                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label">Email</label>
                          <div class="col-sm-8">
                            <input class="form-control" type="text" name="email" placeholder="Email" value="{{auth()->user()->email}}">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label">Subject</label>
                          <div class="col-sm-8">
                            <input class="form-control" type="text" name="subject" placeholder="Subject">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label">Your Message</label>
                          <div class="col-sm-8">
                            <textarea class="form-control" type="text" name="message" placeholder="Your Message"></textarea>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class=" col-sm-10">
                            <button type="submit" class="btn btn-primary float-right">Submit</button>
                          </div>
                        </div>
                      </form>
                   

                  </div>




                  <div class="tab-pane fade" id="return" role="tabpanel">
                    <div class="col-sm-12">
                      <form method="POST" action="{{route('genarelQuiry')}}">
                        @csrf
                        <h3>Request cancel/return Form</h3>
                        <div class="form-group">
                          <label class="col-sm-3 control-label">Name</label>
                          <div class="col-sm-8">
                            <input class="form-control" type="text" name="name" placeholder="Name" value="{{auth()->user()->name}}">
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-sm-4 control-label">Email</label>
                          <div class="col-sm-8">
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
                          <div class="col-sm-8">
                            <input class="form-control" type="text" name="" placeholder="Oder id or invoice number">
                          </div>
                        </div>
                         <div class="form-group" id="skuDiv">
                            <div class="col-sm-8">
                              <input class="form-control box" type="text" name=""  placeholder="SKU or Product code" >
                            </div>
                          </div>

                        <div class="red">
                          <div class="form-group">
                            <label class="col-sm-4 control-label">
                              Reason for Cancellation
                            </label>
                            <div class="col-sm-8">
                              <textarea class="form-control" type="text" name=""  placeholder="Reason for Cancellation">
                          </textarea>
                            </div>
                          </div>

                        </div>
                          
                        <button type="button" class="btn btn-primary float-right">Submit</button>
                          
                        
                      </form>
                    </div>
                  </div>
                </div>
              
          
          
</div>
      </article>
    </div>
  </div>

  @endsection