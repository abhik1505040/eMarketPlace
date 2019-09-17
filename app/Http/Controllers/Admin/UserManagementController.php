<?php

namespace App\Http\Controllers\Admin;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Session;


class UserManagementController extends Controller
{
    public function allUsers() {
      $data['users'] = User::orderBy('username', 'ASC')->paginate(15);
      $data['term'] = '';
      return view('admin.UserManagement.allUsers', $data);
    }

    public function allUsersSearchResult(Request $request) {
      $data['term'] = $request->term;
      $data['users'] = User::where('username', 'like', '%'.$request->term.'%')->orderBy('username', 'ASC')->paginate(15);
      return view('admin.UserManagement.allUsers',$data);
    }

    public function bannedUsers() {
      $data['term'] = '';
      $data['bannedUsers'] = User::where('status', 'blocked')->paginate(15);
      return view('admin.UserManagement.bannedUsers', $data);
    }

    public function bannedUsersSearchResult(Request $request) {
      $data['term'] = $request->term;
      $data['bannedUsers'] = User::where('username', 'like', '%'.$request->term.'%')->where('status', 'blocked')->paginate(15);
      return view('admin.UserManagement.bannedUsers',$data);
    }

    public function verifiedUsers() {
      $data['term'] = '';
      $data['verifiedUsers'] = User::where('email_verified', 1)->paginate(15);
      return view('admin.UserManagement.verifiedUsers', $data);
    }

    public function verUsersSearchResult(Request $request) {
      $data['term'] = $request->term;
      $data['verifiedUsers'] = User::where('username', 'like', '%'.$request->term.'%')->where('email_verified', 1)->orderBy('username', 'ASC')->paginate(15);
      return view('admin.UserManagement.verifiedUsers',$data);
    }


    public function emailUnverifiedUsers() {
      $data['term'] = '';
      $data['emailUnverifiedUsers'] = User::where('email_verified', 0)->paginate(15);
      return view('admin.UserManagement.emailUnverifiedUsers', $data);
    }

    public function emailUnverifiedUsersSearchResult(Request $request) {
      $data['term'] = $request->term;
      $data['emailUnverifiedUsers'] = User::where('username', 'like', '%'.$request->term.'%')->where('email_verified', 0)->orderBy('username', 'ASC')->paginate(15);
      return view('admin.UserManagement.emailUnverifiedUsers',$data);
    }

    public function userDetails($userID) {
      $data['user'] = User::find($userID);
      return view('admin.UserManagement.userDetails.userDetails', $data);
    }

    public function updateUserDetails (Request $request) {

      $user = User::find($request->userID);
      $user->first_name = $request->first_name;
      $user->last_name = $request->last_name;
      $user->email = $request->email;
      $user->phone = $request->phone;
      $prev = $user->status;
      $user->status = $request->status=='on'?'active':'blocked';
      $url = url('/')."/profile";

      if($prev!= $user->status && $user->status == 'blocked'){
        send_email($user->email, $user->username, 'Account blocked', "Your account has been blocked by the admin.", $url, "Your account");
      }


      $user->save();


      Session::flash('success', 'User details has been updated successfully!');

      return redirect()->back();
      // return $request->all();
    }



    public function emailToUser($userID) {
      $data['user'] = User::find($userID);
      return view('admin.UserManagement.userDetails.emailToUser', $data);
    }

    public function sendEmailToUser(Request $request) {
      $validatedData = $request->validate([
          'subject' => 'required',
          'message' => 'required'
      ]);
      $user = User::find($request->userID);
      $to = $user->email;
      $name = $user->name;
      $subject = $request->subject;
      $message = $request->message;
      $url = url('/')."/profile";
      send_email($user->email, $user->username, 'Verification Code', $message, $url, "Your account");
      Session::flash('success', 'Mail sent successfully!');
      return redirect()->back();
    }



    // public function mailtosubsc(Request $request) {
    //   $validatedRequest = $request->validate([
    //     'subject' => 'required',
    //     'message' => 'required'
    //   ]);
    //   $subscribers = Subscriber::all();
    //   foreach ($subscribers as $subscriber) {
    //     $to = $subscriber->email;
    //     $name = $subscriber->firstname;
    //     $subject = $request->subject;
    //     $message = $request->message;
    //     send_email( $to, $name, $subject, $message);
    //   }
    //   Session::flash('success', 'Mail sent to all subscribers.');
    //   return redirect()->back();
    // }
}
