@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
           
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Send Parcel</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form>
        <fieldset>
          <legend>Search Send Parcel</legend>
        </fieldset>
        <div class="inner-form ml-5" style="width: 32.5%;">
          
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

          <div class="card-body">

            <div class="table-responsive-sm">
              <table class="table table-striped">
                <thead>
                  <tr>
                  <th class="center">Oder Id</th>
                  <th>Name</th>
                  <th>Address</th>

                  <th class="right">Items</th>
                  <th class="center">Qty</th>
                  <th class="right">Amount</th>
                  <th class="right">Status</th>
                  <th class="right">Action</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong">Origin License</td>
                  <td class="left">Extended License</td>

                  <td class="right">Phone</td>
                  <td class="center">1</td>
                  <td class="right">$999,00</td>
                  <td class="right">Complete</td>
                  <td class="right"></td>
            
                  </tr>

                  <tr>
                  <td class="center">2</td>
                  <td class="left">Custom Services</td>
                  <td class="left">Instalation and Customization (cost per hour)</td>

                  <td class="right">Phone</td>
                  <td class="center">20</td>
                  <td class="right">$3.000,00</td>
                  <td class="right">Complete</td>
                  <td class="right"></td>
                 
                  </tr>

                  <tr>
                  <td class="center">3</td>
                  <td class="left">Hosting</td>
                  <td class="left">1 year subcription</td>

                  <td class="right">Phone</td>
                  <td class="center">1</td>
                  <td class="right">$499,00</td>
                  <td class="right">Complete</td>
                  <td class="right"></td>
                
                  </tr>

                  <tr>
                  <td class="center">4</td>
                  <td class="left">Platinum Support</td>
                  <td class="left">1 year subcription 24/7</td>

                  <td class="right">Phone </td>
                  <td class="center">1</td>
                  <td class="right">$3.999,00</td>
                  <td class="right">Complete</td>
                  <td class="right"></td>
                  
                  </tr>
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
      <div class="container">
        <div class="row">
           <div class="col-md-4">
                <div class="box bg-danger">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">50</h3>
                 
                  <p class="lead text-center font-weight-bold">Processing</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-success">              
                  <h3 class="text-center">123</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Percel</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box">
                  <button class="btn-primary" type="Submite"  style="height: 56px;width: 80%;border-radius: 6px;">Submite & Print</button>
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