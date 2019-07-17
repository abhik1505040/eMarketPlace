<div class="item_review_content">
    <h1 class="title">{{$product->vendor->shop_name}} &nbsp; <a href="{{route('vendor.shoppage', $product->vendor->id)}}" class="btn btn-outline-success " role="button" aria-pressed="true">Visit shop</a></h1>
    <ul class="product-specification"><!-- product specification -->
        <li>
            <div class="single-spec"><!-- single specification -->
                <span class="heading">Email</span>
                <span class="details">{{$product->vendor->email}}</span>
            </div>
        </li>
        <li>
            <div class="single-spec"><!-- single specification -->
                <span class="heading">Phone</span>
                <span class="details">{{$product->vendor->phone}}</span>
            </div>
        </li>
        <li>
            <div class="single-spec"><!-- single specification -->
                <span class="heading">Address</span>
                <span class="details">{{$product->vendor->address}}</span>
            </div>
        </li>
        {{-- <li>
            <div class="single-spec"><!-- single specification -->
                <span class="heading">Zip Code</span>
                <span class="details">{{$product->vendor->zip_code}}</span>
            </div>
        </li> --}}
        <li>
            <div class="single-spec"><!-- single specification -->
                <span class="heading">Total Products</span>
                <span class="details">{{$product->vendor->products()->where('deleted', 0)->count()}} </span>
            </div>
        </li>
    </ul><!-- //.product specification -->
</div>
