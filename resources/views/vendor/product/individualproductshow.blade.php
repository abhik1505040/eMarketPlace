@extends('layout.master')

@section('title', 'Individual Product')

@section('headertxt', 'Individual Product')
@push('styles')
<style media="screen">
li.page-item {
  display: inline-block;
}
</style>
@endpush


@section('content')
  <!-- sellers product content area start -->
  <div class="sellers-product-content-area">
      <div class="container">
          <div class="row">
              <div class="col-lg-12">
                  <div class="seller-product-wrapper">
                      <div class="seller-panel">
                          <div class="card-header clearfix">
                                  <h4 style="padding-top: 15px;" class="d-inline-block text-white">{{$product->title}}</h4>

                          </div>
                          <div class="sellers-product-inner">
                              <div class="bottom-content">
                                  <table class="table table-default" id="datatableOne">
                                      <thead>
                                          <tr>
                                              <th>Product</th>
                                              <th>Price</th>
                                              <th>quantity left</th>
                                              <th>Total Earnings</th>
                                              <th>Sales</th>
                                              <th>Rating</th>
                                              <th>&nbsp;</th>
                                          </tr>
                                      </thead>
                                      <tbody>

                                          @php
                                            // $totalearning = \App\Orderedproduct::where('shipping_status', 2)
                                            //                       ->where('refunded', '<>', 1)
                                            //                       ->where('product_id', $product->id)->sum('product_total');
                                            //      $imgs=  \App\PreviewImage::where('product_id', $product->id)->get();
                                            //      $review=  \App\ProductReview::where('product_id', $product->id)->get();
                                            //      $totalrating = 0;

                                            //         foreach($review as $r){
                                            //         $totalrating+=$r->rating;
                                            //         }

                                            $totalearning = 0;
                                            $totalrating = 0;




                                          @endphp
                                          <tr>
                                              <td>
                                                  <div class="single-product-item"><!-- single product item -->
                                                      <div class="thumb">
                                                     <a href="#">
                                                       @if($imgs!=null)
                                                       <img style="width:60px;" src="{{asset('assets/user/img/products/'.$imgs->first()->image)}}" alt="seller product image">
                                                       @endif
                                                     </a>
                                                      </div>
                                                      <div class="content">
                                                          <h4 class="title"><a target="_blank" href="#">{{strlen($product->title) > 28 ? substr($product->title, 0, 28) . '...' : $product->title}}</a></h4>
                                                      </div>
                                                  </div><!-- //.single product item -->
                                              </td>
                                              <td class="padding-top-40">
                                                @if (!empty($product->current_price))
                                                  <del>{{$gs->base_curr_symbol}} {{$product->price}}</del> <span class="text-secondary">{{$gs->base_curr_symbol}} {{$product->current_price}}</span>
                                                @else
                                                  <span>{{$gs->base_curr_symbol}} {{$product->price}}</span>
                                                @endif
                                              </td>
                                              <td class="padding-top-40">
                                                @if ($product->quantity==0)
                                                  <span class="badge badge-danger">Out of stock</span>
                                                @else
                                                         {{$product->quantity}}
                                                @endif
                                              </td>
                                              <td class="padding-top-40">{{$gs->base_curr_symbol}} {{$totalearning}}</td>
                                              <td class="padding-top-40">{{$product->sales}}</td>
                                              <td class="padding-top-40">

                                                    {{$totalrating}}
                                                 {{-- <ul class="action">
                                                     <li><a target="_blank" href="{{route('vendor.product.manage', [$product])}}"><i class="far fa-eye"></i></a></li>
                                                     <li><a target="_blank" href="{{route('vendor.product.manage', $product->id)}}"><i class="fas fa-pencil-alt"></i></a></li>
                                                      <li class="sp-close-btn"><a href="#" onclick="delproduct(event, {{$product->id}})"><i class="fas fa-times"></i></a></li>
                                                  </ul>--}}
                                              </td>
                                          </tr>

                                      </tbody>
                                  </table>
                              </div>
                              <div class="row">
                                <div class="col-md-12">
                                  <div class="text-center">
                                    {{--{{$products->links()}}--}}
                                  </div>
                                </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
         <div class="row">
              <div class="col-lg-4">
              </div>
               <div class="col-lg-4">
               @foreach($imgs as $img)
                <img style="width:400px;" src="{{asset('assets/user/img/products/'.$img->image)}}" alt="seller product image">
            @endforeach
            </div>
         </div>
      </div>
  </div>
  <!-- sellers product content area end -->
@endsection
