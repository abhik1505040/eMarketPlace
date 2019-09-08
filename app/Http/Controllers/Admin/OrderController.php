<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\GeneralSetting as GS;
use App\Order;
use App\Orderedproduct;
use App\Product;
use App\Vendor;
use Carbon\Carbon;


class OrderController extends Controller
{
    public function all(Request $request) {
      if (empty($request->term)) {
        $data['term'] = '';
        $data['orders'] = Order::orderBy('id', 'DESC')->paginate(10);
      } else {
        $data['term'] = $request->term;
        $data['orders'] = Order::where('unique_id', $request->term)->orderBy('id', 'DESC')->paginate(10);
      }

      return view('admin.orders.index', $data);
    }

    public function cPendingOrders(Request $request) {
      if (empty($request->term)) {
        $data['term'] = '';
        $data['orders'] = Order::where('approve', 0)->orderBy('id', 'DESC')->paginate(10);
      } else {
        $data['term'] = $request->term;
        $data['orders'] = Order::where('approve', 0)->where('unique_id', $request->term)->orderBy('id', 'DESC')->paginate(10);
      }
      return view('admin.orders.index', $data);
    }

    public function cAcceptedOrders(Request $request) {
      if (empty($request->term)) {
        $data['term'] = '';
        $data['orders'] = Order::where('approve', 1)->orderBy('id', 'DESC')->paginate(10);
      } else {
        $data['term'] = $request->term;
        $data['orders'] = Order::where('approve', 1)->where('unique_id', $request->term)->orderBy('id', 'DESC')->paginate(10);
      }
      return view('admin.orders.index', $data);
    }

    public function cRejectedOrders(Request $request) {
      if (empty($request->term)) {
        $data['term'] = '';
        $data['orders'] = Order::where('approve', -1)->orderBy('id', 'DESC')->paginate(10);
      } else {
        $data['term'] = $request->term;
        $data['orders'] = Order::where('approve', -1)->where('unique_id', $request->term)->orderBy('id', 'DESC')->paginate(10);
      }
      return view('admin.orders.index', $data);
    }

    public function pendingDelivery(Request $request) {
      if (empty($request->term)) {
        $data['term'] = '';
        $data['orders'] = Order::where('shipping_status', 0)->where('approve', 1)->orderBy('id', 'DESC')->paginate(10);
      } else {
        $data['term'] = $request->term;
        $data['orders'] = Order::where('shipping_status', 0)->where('approve', 1)->where('unique_id', $request->term)->orderBy('id', 'DESC')->paginate(10);
      }
      return view('admin.orders.index', $data);
    }

    public function pendingInprocess(Request $request) {
      if (empty($request->term)) {
        $data['term'] = '';
        $data['orders'] = Order::where('shipping_status', 1)->orderBy('id', 'DESC')->paginate(10);
      } else {
        $data['term'] = $request->term;
        $data['orders'] = Order::where('shipping_status', 1)->where('unique_id', $request->term)->orderBy('id', 'DESC')->paginate(10);
      }
      return view('admin.orders.index', $data);
    }

    public function delivered(Request $request) {
      if (empty($request->term)) {
        $data['term'] = '';
        $data['orders'] = Order::where('shipping_status', 2)->orderBy('id', 'DESC')->paginate(10);
      } else {
        $data['term'] = $request->term;
        $data['orders'] = Order::where('shipping_status', 2)->where('unique_id', $request->term)->orderBy('id', 'DESC')->paginate(10);
      }
      return view('admin.orders.index', $data);
    }




    public function shippingchange(Request $request) {
      $gs = GS::first();

      $order = Order::find($request->orderid);
      $order->shipping_status = $request->value;
      $order->save();

      $ops = Orderedproduct::where('order_id', $order->id)->get();

      foreach ($ops as $key => $op) {
        $op = Orderedproduct::find($op->id);
        $op->shipping_status = $request->value;
        $op->save();
      }

      $sentVendors = [];


      // if order is in process
      if ($order->shipping_status == 1) {
        // if in main city
        //if ($order->shipping_method == 'in') {
          // sending mails to vendor
          foreach ($order->orderedproducts as $key => $op) {
            if (!in_array($op->vendor->id, $sentVendors)) {
              $sentVendors[] = $op->vendor->id;
            //   send_email($op->vendor->email, $op->vendor->shop_name, 'Product delivery is in process', "Your products will reach the customer soon.<p><strong>Order number: </strong>".$order->unique_id."</p> <p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
            }
          }
          // sending mail to user
        // send_email($order->user->email, $order->user->first_name, 'Product delivery is in process', "You will receive your order very soon.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");

        //}
        // if in around main city
        // elseif ($order->shipping_method == 'around') {
        //   // sending mails to vendor
        //   foreach ($order->orderedproducts as $key => $op) {
        //     if (!in_array($op->vendor->id, $sentVendors)) {
        //       $sentVendors[] = $op->vendor->id;
        //       send_email($op->vendor->email, $op->vendor->shop_name, 'Product delivery is in process', "Thanks for sending your products. We will send these products to customer via courier within ".$gs->am_min." to ".$gs->am_max." days.<p><strong>Order number: </strong>".$order->unique_id."</p> <p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
        //     }
        //   }

        //   // sending mail to user
        //   send_email($order->user->email, $order->user->first_name, 'Product delivery is in process', "Your product delivery is in process. We have collected products from vendors and will send to you via courier within ".$gs->am_min." to ".$gs->am_max." days.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");

        // }
        // if in around world
        // elseif ($order->shipping_method == 'world') {
        //   // sending mails to vendor
        //   foreach ($order->orderedproducts as $key => $op) {
        //     if (!in_array($op->vendor->id, $sentVendors)) {
        //       $sentVendors[] = $op->vendor->id;
        //       send_email($op->vendor->email, $op->vendor->shop_name, 'Product delivery is in process', "Thanks for sending your products. We will send these products to customer via courier within ".$gs->aw_min." to ".$gs->aw_max." days.<p><strong>Order number: </strong>".$order->unique_id."</p> <p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
        //     }
        //   }
        //   // sending mail to user
        //   send_email($order->user->email, $order->user->first_name, 'Product delivery is in process', "Your product delivery is in process. We have collected products from vendors and will send to you via courier within ".$gs->aw_min." to ".$gs->aw_max." days.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");

        // }
      }
      // if order  is shipped
      elseif ($order->shipping_status == 2) {
        $orderedproducts = Orderedproduct::where('order_id', $order->id)->get();
        foreach ($orderedproducts as $key => $orderedproduct) {
          $today = Carbon::now();
          $orderedproduct->shipping_date = $today;
          $orderedproduct->save();

          // increase product sales
          $product = Product::find($orderedproduct->product_id);
          $product->sales = $product->sales + $orderedproduct->quantity;
          $product->save();

        //   $vendor = Vendor::find($orderedproduct->vendor_id);
        //   $vendor->balance = $vendor->balance + $orderedproduct->product_total;
        //   $vendor->save();

        //   $tr = new Transaction;
        //   $tr->vendor_id = $orderedproduct->vendor_id;
        //   $tr->details = "Sold  <strong>" . $orderedproduct->product->title . "</strong>";
        //   $tr->amount = $orderedproduct->product_total;
        //   $tr->trx_id = str_random(16);
        //   $tr->after_balance = $vendor->balance + $orderedproduct->product_total;
        //   $tr->save();
        }

        // sending mails to vendor
        foreach ($order->orderedproducts as $key => $op) {
          if (!in_array($op->vendor->id, $sentVendors)) {
            $sentVendors[] = $op->vendor->id;
            // send_email($op->vendor->email, $op->vendor->shop_name, 'Products delivered', "Your products have reached customer.<p><strong>Order number: </strong>".$order->unique_id."</p> <p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
          }
        }

        // sending mail to user
        // send_email($order->user->email, $order->user->first_name, 'Products delivered', "Please leave a feedback on the order.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");

      }


      return "success";
    }

    public function acceptOrder(Request $request) {
      $order = Order::find($request->orderid);
      $order->approve = 1;
      $order->save();


      $ops = Orderedproduct::where('order_id', $order->id)->get();
      foreach ($ops as $key => $op) {
        $nop = Orderedproduct::find($op->id);
        $nop->approve = 1;
        $nop->save();
      }


      $sentVendors = [];

      // sending mails to vendor
      foreach ($order->orderedproducts as $key => $op) {
        if (!in_array($op->vendor->id, $sentVendors)) {
          $sentVendors[] = $op->vendor->id;
        //   send_email($op->vendor->email, $op->vendor->shop_name, 'New Order', "Order ID #".$order->unique_id." has been accepted.<p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
        }
      }
      // sending mail to user
    //   send_email($order->user->email, $order->user->first_name, 'Order accepted', "Your order has been accepted.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");
      return "success";
    }

    public function cancelOrder(Request $request) {
      $order = Order::find($request->orderid);
      $order->approve = -1;
      $order->save();

      $sentVendors = [];
      // sending mails to vendor
      foreach ($order->orderedproducts as $key => $op) {
        if (!in_array($op->vendor->id, $sentVendors)) {
          $sentVendors[] = $op->vendor->id;

          //send_email($op->vendor->email, $op->vendor->shop_name, 'Order rejected', "Order ID #".$order->unique_id." has been rejected.<p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
        }
      }
      // sending mail to user
    //   send_email($order->user->email, $order->user->first_name, 'Order rejected', "Your order has been rejected.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");
      return "success";
    }

    public function orderdetails($orderid) {
      $data['order'] = Order::find($orderid);
      $data['orderedproducts'] = Orderedproduct::where('order_id', $orderid)->get();
      return view('admin.orders.details', $data);
    }

}
