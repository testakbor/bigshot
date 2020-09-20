
@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <!-- <h1>Pending Order</h1> -->
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{route('admin.home')}}">Home</a></li>
              <li class="breadcrumb-item active">Gross profit</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
      <div class="s002">
      <form method="post" action="{{route('s_pending_order')}}">
       @csrf() 
        <fieldset>
          <legend>Search Gross profit</legend>
        </fieldset>
        <div class="inner-form ml-5">
          
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="start" value="{{date('Y-m-d')}}" id="depart" type="date"/>

          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker" name="end" value="{{date('Y-m-d')}}" id="return" type="date"/>
          </div>
        
          <div class="input-field fifth-wrap">
            <button type="submit" class="btn-search" type="button">SEARCH</button>
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
              <table class="table ">
                <thead>
                  <tr>
                  <th class="center">Date</th>
                  <th>Order Id</th>
                  <th>Description</th>
                  <th class="center">Quantity</th>
                  <th class="right">Sales amount</th>
                  <th class="right">Cost</th>
                  <th class="right">Gross Profit</th>
                  </tr>
                </thead>

                <tbody>

                  <tr>
                  <td class="center">19-09-2020 to 20-09-2020</td>
                  <td class="left strong">EF504546</td>
    
                  <td class="left">
                    <table>
                      <tr>
                        <td>Tunic (category)</td>
                        
                      </tr>
                      <tr>
                 
                        <td>Tote bags (category)</td>
                      </tr>
                      <tr>
                        <td>Total</td>
                      </tr>
               
                    </table>
                  </td>

                  <td class="right">
                    <table>

                      <tr>
                        <td>1 pcs</td>
          
                      </tr>
                       <tr>
           
                        <td>1 pcs</td>
                      </tr>
                        <tr>
                        <td>2 pcs</td>
                      </tr>
                 
                    </table>
                  </td>
                  <td class="center">
                    <table>

                      <tr>
                
                        <td>1000</td>
                      </tr>
                         <tr>
                        <td>1200</td>
                     
                      </tr>
                        <tr>
                        <td>2200</td>
                      </tr>
                      
                    </table>
                  </td>
                  <td class="right">
                    <table>

                      <tr>
                        <td>600</td>
                      
                      </tr>
                      <tr>
                    
                        <td>700</td>
                      </tr>
                        <tr>
                        <td>1300</td>
                      </tr>
                    </table>
                  </td>
                  <td class="right">
                    <table>

                      <tr>
                        <td>400tk</td>
                        
                      </tr>
                        <tr>
                       
                        <td>500tk</td>
                      </tr>
                        <tr>
                        <td>900tk</td>
                      </tr>

                    </table>
                  </td>

                
                  <!-- <td class="right">hello</td> -->
                  </tr>
               
              
                </tbody>
               
              </table>
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

