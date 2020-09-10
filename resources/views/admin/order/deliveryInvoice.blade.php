@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Delivery Invoice</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Delivery Invoice</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <div class="card">
          <h1 class="text-center">Delivery Invoice</h1>
          <p class="text-center">House15/1, Road 4, BlockA, Section 10, Mirpur,Dhaka.<br><span>Mobile: 0000000000000</span> </p>
          <div class="card-header">Invoice
            <strong>01/01/01/2018</strong> 
            <span class="float-right"> <strong>Status:</strong> Pending</span>
          </div>
           <div class="card-header">Delivery Company Name  
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
                  <th>Address</th>
                  <th>Mobile</th>

                  <th class="right">Items</th>
                  <th class="center">Qty</th>
                  <th class="right">Amount</th>
               
                  </tr>
                </thead>

                <tbody>
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong">Saiful</td>
                  <td class="left">Uttara</td>

                  <td class="right">1234567890</td>
                  <td class="center">Laptop</td>
                  <td class="center">1</td>
                  <td class="right">$999,00</td>
                  
            
                  </tr>
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong">Saiful</td>
                  <td class="left">Uttara</td>

                  <td class="right">1234567890</td>
                  <td class="center">Laptop</td>
                  <td class="center">1</td>
                  <td class="right">$999,00</td>
                  
            
                  </tr>
                  
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
                  <strong>Total Qty</strong>
                  </td>
                  <td class="right">8</td>
                  </tr>
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
            <h1>Receiver Signature:<br>Name:</h1>
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