{{-- {{DebugBar::info($reviews)}}; --}}


@extends('layout.master')

@section('title', 'Reviews')

@section('headertxt', 'Reviews')

@push('styles')

<style media="screen">
        div.ratingpro {
            display: inline-block;
        }
        .product-details-slider.owl-carousel .owl-item img {
          width: auto;
        }
        @media only screen and (max-width: 575px) {
          .product-details-slider.owl-carousel .owl-item img {
            width: 100%;
          }
        }
</style>
<link rel="stylesheet" href="{{asset('assets/user/css/comments.css')}}">
<link rel="stylesheet" href="{{asset('assets/user/css/easyzoom.css')}}">
  <style media="screen">
  /* search page css */
  .product-img img {
    width: 100%;
  }
  .thumb img {
      max-width: 70px;
      float: left;
      margin-right: 20px;
  }
  ul.subcategories {
      padding-left: 20px;
      display: none;
  }
  ul.subcategories.open {
    display: block;
  }
  .category-btn {
      display: block;
  }
  .subcategories a {
      display: block;
      cursor: pointer;
  }
  .js-input-from.form-control, .js-input-to.form-control {
      width: 24%;
  }

  .js-input-from.form-control {
      margin-right: 4%;
  }

  .category-content-area .category-compare {
      padding: 20px;
  }
  li.page-item {
      display: inline-block;
  }

  ul.pagination {
      width: 100%;
  }
  .shop-breadcrumb-inner .logo-wrapper {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-right: 25px;
      background-color: #fff;
  }

  .shop-breadcrumb-inner img.shop-logo {
      width: 100%;
      border-radius: 50%;
  }
  .shop-breadcrumb-inner {
      display: flex;
      justify-content: space-between;
      align-items: center;
  }
  .left-shop-header {
      display: flex;
      align-items: center;
  }
  .shop-breadcrumb-inner input[type="text"] {
      border: none;
      background-color: transparent;
      border-bottom: 1px solid #fff;
      color: #fff;
      width: 100%;
      padding-right: 30px;
      padding-bottom: 5px;
  }

  .shop-breadcrumb-inner button {
      background-color: transparent;
      border: none;
      outline: none;
      color: #fff;
      /* margin-right: 0px; */
      cursor: pointer;
      /* width: 17%; */
      position: absolute;
      right: -3px;
      top: -5px;
  }

  .right-shop-header {
      width: 250px;
  }

  .shop-breadcrumb-inner form {
      width: 100%;
      position: relative;
  }
  .shop-breadcrumb-inner input[type="text"]::placeholder {
      color: #fff;
  }
  .breadcrumb-area.extra {
      padding-bottom: 30px;
  }
  .breadcrumb-area {
      padding: 30px 0 110px 0;
  }

  </style>
<link rel="stylesheet" href="{{asset('assets/user/css/range-slider.css')}}">
@endpush

@section('content')
  <!-- category content area start -->
  <!-- category content area end -->
  <div class="product-details-content-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
  <div class="comments">

  @if ($reviews->count() == 0)
    <div class="card">
      <div class="card-body">
        <h3 class="text-center base-txt">No Review Given Yet</h3>
      </div>
    </div>

  @else
    <div class="row">
      <div class="col-md-12 text-center">
        <h2 class="mt-2" style="color:#f0932b">{{round($reviews->avg('rating'), 2)}}/5.0</h2>
        Based on {{$reviews->count()}} reviews
      </div>
    </div>

    {{-- {{DebugBar::info($reviews)}}; --}}
    <div id = "comments">
      @foreach ($reviews->get() as $productreview)
        <div class="comment-wrap">
           <div class="comment-block">

                <div class="thumb">
                        <img src="{{asset('assets/user/img/products/'.$productreview->product->previewimages()->first()->image)}}" alt="seller product image">
                    </div>
                <h3>{{ $productreview->user->username }} {{\Carbon\Carbon::now()}}</h3>

                    <div class="content" style="padding-top:0px;">
                        <h6><b>Product Link: </b> <a href="{{route('user.product.details', [$productreview->product->slug, $productreview->product->id])}}" target="_blank">{{strlen($productreview->product->title) > 25 ? substr($productreview->product->title, 0, 25) . '...' : $productreview->product->title}}</a></h6>
                    </div>


              <p class="comment-text">
                {{$productreview->comment}}
              </p>
              <div class="bottom-comment">
                 <div class="comment-date">{{date('M d, Y @ g:i A', strtotime($productreview->created_at))}}</div>
                 <ul class="comment-actions">
                    <div id="rateYo{{$productreview->id}}"></div>
                 </ul>
              </div>
           </div>
        </div>

      @endforeach

        </div>

       </div>
     </div>
   </div>
  </div>


  @endif
  {{-- <div class="text-center">
        {{$reviews->links()}}
      </div> --}}

</div>



@endsection
@push('scripts')
<script>
  $(document).ready(function() {
    $.get("{{route('vendor.productratings', $vendorid)}}", function(data){
      console.log(data);
      for (var i = 0; i < data.length; i++) {
        $("#rateYo"+data[i].id).rateYo({
          rating: data[i].rating,
          readOnly: true,
          starWidth: "16px"
        });
      }

    });
  });
</script>
@endpush


