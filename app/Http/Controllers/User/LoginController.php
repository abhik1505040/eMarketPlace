<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
// use App\Provider;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Hash;
// use Laravel\Socialite\Facades\Socialite;
use App\Cart;
use Validator;
use Session;

class LoginController extends Controller
{
    protected $redirectTo = '/';

    protected $field = ['first_name', 'last_name', 'email', 'gender', 'birthday', 'location'];

    public function login() {
      return view('user.login');
    }

    public function authenticate(Request $request) {
        if (Auth::guard('vendor')->check()) {
          Session::flash('alert', 'You are already logged in as a vendor');
          return back();
        }

        $validatedRequest = $request->validate([
            'username' => 'required',
            'password' => 'required'
        ]);

        $user = User::where('username', $request->username)->first();
        if (Auth::attempt([
          'username' => $request->username,
          'password' => $request->password,
        ]))
        {
            $userId = Auth::user()->id;

            // if the guest Cart is containg any product...
            if (Cart::where('cart_id', session()->get('browserid'))->count() > 0) {
              foreach (Cart::where('cart_id', session()->get('browserid'))->get() as $guestcart) {
                // if the guest cart is containing a product which is already in the logged in user's Cart...
                if (Cart::where('cart_id', $userId)->where('product_id', $guestcart->product_id)->where('attributes', '[]')->count() > 0) {
                  // increase the product quantity in logged in user's cart...
                  $authcart = Cart::where('cart_id', $userId)->where('product_id', $guestcart->product_id)->first();
                  $authcart->quantity = $authcart->quantity + $guestcart->quantity;
                  $authcart->save();
                } else {
                  // replacing the the guest cart's cart_id with logged in users ID...
                  $guestcart->cart_id = $userId;
                  $guestcart->save();
                }
              }
              // clear browser cart
              Cart::where('cart_id', session()->get('browserid'))->delete();
            }


            return redirect()->intended(route('user.home'));
        } else {
            return back()->with('missmatch', 'Username/Password didn\'t match!');
        }
    }

    public function logout($id = null) {
      Auth::logout();
      if ($id) {
          $user = User::find($id);
          if ($user->status == 'blocked') {
              Session::flash('alert', 'Your account has been banned');
          }
      }
      session()->flash('message', 'Just Logged Out!');
      return redirect()->route('user.home');
    }


}
