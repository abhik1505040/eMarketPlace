<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;
use App\Subcategory;
//use App\Orderedproduct;
//use App\FlashInterval;
use Carbon\Carbon;
//use App\Ad;
use DB;
use Debugbar;

class SearchController extends Controller
{
    public function search(Request $request, $category=null, $subcateogry=null) {

      $productids = [];
      $reqattrs = $request->except('maxprice', 'minprice', 'sort_by', 'term', 'page', 'type');
      $count = 0;
      if ($reqattrs) {
        $data['reqattrs'] = $reqattrs;
      } else {
        $data['reqattrs'] = [];
      }

      $products = Product::where('subcategory_id', $subcateogry)->get();
      // return $products;
      // return count($reqattrs);

      foreach ($products as $key => $product) {
        $proattrs = json_decode($product->attributes, true);
        $count = 0;

        if($proattrs!= null){
            foreach ($proattrs as $key => $proattr) {
                if (!empty($reqattrs[$key])) {
                  if (!empty(array_intersect($reqattrs[$key] ,$proattrs[$key]))) {
                    $count++;
                  }
                }
              }
        }


        if ($count == count($reqattrs)) {
          $productids[] = $product->id;
        }
      }

      // return $productids;

      $category = $request->category;
      $subcategory = $request->subcategory;
      $minprice = $request->minprice;
      $maxprice = $request->maxprice;
      $sortby = $request->sort_by;
      $type = $request->type;
      $data['sortby'] = $request->sort_by;
      $term = $request->term;
      $data['term'] = $request->term;

      // return $category;
      // return $subcategory;

      $data['minprice'] = Product::min('price');
      $data['maxprice'] = Product::max('price');

      $data['products'] = Product::when($category, function ($query, $category) {
                          return $query->where('category_id', $category);
                      })
                      ->when($subcategory, function ($query, $subcategory)  {
                          return $query->where('subcategory_id', $subcategory);
                      })
                      ->when($minprice, function ($query, $minprice)  {
                          return $query->where('price', '>=', $minprice);
                      })
                      ->when($maxprice, function ($query, $maxprice)  {
                          return $query->where('price', '<=', $maxprice);
                      })
                      ->when($sortby, function ($query, $sortby)  {
                        if ($sortby == 'date_desc') {
                          return $query->orderBy('created_at', 'DESC');
                        } elseif ($sortby == 'date_asc') {
                          return $query->orderBy('created_at', 'ASC');
                        } elseif ($sortby == 'price_desc') {
                          return $query->orderBy('search_price', 'DESC');
                        } elseif ($sortby == 'price_asc') {
                          return $query->orderBy('search_price', 'ASC');
                        } elseif ($sortby == 'sales_desc') {
                          return $query->orderBy('sales', 'DESC');
                        } elseif ($sortby == 'rate_desc') {
                          return $query->orderBy('avg_rating', 'DESC');
                        }

                      })
                      ->when($type, function ($query, $type)  {
                        if ($type == 'special') {
                          return $query->whereNotNull('current_price');
                        }
                      })
                      ->when(!$sortby, function ($query, $sortby)  {
                          return $query->orderBy('id', 'DESC');
                      })
                      ->when($term, function ($query, $term)  {
                          return $query->where('title', 'like', '%'.$term.'%');
                      })
                      ->when($productids, function ($query, $productids)  {
                          return $query->whereIn('id', $productids);
                      })
                      ->where('deleted', 0)->paginate(12);

      $data['categories'] = Category::where('status', 1)->get();

      //$data['shopad'] = Ad::where('size', 3)->inRandomOrder()->first();

      return view('user.search', $data);
    }


}
