<?php 
use App\Model\front\Order_item;
?>
@extends('admin.layouts.master')
@section('content')
<div class="content-wrapper" style="min-height: 1203.6px;">

    <!-- Main content -->
    <section class="content mt-5">
      <div class="container">
        <div class="card">

          

          <div class="card-body">
           

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
                  </tr>
                </thead>
                <tbody>
                  <tr>
                  <td class="center">1</td>
                  <td class="left strong"></td>
                  <td class="left">
                    <table>
                      <tr>
                        <td> </td>
                      </tr>
               
                    </table>
                  </td>

                  <td class="right">
                    <table>

                      <tr>
                        <td>Red</td>
                      </tr>
                 
                    </table>
                  </td>
                  <td class="center">
                    <table>

                      <tr>
                        <td>5</td>
                      </tr>
                      
                    </table>
                  </td>
                  <td class="right"><table>

                      <tr>
                        <td>mobile</td>
                      </tr>

                    </table></td>
                  <td class="right">uttara</td>
                  <td class="right">132343546578</td>
                  <td class="right">243354</td>

                  </tr>
               
              
                </tbody>
               
              </table>
            </div>

       

          </div>
        </div>
      </div>
<button onclick="window.print()">Print this page</button>
    </section>

      </div>
   

@endsection

@section('js')

@endsection