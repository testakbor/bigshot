<ul class="wrapper cf mt-3">
          @php
          $rprice=0;
          $sprice=0;
          $image='';
          @endphp
          @foreach($products as $item)
          @foreach ($item->productMeta as $meta)
          @if($meta['meta_key']=='regular_price')
          @php
          $rprice=$meta['meta_value'];
          @endphp
          @endif

          @if($meta['meta_key']=='sale_price')
          @php
          $sprice=$meta['meta_value'];
          @endphp
          @endif

          @if($meta['meta_key']=='attached_file')
          @php
          $image=$meta['meta_value'];
          @endphp
          @endif
          @endforeach

          <li class="product fl-l">
            <a href="{{route('product-page',$item->ID)}}">
              <div class="container-prod">
                <div class="image" style="background-image:url({{asset('backend/products/'.$image)}});">
                </div>
                <div class="container-information">
                  <div class="title">
                    <p> {{$item->post_title}}
                      <span class="text-dark ml-2">@if($rprice) <del>৳{{$rprice}}</del> @endif ৳{{$sprice}}</span></p>

                  </div>
                </div>

                <div class="buttons cf">
                  <span style="margin-left: 3px;font-size: 12px;">
                    <!-- <span class="add ml-2">20,000+ bought this</span> -->
                  </span>

                </div>
              </div>
            </a>
          </li>
          @endforeach
        </ul>