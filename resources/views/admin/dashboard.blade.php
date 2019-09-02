@extends('admin.layout.master')

@push('styles')
  <style media="screen">
    a.info {
      text-decoration: none;
    }
  </style>
@endpush

@section('content')
  <main class="app-content">
    <div class="app-title">
      <div>
        <h1>Dashboard</h1>
      </div>
    </div>

    <div class="row">
      <div class="col-md-4 col-lg-4">
        <div class="widget-small primary coloured-icon"><i class="icon fa fa-users fa-3x"></i>
          <a class="info" href="#">
            <h4>TOTAL VERIFIED USERS</h4>
            <p><b>{{\App\User::where('email_verified', 1)->count()}}</b></p>
          </a>
        </div>
      </div>
      {{-- <div class="col-md-6 col-lg-4">
        <div class="widget-small info coloured-icon"><i class="icon fa fa-times fa-3x"></i>
          <a class="info" href="#">
            <h4>TOTAL VENDORS</h4>
            <p><b>{{\App\Vendor::count()}}</b></p>
          </a>
        </div>
      </div> --}}
      <div class="col-md-4 col-lg-4">
        <div class="widget-small warning coloured-icon"><i class="icon fa fa-check fa-3x"></i>
          <a class="info" href="#">
            <h4>TOTAL VERIFIED VENDORS</h4>
            <p><b>{{\App\Vendor::where('approved', 1)->count()}}</b></p>
          </a>
        </div>
     </div>

        <div class="col-md-6 col-lg-4">
                <div class="widget-small danger coloured-icon"><i class="icon fa fa-mobile fa-3x"></i>
                <a class="info" href="#">
                    <h4>TOTAL ORDERS DELIVERED</h4>
                    <p><b>{{\App\Order::where('shipping_status', 2)->count()}}</b></p>
                </a>
                </div>
        </div>
    </div>
    {{-- <div class="row">
      <div class="col-md-6 col-lg-4">
        <div class="widget-small danger coloured-icon"><i class="icon fa fa-mobile fa-3x"></i>
          <a class="info" href="{{route('admin.mobileUnverifiedUsers')}}">
            <h4>MOBILE UNVERIFIED USERS</h4>
            <p><b>{{\App\User::where('sms_verified', 0)->count()}}</b></p>
          </a>
        </div>
      </div>
      <div class="col-md-6 col-lg-4">
        <div class="widget-small danger coloured-icon"><i class="icon fa fa-envelope fa-3x"></i>
          <a class="info" href="{{route('admin.emailUnverifiedUsers')}}">
            <h4>EMAIL UNVERIFIED USERS</h4>
            <p><b>{{\App\User::where('email_verified', 0)->count()}}</b></p>
          </a>
        </div>
      </div>

    </div> --}}
    <div class="row">
           <div class="col-md-12">
               <div class="tile">
                   <h3 class="tile-title">Monthly Order Info</h3>
                   <div class="embed-responsive embed-responsive-16by9">
                       <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                   </div>
               </div>
           </div>
    </div>
  </main>
@endsection

@push('scripts')
  <script type="text/javascript">
         var d = {!! json_encode($month) !!};
         var m =  {!! json_encode($sold) !!};
         var data = {
             labels: d,
             datasets: [
                 {
                     label: "My First dataset",
                     fillColor: "rgba(47, 79, 79,0.2)",
                     strokeColor: "rgba(47, 79, 79,1)",
                     pointColor: "rgba(47, 79, 79,1)",
                     pointStrokeColor: "#fff",
                     pointHighlightFill: "#fff",
                     pointHighlightStroke: "rgba(220,220,220,1)",
                     data: m
                 }
             ]
         };


         var ctxl = $("#lineChartDemo").get(0).getContext("2d");
         var lineChart = new Chart(ctxl).Line(data);

     </script>
@endpush
