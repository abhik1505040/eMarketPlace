
<!-- popper -->
<script src="{{asset('assets/user/js/popper.min.js')}}"></script>
<!-- bootstrap -->
<script src="{{asset('assets/user/js/bootstrap.min.js')}}"></script>
<!-- way poin js-->
<script src="{{asset('assets/user/js/waypoints.min.js')}}"></script>
<!-- owl carousel -->
<script src="{{asset('assets/user/js/owl.carousel.min.js')}}"></script>
{{-- Sweet Alert JS --}}
<script src="{{asset('assets/user/js/sweetalert.min.js')}}"></script>
{{-- Toastr JS --}}
<script src="{{asset('assets/user/js/toastr.min.js')}}"></script>
{{-- jquery datetimepicker JS --}}
<script src="{{asset('assets/user/js/jquery.datetimepicker.full.min.js')}}"></script>
<!-- magnific popup -->
<script src="{{asset('assets/user/js/jquery.magnific-popup.js')}}"></script>
<!-- wow js-->
<script src="{{asset('assets/user/js/wow.min.js')}}"></script>
<!-- counterup js-->
<script src="{{asset('assets/user/js/jquery.counterup.min.js')}}"></script>
<!-- select 2 -->
<script src="{{asset('assets/user/js/select2.min.js')}}"></script>
<!-- jQuery UI popup -->
<script src="{{asset('assets/user/js/jquery-ui.js')}}"></script>
{{-- File input --}}
<script src="{{ asset('assets/plugins/bootstrap-fileinput.js') }}" type="text/javascript"></script>
<script src="{{ asset('assets/user/js/owl.carousel2.thumbs.js') }}" type="text/javascript"></script>
<!-- main -->
<script src="{{asset('assets/user/js/main.js')}}"></script>

{{-- Tostr options --}}
<script type="text/javascript">
  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "3000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
</script>

@if (session('success'))
<script>
    $(document).ready(function(){
        toastr["success"]("{{ session('success') }}");
    });
</script>
@endif

@if (session('alert'))
<script>
    $(document).ready(function(){
        toastr["error"]("{{ session('alert') }}");
    });
</script>
@endif

{{-- Increase Ad Views... --}}
{{-- <script>
   function increaseAdView(adID) {
      var fd = new FormData();
      fd.append('adID', adID);
      $.ajaxSetup({
          headers: {
              'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
          }
      });
      $.ajax({
         url: '{{route('ad.increaseAdView')}}',
         type: 'POST',
         data: fd,
         contentType: false,
         processData: false,
         success: function(data) {
            // console.log(data);
         }
      });
   }
</script> --}}

@stack('scripts')

@yield('js-scripts')

@yield('stripe-js')

@yield('preimgscripts')

@yield('vuescripts')

@php
  if (Auth::check()) {
    $sessionid = Auth::user()->id;
  } else {
    $sessionid = session()->get('browserid');
  }
@endphp

{{-- @if (!Auth::guard('vendor')->check()) --}}
<script>
  @if (request()->is('vendor/product/*/edit'))
  var catid = {{$product->category_id}};
  var subcatid = {{$product->subcategory_id}};
  @else
  var catid = null;
  var subcatid = null;
  @endif
  var example1 = new Vue({
    el: '#app',
    data: {
      products: [],
      noproduct: true,
      checkoutbtn: false,
      preimg: '',
      precartlen: 0,
      catid: catid,
      subcatid: subcatid,
      iteratoroptions: [],
      options: [],
      productattrs: [],
      itemsCount: 0,
      cartQuantity: 0,
      basecurrsym: '{{$gs->base_curr_symbol}}'
    },
    mounted() {

    },
    methods: {

      showsubcats: function() {
        console.log(this.catid);
        $.get(
          '{{route('vendor.product.getsubcats')}}',
          {
            catid: this.catid
          },
          function(data) {
            console.log(data);
            var subopt = '<option value="" selected disabled>Select a subcategory</option>';
            for (var i = 0; i < data.length; i++) {
              subopt += `
                <option value="${data[i].id}">${data[i].name}</option>
              `;
            }
            $("#selsub").html(subopt);
          }
        );
      },

      showattrs: function() {
        console.log(this.subcatid);
        $.get(
          '{{route('vendor.product.getattributes')}}',
          {
            'subcatid': this.subcatid
          },
          function(data) {
            console.log(data);
            if (data != 'no_attr') {
              this.iteratoroptions = data.iteratoroptions;
              this.options = data.options;
              this.productattrs = data.productattrs;
              console.log(this.iteratoroptions, this.options, this.productattrs);
              var txt = ``;
              var k = 0;
              for (var i = 0; i < this.iteratoroptions.length; i++) {
                  if ((i+1) % 3 == 1) {
                    txt += `<div class="row">`;
                  }
                        txt += `<div class="col-md-4">
                                     <div class="form-element margin-bottom-20">
                                          <label>${this.productattrs[i].name} <span>**</span></label>`;

                                  txt += `<div>`;
                                for (var j = 0; j < this.iteratoroptions[i]; j++) {
                                    txt += `<div class="form-check form-check-inline">
                                              <input name="${this.productattrs[i].attrname}[]" value="${this.options[k].name}" class="form-check-input" type="checkbox" id="attr${this.options[k].id}">
                                              <label class="form-check-label" for="inlineCheckbox1">${this.options[k].name}</label>
                                            </div>`;
                                    k++;
                                }
                            txt +=      `</div>
                                         <p class="em text-danger no-margin" id="err${this.productattrs[i].attrname}"></p>
                                     </div>
                                </div>`;
                  if ((i+1) % 3 == 0) {
                    txt += `</div>`;
                  }
              }
              $("#proattrsid").html(txt);
            } else {
              $("#proattrsid").html('');
            }

          }
        );
      }
    }
  })
  </script>
{{-- @endif --}}
{{-- <script>
  function subscribe(e) {
    e.preventDefault();
    var fd = new FormData(document.getElementById('subscribeForm'));
    $.ajax({
      url: '{{route('user.subscribe')}}',
      type: 'POST',
      data: fd,
      contentType: false,
      processData: false,
      success: function(data) {
        console.log(data);
        if(typeof data.error != 'undefined') {
          if (typeof data.email != 'undefined') {
            toastr["error"](data.email[0]);
          }
        }
        if (data == "success") {
            toastr["success"]("You have subscribed successfully!");
            document.getElementById('subscribeForm').reset();
        }
      }
    });
  }
</script> --}}
<script>
  function categoryChange(catid) {
    window.location = '{{url('/')}}' + '/shop/' + catid;
  }
</script>
