<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Order;
use App\Coupon;
use App\UsedCoupon;
use App\Product;
use App\Orderedproduct;
use App\GeneralSetting as GS;
use Carbon\Carbon;
use Auth;
use App\Cart;
use Session;
use Validator;

class CheckoutController extends Controller
{
    public function index() {
      $gs = GS::first();
      if (Auth::check()) {
        $sessionid = Auth::user()->id;
        // $tmp = session()->get('browserid');
        // Cart::where('cart_id', '=', $tmp) ->update(['cart_id' => $sessionid]);
      } else {
        $sessionid = session()->get('browserid');
      }
    //   if (empty($gs->coupon_code)) {
    //     if (CartCoupon::where('cart_id', Auth::user()->id)->count() > 0) {
    //       CartCoupon::where('cart_id', Auth::user()->id)->first()->delete();
    //     }
    //   }
      $cartItems = Cart::where('cart_id', Auth::user()->id)->get();
      $data['cartItems'] = $cartItems;
      $amo = 0;
      foreach ($cartItems as $item) {
        if (!empty($item->current_price)) {
          $amo += $item->current_price*$item->quantity;
        } else {
          $amo += $item->price*$item->quantity;
        }
      }

       $char = 0;
      $coupon = Session::get('coupon_code');
      if(isset($coupon) && Coupon::where('coupon_code', $coupon)->count() == 1){
        $cdetails = Coupon::where('coupon_code', $coupon)->latest()->first();
        $data['cdetails'] = $cdetails;
        if ($cdetails->coupon_type == 'percentage'){
          $char = ($amo*$cdetails->coupon_amount)/100;
        }else{
          if($cdetails->coupon_min_amount <= $amo){
            $char = $cdetails->coupon_amount;
          }
        }
      }
    //   // return $char;
      $data['char']= $char;
      $data['amount']= $amo;



      $data['user'] = User::find(Auth::user()->id);

      return view('user.checkout', $data);
    }


    public function couponvaliditycheck() {
      $today = new \Carbon\Carbon(Carbon::now());
      $coupons = Coupon::all();

      foreach ($coupons as $key => $coupon) {
        if ($today->gt(Carbon::parse($coupon->valid_till))) {
          if (session('coupon_code') == $coupon->coupon_code) {
            session()->forget('coupon_code');
          }
          $coupon->delete();
        }
      }


    }


    public function applycoupon(Request $request) {
      $gs = GS::first();

      $usedcoupon = UsedCoupon::where('coupon_code', $request->coupon_code)->where('user_id', Auth::user()->id)->count();
      if($usedcoupon > 0){
          return "Applied";
      }

      $cartItems = Cart::where('cart_id', Auth::user()->id)->get();
      $amo = 0;
      foreach ($cartItems as $item) {
        if (!empty($item->current_price)) {
          $amo += $item->current_price*$item->quantity;
        } else {
          $amo += $item->price*$item->quantity;
        }
      }


      $coupon = Coupon::where('coupon_code', $request->coupon_code)->first();

      $validator = Validator::make($request->all(), [
          'coupon_code' => [
              'required',
              function ($attribute, $value, $fail) use ($request, $amo, $coupon) {
                  if (Coupon::where('coupon_code', $request->coupon_code)->count() == 0) {
                    $fail("Coupon code didn't match!");
                  } else {
                    if ($coupon->coupon_type == 'fixed' && $coupon->coupon_min_amount >= $amo) {
                      $fail("Your minimum cart total must be ".$coupon->coupon_min_amount);
                    }
                  }
              },
          ]
      ]);

      if($validator->fails()) {
          // adding an extra field 'error'...
          $validator->errors()->add('error', 'true');
          return response()->json($validator->errors());
      }

      session()->forget('coupon_code');
      session()->put('coupon_code', $request->coupon_code);
      $csession = session('coupon_code');

      $cdetails = Coupon::where('coupon_code', $csession)->first();
      $ctotal = 0;
      if (session()->has('coupon_code') && !empty($cdetails)) {
        if ($cdetails->coupon_type == 'percentage') {
          $ctotal = ($cdetails->coupon_amount * $amo)/100;
        } else {
          $ctotal = $cdetails->coupon_amount;
        }
      }

      $subtotal = getSubTotal(Auth::user()->id);
      $total = getTotal(Auth::user()->id);

      return response()->json(['total'=>$total, 'subtotal'=>$subtotal, 'ctotal'=>$ctotal]);

    }

    public function placeorder(Request $request) {
      $gs = GS::first();

      // return $request;
      $request->validate([
        'first_name' => 'required',
        'last_name' => 'required',
        'phone' => 'required',
        'email' => 'required',
        'address' => 'required',
        'city' => 'required',
        'zip_code' => 'required'
      ]);

      if (Cart::where('cart_id', Auth::user()->id)->count() == 0) {
        Session::flash('alert', 'No product added to cart!');
        return back();
      }

      $gs = GS::first();

      //updating user table
      $user = User::find(Auth::user()->id);
      if (empty($user->first_name)) {
        $dat['first_name'] = $request->first_name;
        $dat['last_name'] = $request->last_name;
        // $dat['phone'] = $request->phone;
        // $dat['email'] = $request->email;
        $dat['address'] = $request->address;
        $dat['city'] = $request->city;
        $dat['zip_code'] = $request->zip_code;

        $user->fill($dat)->save();
      }


      // store in order table
      // $in = $request->except('_token', 'coupon_code', 'terms', 'terms_helper');
      $in['user_id'] = Auth::user()->id;
      $in['phone'] = $request->phone;
      $in['address'] = $request->address;
      $in['city'] = $request->city;
      $in['zip_code'] = $request->zip_code;
      $in['order_notes'] = $request->order_notes;
      $in['subtotal'] = getSubTotal(Auth::user()->id);
      $in['total'] = getTotal(Auth::user()->id);

      $order = Order::create($in);
      $order->unique_id = $order->id + 100000;
      $order->save();



      $carts = Cart::where('cart_id', Auth::user()->id)->get();


      // store products in orderedproducts table
      foreach($carts as $cart) {
        $product = Product::select('vendor_id')->where('id', $cart->product_id)->first();
        $op = new Orderedproduct;
        $op->user_id = Auth::user()->id;
        $op->order_id = $order->id;
        $op->vendor_id = $product->vendor_id;
        $op->product_id = $cart->product_id;
        $op->product_name = $cart->title;
        $op->product_price = $cart->price;
        $op->offered_product_price = $cart->current_price;

        $op->attributes = $cart->attributes;

        $cartItemCoupon = 0;
        $producttotal = 0;
        if (session()->has('coupon_code') && Coupon::where('coupon_code', session('coupon_code'))->count()==1) {
          $csession = session('coupon_code');
          $coupon = Coupon::where('coupon_code', $csession)->first();



          if ($coupon->coupon_type=='percentage') {
            // if coupon type is percentage

            if (empty($cart->current_price)) {
              // if the product has no offer...
              $cartItemTotal = $cart->quantity*$cart->price;
              $cartItemCoupon = ($cartItemTotal*$coupon->coupon_amount)/100;
              $producttotal = $cartItemTotal - $cartItemCoupon;
            } else {
              // if the product has offer...
              $cartItemTotal = $cart->quantity*$cart->current_price;
              $cartItemCoupon = ($cartItemTotal*$coupon->coupon_amount)/100;
              $producttotal = $cartItemTotal - $cartItemCoupon;
            }

          }
          else {
            // if coupon type is fixed

            $cartItems = Cart::where('cart_id', Auth::user()->id)->get();
            $amo = 0;
            foreach ($cartItems as $item) {
              if (!empty($item->current_price)) {
                $amo += $item->current_price*$item->quantity;
              } else {
                $amo += $item->price*$item->quantity;
              }
            }

            $charpertaka = $coupon->coupon_amount/$amo;


            if (empty($cart->current_price)) {
              $cartItemTotal = $cart->quantity*$cart->price;
              $cartItemCoupon = $cartItemTotal*$charpertaka;
              $producttotal = $cartItemTotal-$cartItemCoupon;
            } else {
              $cartItemTotal = $cart->quantity*$cart->current_price;
              $cartItemCoupon = $cartItemTotal*$charpertaka;
              $producttotal = $cartItemTotal-$cartItemCoupon;
            }

          }
        } else {
          if (empty($cart->current_price)) {
            // if cart item has no offer

            $producttotal = $cart->price*$cart->quantity;
            $cartItemCoupon = 0;
          } else {
            // if cart item has offer

            $producttotal = $cart->current_price*$cart->quantity;
            $cartItemCoupon = 0;
          }
        }


        $op->quantity = $cart->quantity;
        $op->product_total = $producttotal;
        $op->coupon_amount = $cartItemCoupon;
        $op->comment_status = 0;
        $op->save();
      }


    if (session()->has('coupon_code') && Coupon::where('coupon_code', session('coupon_code'))->count()==1){
        $couponused = new UsedCoupon;
        $couponused->coupon_code = session('coupon_code');
        $couponused->user_id = Auth::user()->id;
        $couponused->save();
        session()->forget('coupon_code');
      }
        // clear cart...
        Cart::where('cart_id', Auth::user()->id)->delete();
        // $message = "Your order has been placed successfully! Our agent will contact with you later. <br><strong>Order ID: </strong> " . $order->unique_id ."<p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>";
        // send_email( $order->user->email, $order->user->first_name, "Order placed", $message);
        Session::flash('success', 'Order placed successfully! We will contact you soon.');
        return redirect()->route('user.orders');


    }

    public function success() {
      return view('user.order_success');
    }
}
