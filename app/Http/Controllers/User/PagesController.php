<?php
namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\GeneralSetting as GS;
use App\Product;
use App\ProductReview;
use App\Orderedproduct;
use Carbon\Carbon;
use Cart;
use Auth;
use DB;
use Session;
use Validator;
use App\Slider;

class PagesController extends Controller
{
    public function home() {
      // return session()->get('browserid');
      $gs = GS::first();
      $data['lproducts'] = Product::where('deleted', 0)->orderBy('id', 'DESC')->limit(8)->get();


      // fetch top sold products
      $topSoldPros = Product::where('deleted', 0)->orderBy('sales', 'DESC')->limit(8)->get();
      $data['topSoldPros'] = $topSoldPros;

      // fetch top rated products
      $topRatedPros = Product::where('deleted', 0)->orderBy('avg_rating', 'DESC')->limit(8)->get();
      $data['topRatedPros'] = $topRatedPros;


      // fetch special products
      $data['specialPros'] = Product::whereNotNull('current_price')->where('deleted', 0)->orderBy('id', 'DESC')->limit(8)->get();

      // fetch recent products
      $data['latestPros'] = Product::where('deleted', 0)->orderBy('id', 'DESC')->limit(8)->get();

      $data['sliders'] = Slider::orderBy('created_at', 'DESC')->get();


    //   $data['dummy'] = 'dummy';
      return view('user.home', $data);

    }

    public function bestsellers() {
        $data['products'] = Product::orderBy('sales', 'DESC')->limit(12)->get();
      return view('user.best_seller', $data);
    }

    public function contact() {
      return view('user.contact');
    }


    public function contactMail(Request $request) {
      $validatedRequest = $request->validate([
        'name' => 'required',
        'email' => 'required',
        'subject' => 'required',
        'message' => 'required',
      ]);

      $gs = GS::first();
      $from = $request->email;
      $to = $gs->email_sent_from;
      $subject = $request->subject;
      $name = $request->name;
      $message = nl2br($request->message . "<br /><br />From <strong>" . $name . "</strong>");


      $headers = "From: $name <$from> \r\n";
      $headers .= "Reply-To: $name <$from> \r\n";
      $headers .= "MIME-Version: 1.0\r\n";
      $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";


       mail($to, $subject, $message, $headers);
      Session::flash('success', 'Mail sent successfully!');
      return redirect()->back();
    }




}
