<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Favorit;
use App\Order;
use App\Orderedproduct;
use Auth;
use Hash;
use Validator;
use Session;

class ProfileController extends Controller
{
    public function profile() {
      return view('user.profile');
    }

    public function infoupdate(Request $request) {
      $request->validate([
        'first_name' => 'required',
        'last_name' => 'required',
        'gender' => 'required',
        'date_of_birth' => 'required',
        'phone' => 'required',
        'city' => 'required',
        'zip_code' => 'required',
        'address' => 'required',
      ]);

      $in = $request->except('_token');
      $user = User::find(Auth::user()->id);
      $in['first_name'] = $request->first_name;
      $in['last_name'] = $request->last_name;
      $in['gender'] = $request->gender;
      $in['date_of_birth'] = $request->date_of_birth;
      $in['phone'] = $request->phone;
      $in['city'] = $request->city;
      $in['zip_code'] = $request->zip_code;
      $in['address'] = $request->address;

      $user->fill($in)->save();

      Session::flash('success', 'Informations updated successfully');
      return back();
    }

    public function changepassword() {
      return view('user.password');
    }

    public function updatePassword(Request $request) {
        $messages = [
            'password.required' => 'The new password field is required',
            'password.confirmed' => "Password does'nt match"
        ];

        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            'password' => 'required|confirmed'
        ], $messages);
        // if given old password matches with the password of this authenticated user...
        if(Hash::check($request->old_password, Auth::user()->password)) {
            $oldPassMatch = 'matched';
        } else {
            $oldPassMatch = 'not_matched';
        }
        if ($validator->fails() || $oldPassMatch=='not_matched') {
            if($oldPassMatch == 'not_matched') {
              $validator->errors()->add('oldPassMatch', true);
            }
            return redirect()->back()->withErrors($validator);
        }

        // updating password in database...
        $user = User::find(Auth::user()->id);
        $user->password = bcrypt($request->password);
        $user->save();

        Session::flash('success', 'Password changed successfully!');

        return redirect()->back();
    }



    public function wishlist() {
      $data['user'] = User::find(Auth::user()->id);
      return view('user.wishlist', $data);
    }

    public function orders(Request $request) {
      // return $request;
      if ($request->order_number) {
        $data['on'] = $request->order_number;
        $data['orders'] = Order::orderBy('id', 'DESC')->where('unique_id', $request->order_number)->paginate(10);
      } else {
        $data['on'] = '';
        $data['orders'] = Order::where('user_id', Auth::user()->id)->orderBy('id', 'DESC')->paginate(10);
      }

      return view('user.order.orders', $data);
    }

    public function orderdetails($orderid) {
      $data['order'] = Order::find($orderid);
      $data['orderedproducts'] = Orderedproduct::where('order_id', $orderid)->get();
      $data['subtotal'] = 0;
      $data['ccharge'] = 0;
      foreach ($data['orderedproducts'] as $op) {
        $data['ccharge'] += $op->coupon_amount;
      }

      if($data['order']->shipping_status == 2) {
        session()->flash('message', 'Consider leaving a public review on the product page(s) and feedback(s) on the order.');
      }
      return view('user.order.details', $data);
    }

    public function complain(Request $request) {
      $request->validate([
        'comment_type' => 'required',
        'comment' => 'required'
      ]);

      $op = Orderedproduct::find($request->opid);
      $op->comment_type = $request->comment_type;
      $op->comment = $request->comment;
      $op->save();
      Session::flash('success', 'Thank you for your feedback.');
      return "success";
    }







}
