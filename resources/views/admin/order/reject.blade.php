@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Reject</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Reject</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form>
        <fieldset>
          <!-- <legend>Search Pending Order</legend> -->
        </fieldset>
        <div class="inner-form ml-5">
          
          <div class="input-field second-wrap">
            <p>Choose Image for Scan</p>
            <form>
              <input type="file" accept="image/*;capture=camera">
            </form>
          </div>
    
        
          <div class="input-field fifth-wrap">
            <button class="btn-search" type="button">SEARCH</button>
          </div>
        </div>
      </form>
    </div>

       
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <div class="card">

          <div class="card-header">Invoice
            <strong>01/01/01/2018</strong> 
            <span class="float-right"> <strong>Status:</strong> Pending</span>
          </div>

          <div class="card-body">
            <div class="row mb-4">
              <div class="col-sm-6">
                <h6 class="mb-3">From:</h6>
                <div><strong>Webz Poland</strong></div>
                <div>Madalinskiego 8</div>
                <div>71-101 Szczecin, Poland</div>
                <div>Email: info@webz.com.pl</div>
                <div>Phone: +48 444 666 3333</div>
              </div>

              <div class="col-sm-6">
                <h6 class="mb-3">To:</h6>
                <div>
                <strong>Bob Mart</strong>
                </div>
                <div>Attn: Daniel Marek</div>
                <div>43-190 Mikolow, Poland</div>
                <div>Email: marek@daniel.com</div>
                <div>Phone: +48 123 456 789</div>
              </div>



            </div>

            <div class="table-responsive-sm">
              <table class="table table-striped">
                <thead>
                  <tr>
                  <th class="center">SKU</th>
                  <th>Category</th>
                  <th>Quantity</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong">Origin License</td>
                  <td class="left">Extended License</td>         
                  </tr>

                  <tr>
                  <td class="center">2</td>
                  <td class="left">Custom Services</td>
                  <td class="left">Instalation and Customization (cost per hour)</td>
                  </tr>

                  <tr>
                  <td class="center">3</td>
                  <td class="left">Hosting</td>
                  <td class="left">1 year subcription</td>

                  </tr>

                  <tr>
                  <td class="center">4</td>
                  <td class="left">Platinum Support</td>
                  <td class="left">1 year subcription 24/7</td>
                  
                  </tr>
                </tbody>
              </table>
            </div>

          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
           <div class="offset-md-4 col-md-4">
                <div class="box bg-danger">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">1</h3>
                 
                  <p class="lead text-center font-weight-bold">Reject Qty</p>
                </div>
              </div>
            
              <div class="col-md-4">
                <div class="box">
                  <button class="btn-primary" type="Submite"  style="height: 56px;width: 80%;border-radius: 6px;">Submite</button>
                </div>
              </div>
        </div>       
            
      </div>
    </section>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
   
    <!-- /.content -->
 <!--  </div> -->
@endsection

@section('js')

@endsection