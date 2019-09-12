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
          foreach ($order->orderedproducts as $key => $op) {
            if (!in_array($op->vendor->id, $sentVendors)) {
              $sentVendors[] = $op->vendor->id;

              $orderurl = url('/')."/vendor"."/".$order->id."/orderdetails";

        send_email($op->vendor->email, $op->vendor->shop_name, 'Product delivery is in process', "Your products will reach the customer soon.<p><strong>Order number: </strong>".$order->unique_id."</p>", $orderurl, "Order Details");
            //   send_email($op->vendor->email, $op->vendor->shop_name, 'Product delivery is in process', "Your products will reach the customer soon.<p><strong>Order number: </strong>".$order->unique_id."</p> <p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
            }
          }
          // sending mail to user
        $orderurl = url('/')."/".$order->id."/orderdetails";

        send_email($order->user->email, $order->user->first_name, 'Product delivery is in process', "You will receive your order very soon.<p><strong>Order Number: </strong>$order->unique_id</p>", $orderurl, "Order Details");


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


        }

        // sending mails to vendor
        foreach ($order->orderedproducts as $key => $op) {
          if (!in_array($op->vendor->id, $sentVendors)) {
            $sentVendors[] = $op->vendor->id;

            $orderurl = url('/')."/vendor"."/".$order->id."/orderdetails";

        send_email($op->vendor->email, $op->vendor->shop_name, 'Products delivered', "Your products have reached customer.<p><strong>Order number: </strong>".$order->unique_id."</p>", $orderurl, "Order Details");

            // send_email($op->vendor->email, $op->vendor->shop_name, 'Products delivered', "Your products have reached customer.<p><strong>Order number: </strong>".$order->unique_id."</p> <p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
          }
        }


        // sending mail to user
        // send_email($order->user->email, $order->user->first_name, 'Products delivered', "Please leave a feedback on the order.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");

        $orderurl = url('/')."/".$order->id."/orderdetails";

        send_email($order->user->email, $order->user->first_name, 'Products delivered', "Please leave a feedback on the order.<p><strong>Order Number: </strong>$order->unique_id</p>", $orderurl, "Order Details");

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
          $orderurl = url('/')."/vendor"."/".$order->id."/orderdetails";

          send_email($op->vendor->email, $op->vendor->shop_name, 'New Order', "Order ID #".$order->unique_id." has been accepted.<p>", $orderurl, "Order Details");


        //   send_email($op->vendor->email, $op->vendor->shop_name, 'New Order', "Order ID #".$order->unique_id." has been accepted.<p><strong>Order details: </strong><a href='".url('/')."/vendor"."/".$order->id."/orderdetails'>".url('/')."/vendor"."/".$order->id."/orderdetails"."</a></p>");
        }
      }
      // sending mail to user
      $orderurl = url('/')."/".$order->id."/orderdetails";

        send_email($order->user->email, $order->user->first_name, 'Order accepted', "Your order has been accepted.<p><strong>Order Number: </strong>$order->unique_id</p>", $orderurl, "Order Details");

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
      $orderurl = url('/')."/".$order->id."/orderdetails";

        send_email($order->user->email, $order->user->first_name, 'Order rejected', "Your order has been rejected.<p><strong>Order Number: </strong>$order->unique_id</p>", $orderurl, "Order Details");
    //   send_email($order->user->email, $order->user->first_name, 'Order rejected', "Your order has been rejected.<p><strong>Order Number: </strong>$order->unique_id</p><p><strong>Order details: </strong><a href='".url('/')."/".$order->id."/orderdetails'>".url('/')."/".$order->id."/orderdetails"."</a></p>");
      return "success";
    }

    public function orderdetails($orderid) {
      $data['order'] = Order::find($orderid);
      $data['orderedproducts'] = Orderedproduct::where('order_id', $orderid)->get();
      return view('admin.orders.details', $data);
    }

}
