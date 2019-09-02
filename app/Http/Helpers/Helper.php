<?php
use App\GeneralSetting as GS;
use App\Ad;
use App\Cart;
use App\Coupon;


if (! function_exists('send_email')) {

    function send_email( $to, $name, $subject, $message)
    {
        $settings = GS::first();
        $template = $settings->email_template;
        $from = $settings->email_sent_from;
    		if($settings->email_notification == 1)
    		{

                $headers = "From: $settings->website_title <$from> \r\n";
                $headers .= "Reply-To: $settings->website_title <$from> \r\n";
                $headers .= "MIME-Version: 1.0\r\n";
                $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";

                $mm = str_replace("{{name}}",$name,$template);
                $message = str_replace("{{message}}",$message,$mm);

                mail($to, $subject, $message, $headers);

    		}

    }
}



// if(!function_exists('show_ad')) {
//     function show_ad($size) {
//         $ad = Ad::where('size', $size)->inRandomOrder()->first();
//         if($ad !=null){
//         $ad->impression = $ad->impression + 1;
//         $ad->save();
//         if (!empty($ad)) {
//             if($size == 1){
//                 $maxwd = '350px';
//             }elseif($size == 3){
//                 $maxwd = '255px';
//             }

//           if ($ad->type == 1) {
//             return '<a target="_blank" href="'.$ad->url.'" onclick="increaseAdView('.$ad->id.')"><img src="'.url('/').'/assets/user/ad_images/'.$ad->image.'" alt="Ad" style="width:100%; max-width:'.$maxwd.';"/></a>';
//           }
//           if($ad->type == 2) {
//               return $ad->script;
//           }
//         } else {
//           return '';
//         }
//     }
// }

// }

if(!function_exists('product_code')) {
  function product_code($limit)
  {
    return substr(base_convert(sha1(uniqid(mt_rand())), 16, 36), 0, $limit);
  }
}



if(!function_exists("checkString_e")) {
    function checkString_e($value) {
        $myvalue = ltrim($value);
        $myvalue = rtrim($myvalue);
        if ($myvalue == 'null')
            $myvalue = '';
        return $myvalue;
    }
}





// if(!function_exists("getArray2Str")) {
//     function getArray2Str($arrayList) {
//         $findme   = 'REFUND';
//         $findmepipe = '|';
//         $paramStr = "";
//         $flag = 1;
//         foreach ($arrayList as $key => $value) {
//             $pos = strpos($value, $findme);
//             $pospipe = strpos($value, $findmepipe);
//             if ($pos !== false || $pospipe !== false)
//             {
//                 continue;
//             }

//             if ($flag) {
//                 $paramStr .= checkString_e($value);
//                 $flag = 0;
//             } else {
//                 $paramStr .= "|" . checkString_e($value);
//             }
//         }
//         return $paramStr;
//     }
// }

// if(!function_exists("getArray2StrForVerify")) {
//     function getArray2StrForVerify($arrayList) {
//         $paramStr = "";
//         $flag = 1;
//         foreach ($arrayList as $key => $value) {
//             if ($flag) {
//                 $paramStr .= checkString_e($value);
//                 $flag = 0;
//             } else {
//                 $paramStr .= "|" . checkString_e($value);
//             }
//         }
//         return $paramStr;
//     }
// }




if(!function_exists("getPriceSum")) {
  function getPriceSum($cartid, $productid) {
    $cart = Cart::where('cart_id', $cartid)->where('product_id', $productid)->first();
    $priceSum = $cart->price*$cart->quantity;
    return $priceSum;
  }
}

if(!function_exists("getSubTotal")) {
  function getSubTotal($cartid) {

    $cartItems = Cart::where('cart_id', $cartid)->get();
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
    if(session()->has('coupon_code') && Coupon::where('coupon_code', $coupon)->count() == 1){
      $cdetails = Coupon::where('coupon_code', $coupon)->latest()->first();
      if ($cdetails->coupon_type == 'percentage'){
        $char = ($amo*$cdetails->coupon_amount)/100;
      }else{
        if($cdetails->coupon_min_amount <= $amo){
          $char = $cdetails->coupon_amount;
        }
      }
    }
    $subtotal = $amo - $char;

    return round($subtotal, 2);
  }
}

if(!function_exists("getTotal")) {
  function getTotal($cartid) {
    $subtotal = getSubTotal($cartid);
    $gs = GS::first();

    $total =  $subtotal + (($gs->tax*$subtotal)/100);
    $total = $total+$gs->shipping_charge;

    return round($total, 2);
  }
}
