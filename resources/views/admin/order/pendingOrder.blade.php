@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Pending Order</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Pending Order</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form>
        <fieldset>
          <legend>Search Pending Order</legend>
        </fieldset>
        <div class="inner-form ml-5">
          
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="depart" type="date" placeholder="29 Aug 2018" />

          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" id="return" type="date" placeholder="30 Aug 2018" />
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
                  <th class="center">Oder Id</th>
                  <th>Name</th>
                  <th>SKU</th>

                  <th class="right">Color</th>
                  <th class="center">Qty</th>
                  <th class="right">Item</th>
                  <th class="right">Address</th>
                  <th class="right">Mobile</th>
                  <th class="right">Amount</th>
                  <th class="right">Action</th>
                  <th class="right">Comments</th>
                  </tr>
                </thead>

                <tbody>
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong">Origin License</td>
                  <td class="left">Extended License</td>

                  <td class="right">$999,00</td>
                  <td class="center">1</td>
                  <td class="right">$999,00</td>
                  <td class="right">$999,00</td>
                  <td class="right">$999,00</td>
                  <td class="right">$999,00</td>
                  <td class="right">$999,00</td>
                  <td class="right">$999,00</td>
                  </tr>

                  <tr>
                  <td class="center">2</td>
                  <td class="left">Custom Services</td>
                  <td class="left">Instalation and Customization (cost per hour)</td>

                  <td class="right">$150,00</td>
                  <td class="center">20</td>
                  <td class="right">$3.000,00</td>
                  <td class="right">$3.000,00</td>
                  <td class="right">$3.000,00</td>
                  <td class="right">$3.000,00</td>
                  <td class="right">$3.000,00</td>
                  <td class="right">$3.000,00</td>
                  </tr>

                  <tr>
                  <td class="center">3</td>
                  <td class="left">Hosting</td>
                  <td class="left">1 year subcription</td>

                  <td class="right">$499,00</td>
                  <td class="center">1</td>
                  <td class="right">$499,00</td>
                  <td class="right">$499,00</td>
                  <td class="right">$499,00</td>
                  <td class="right">$499,00</td>
                  <td class="right">$499,00</td>
                  <td class="right">$499,00</td>
                  </tr>

                  <tr>
                  <td class="center">4</td>
                  <td class="left">Platinum Support</td>
                  <td class="left">1 year subcription 24/7</td>

                  <td class="right">$3.999,00</td>
                  <td class="center">1</td>
                  <td class="right">$3.999,00</td>
                  <td class="right">$3.999,00</td>
                  <td class="right">$3.999,00</td>
                  <td class="right">$3.999,00</td>
                  <td class="right">$3.999,00</td>
                  <td class="right">$3.999,00</td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div class="row">
                <div class="col-lg-4 col-sm-5">

                </div>

            <div class="col-lg-4 col-sm-5 ml-auto">
              <table class="table table-clear">
                <tbody>
                  <tr>
                  <td class="left">
                  <strong>Subtotal</strong>
                  </td>
                  <td class="right">$8.497,00</td>
                  </tr>

                  <tr>
                  <td class="left">
                  <strong>Discount (20%)</strong>
                  </td>
                  <td class="right">$1,699,40</td>
                  </tr>

                  <tr>
                  <td class="left">
                   <strong>VAT (10%)</strong>
                  </td>
                  <td class="right">$679,76</td>
                  </tr>

                  <tr>
                  <td class="left">
                  <strong>Total</strong>
                  </td>
                  <td class="right">
                  <strong>$7.477,36</strong>
                  </td>
                  </tr>
                </tbody>
              </table>

            </div>

            </div>

          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
           <div class="col-md-4">
                <div class="box bg-primary">
                  <!-- <i class="fa fa-lemon ml-1"></i> -->
                 
                  <h3 class="text-center">50</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Order</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-success">
                  <!-- <i class="fa fa-user ml-1"></i> -->
                 
                 
                  <h3 class="text-center">123</h3>
                 
                  <p class="lead text-center font-weight-bold">Total Item</p>
                </div>
              </div>
              <div class="col-md-4">
                <div class="box bg-info">
                  <!-- <i class="fa fa-handshake ml-1"></i> -->
                  
                 
                  <h3 class="text-center">1</h3>
                  
                  <p class="lead text-center font-weight-bold">Total Amount</p>
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