@extends('front.layouts.master')

@section('content')
<style type="text/css">
  
</style>
<!-- Page Content  -->
<div id="content" class="p-4 p-md-5">
    <div class="row">
        <div class="col-md-12">
                             
        <article class="card ml-5">
       		
          <div class="container">
            
  <div class="row">
      <div class="col-sm-12">
        
        <div class="tab-container">
          <ul class="nav nav-tabs nav-tabs-left nav-centered" role="tablist">
           
           
            <li role="presentation">
              <a href="#general" data-toggle="tab" role="tab">
                General Enquiries
              </a>
            </li>
            <li role="presentation">
              <a href="#return" data-toggle="tab" role="tab">
                Request cancel/return
              </a>
            </li>
            
          </ul>
          <div id="my_side_tabs" class="tab-content side-tabs side-tabs-left">
          
            <div class="tab-pane fade" id="general" role="tabpanel">
              <div class="col-sm-12">
                <form method="" action="">
                <h3>General Enquiries Form</h3>
                 <div class="form-group">
                    <br>
                      <label class="col-sm-3 control-label">Name</label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="name" 
                          ng-model="me.email" placeholder="Name" >

                        </div>
                  </div> 
                  <div class="form-group">
                      <label class="col-sm-4 control-label">Email</label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="email" 
                          ng-model="me.email" placeholder="Email" >
                            
                          
                        </div>
                  </div> 
                  <div class="form-group">
                      <label class="col-sm-4 control-label">Subject</label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="subject" 
                          ng-model="me.email" placeholder="Subject" >
                            
                            
                        </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-4 control-label">Your Message</label>
                        <div class="col-sm-8">
                  
                          <textarea class="form-control" type="text" name="" 
                          ng-model="me.email" placeholder="Email">
                            
                          </textarea>                       
                        </div>
                  </div>  
                  <div class="form-group">
                            <div class=" col-sm-10">
                                <button class="btn btn-primary float-right" ng-click="">Submit</button>
                            </div>
                        </div>
                </form>
              </div>
    
            </div>




            <div class="tab-pane fade" id="return" role="tabpanel">
              <div class="col-sm-12">
                <form method="" action="">
                <h3>Request cancel/return Form</h3>
                  <div class="form-group">
                      <label class="col-sm-3 control-label">Name</label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="name" 
                          ng-model="me.email" placeholder="Name" >
                        </div>
                  </div> 
                  <div class="form-group">
                      <label class="col-sm-4 control-label">Email</label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="email" 
                          ng-model="me.email" placeholder="Email" >  
                        </div>
                  </div> 
                  <div class="form-group ml-3">
                                         
                    <div class="custom-control custom-radio">
                      <label><input type="radio" name="colorRadio" value="full"> Full order cancel/return</label>
                    </div>

                   
                    <div class="custom-control custom-radio">
                      <label><input type="radio" name="colorRadio" value="partial" checked> Partial order cancel/return</label>
                    </div>
                  </div> 
                   <div class="form-group">
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="" 
                          ng-model="me.email" placeholder="Oder id or invoice number" readonly>
                        </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label">
                    Reason for Cancellation
                  </label>
                        <div class="col-sm-8">
                          <textarea class="form-control" type="text" name="" 
                          ng-model="me.email" placeholder="Reason for Cancellation">     
                          </textarea>                       
                        </div>
                  </div>

                <div class="red box">
                   <h3>When chosen partial order cancel</h3>
                   <div class="form-group">
                      <label class="col-sm-3 control-label">Name</label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="name" 
                          ng-model="me.email" placeholder="Name" >
                        </div>
                  </div> 
                  <div class="form-group">
                      <label class="col-sm-4 control-label">Email</label>
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="email" 
                          ng-model="me.email" placeholder="Email" >  
                        </div>
                  </div> 
               
                   <div class="form-group">
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="" 
                          ng-model="me.email" placeholder="Oder id or invoice number" readonly>
                        </div>
                  </div>
                   <div class="form-group">
                        <div class="col-sm-8">
                          <input class="form-control" type="text" name="" 
                          ng-model="me.email" placeholder="SKU or Product code">
                        </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label">
                    Reason for Cancellation
                  </label>
                        <div class="col-sm-8">
                          <textarea class="form-control" type="text" name="" 
                          ng-model="me.email" placeholder="Reason for Cancellation">     
                          </textarea>                       
                        </div>
                  </div>

                </div>


                  <div class="form-group">
                            <div class="col-sm-10">
                                <button class="btn btn-primary float-right" ng-click="">Submit</button>
                            </div>
                        </div>
                  </form>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
          
        
        </article>
</div>
</div>

@endsection
