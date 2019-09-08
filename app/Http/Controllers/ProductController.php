<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use App\Cart;
use App\Favorit;
use App\PreviewImage;
use App\ProductReview;
use App\Orderedproduct;
use Carbon\Carbon;
use Validator;
use Auth;
use Session;

class ProductController extends Controller
{
    public function show($slug=null, $id) {
      $today = new \Carbon\Carbon(Carbon::now());

      $data['product'] = Product::find($id);
      $data['sales'] = $data['product']->sales;
      $data['rproducts'] = Product::where('subcategory_id', $data['product']->subcategory_id)->where('deleted', 0)->inRandomOrder()->limit(10)->get();
      return view('product.show', $data);
    }

    public function showHearts($slug=null, $id) {
        $today = new \Carbon\Carbon(Carbon::now());
        $data['product'] = Product::find($id);
        $data['sales'] = $data['product']->sales;
        $data['rproducts'] = Product::where('subcategory_id', $data['product']->subcategory_id)->where('deleted', 0)->inRandomOrder()->limit(10)->get();
        return view('product.show', $data);
      }

    public function getcomments(Request $request) {
      $reviews = ProductReview::where('product_id', $request->product_id)->orderBy('id', 'DESC')->get();
      return $reviews;
    }

    public function reviewsubmit(Request $request) {

      $validator = Validator::make($request->all(), [
        'rating' => [
          function ($attribute, $value, $fail) {
              if (empty($value)) {
                  $fail('Rating is required');
              }
          },
        ]
      ]);

      if($validator->fails()) {
          // adding an extra field 'error'...
          $validator->errors()->add('error', 'true');
          return response()->json($validator->errors());
      }

      $productreview = new ProductReview;
      $productreview->user_id = Auth::user()->id;
      $productreview->product_id = $request->product_id;
      $productreview->rating = floatval($request->rating);
      $productreview->comment = $request->comment;
      $productreview->save();

      $product = Product::find($request->product_id);
      $product->avg_rating = ProductReview::where('product_id', $request->product_id)->avg('rating');
      $product->save();

      Session::flash('success', 'Reviewed successfully');

      return "success";
    }


    // add to cart...
    public function getproductdetails(Request $request) {
      if (Auth::check()) {
        $sessionid = Auth::user()->id;
      } else {
        $sessionid = session()->get('browserid');
      }

      // get details of the selected product
      $product = Product::find($request->productid);
      $preimg = PreviewImage::where('product_id', $product->id)->first();
      $product['preimg'] = $preimg->image;


      // if this product is already in the cart then just update the quantity...
      if (Cart::where('cart_id', $sessionid)->where('product_id', $product->id)->count() > 0) {
        $cart = Cart::where('cart_id', $sessionid)->where('product_id', $product->id)->first();
        $cart->quantity = $cart->quantity + 1;
        $cart->save();
        return response()->json(['status'=>'quantityincr', 'productid'=>$product->id, 'quantity'=>$cart->quantity]);
      }


      // if a new product is added to cart
      $cart = new Cart;
      $cart->cart_id = $sessionid;
      $cart->product_id = $product->id;
      $cart->title = $product->title;
      $cart->price = $product->price;
      $cart->quantity = $request->quantity;
      $cart->save();

      $product['quantity'] = $request->quantity;
      return response()->json(['status'=>'productadded', 'product'=>$product, 'quantity'=>$product['quantity']]);
    }

    public function favorit(Request $request) {
      $count = Favorit::where('user_id', Auth::user()->id)->where('product_id', $request->productid)->count();
      if ($count > 0) {
        Favorit::where('user_id', Auth::user()->id)->where('product_id', $request->productid)->delete();
        return "unfavorit";
      } else {
        $favorit = new Favorit;
        $favorit->user_id = Auth::user()->id;
        $favorit->product_id = $request->productid;
        $favorit->save();
        return "favorit";
      }
    }

    public function productratings($pid) {
      $prs = ProductReview::where('product_id', $pid)->get();
      return $prs;
    }

    public function vendorProductratings($vid){
        $ids = ProductReview::join('products', 'product_reviews.product_id', '=', 'products.id')->where('products.vendor_id', $vid)->orderBy('products.id', 'DESC')->select('product_reviews.id')->get();

        $reviewIDs=[];
        foreach($ids as $key => $reviewID){
            $reviewIDs[] = $reviewID->id;
        }

        $reviews = ProductReview::whereIn('id', $reviewIDs)->get();
        // return $reviews->count();
        return $reviews;
    }

    public function avgrating($pid) {
      $avgrating = ProductReview::where('product_id', $pid)->avg('rating');
      if (empty($avgrating)) {
        $avgrating = 0;
      }
      return $avgrating;
    }
}
