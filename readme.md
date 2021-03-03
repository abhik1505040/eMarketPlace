<p align="center"><img src="https://laravel.com/assets/img/components/logo-laravel.svg"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel attempts to take the pain out of development by easing common tasks used in the majority of web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, yet powerful, providing tools needed for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of any modern web application framework, making it a breeze to get started learning the framework.

If you're not in the mood to read, [Laracasts](https://laracasts.com) contains over 1100 video tutorials on a range of topics including Laravel, modern PHP, unit testing, JavaScript, and more. Boost the skill level of yourself and your entire team by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for helping fund on-going Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell):

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[British Software Development](https://www.britishsoftware.co)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- [UserInsights](https://userinsights.com)
- [Fragrantica](https://www.fragrantica.com)
- [SOFTonSOFA](https://softonsofa.com/)
- [User10](https://user10.com)
- [Soumettre.fr](https://soumettre.fr/)
- [CodeBrisk](https://codebrisk.com)
- [1Forge](https://1forge.com)
- [TECPRESSO](https://tecpresso.co.jp/)
- [Runtime Converter](http://runtimeconverter.com/)
- [WebL'Agence](https://weblagence.com/)
- [Invoice Ninja](https://www.invoiceninja.com)
- [iMi digital](https://www.imi-digital.de/)
- [Earthlink](https://www.earthlink.ro/)
- [Steadfast Collective](https://steadfastcollective.com/)

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).



## About Project

The _eMarketPlace_ software is an e-commerce website. This website will provide customers with facilities to search and order desirable products and provide reviews on consumed products. It will allow vendors to add new product and advertise their products. The main objectives of this website are:

1.	Provide separate interfaces for customer(user) and vendor.
2.	Allow customers to search and order products of different categories and prices easily, review and rate products when they are delivered
3.	Allow vendors to provide advertise for their products, control their products’ price and see the reviews of their products

## Searching and Ordering of Products
 
Basic Path
1.  User types the url address of the eMarketPlace website.
2.  User sees the home page for eMarketPlace.
3.  Then user can choose a product in one of the following ways:
(a)	From the advertisement icons shown on the home page, user can click one icon to view the details of that product. 
(b)	In the search box of the home page, user writes a search string and get the product(s) icons of the name. He/she selects one of them and navigates to the products details page.
(c)	In “Categories” box of the home page, user can select a category and get the products icons of the category. He/she selects one of them and moves to the products details page. 
4.  In the product details page, the user provides desired attribute values of the product if it is necessary, then clicks on the “Add to Cart” button, which adds the product having the given attribute values to the cart.
5.  User does steps 3-4 for each of the product he/she wants to buy currently.
6.  There is a cart icon on the top right corner of the window where the number of products added to the current cart is also shown in a circle. 
7.  Then to complete the order, he/she has to click on the cart icon which will pull out a drawer interface from the right side. There, for each cart item, he sees a “Remove” button. If he wants to remove the product, then he clicks on it.
8.  In the drawer interface, below the list of the products currently in the cart, there are 2 buttons. There are mainly 2 options for the user to proceed to the next step:
(a)	The user clicks the “Checkout” button.
(b)	If the user clicks the “View Cart” button, he/she will be navigated to the Cart Management page. There he/she can increase the amount the current product by clicking the ‘+’ icon on the right side of the current amount or decrease it by clicking the ‘-’ icon on the left side. After clicking the “Update Cart” button, the product amounts are updated. Then if he/she wants to continue shopping then he can click on the “Continue Shopping” page which will navigate it to the home page. If he/she wants to checkout, he/she clicks on the “Proceed to Checkout” button.
9.  After clicking the “Checkout” or “Proceed to Checkout” button one of the following scenarios happens:
(a)	If the user is already logged in, he/she is navigated to the checkout page
(b)	Otherwise he/she is told to login. After typing the correct username and password and clicking on the “Login” icon, he/she is navigated to the checkout page.
10. In the checkout page, the user sees the necessary delivery information if they were provided before. If there is any information missing, he/she has to fill them up. He can also edit existing delivery address. After that if he/she knows any available coupon code then he/she can write the coupon code in the text box beside the “Apply Coupon” button. If the code is correct, then, after clicking on the “Apply Coupon” button, it will be obvious to the user in the order details. If it is incorrect, a warning prompt will be shown.
11. Then he/she clicks on the “Place Your Order” button which will navigate him/her to the orders list page.

