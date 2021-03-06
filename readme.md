![image](https://user-images.githubusercontent.com/37974385/109809304-5af37800-7c52-11eb-812b-e961db1f97eb.png)

# About Project

The _eMarketPlace_ software is an e-commerce website. This website will provide customers with facilities to search and order desirable products and provide reviews on consumed products. It will allow vendors to add new product and advertise their products. The main objectives of this website are:

1.	Provide separate interfaces for customer(user) and vendor.
2.	Allow customers to search and order products of different categories and prices easily, review and rate products when they are delivered
3.	Allow vendors to provide advertise for their products, control their products’ price and see the reviews of their products

# Searching and Ordering of Products
 
The basic path of this feature is described below:
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

## Home Page

![image](https://user-images.githubusercontent.com/37974385/109806695-32b64a00-7c4f-11eb-8f03-23dbb56178c9.png)
![image](https://user-images.githubusercontent.com/37974385/109806727-3cd84880-7c4f-11eb-830d-945fa29b0c42.png)
![image](https://user-images.githubusercontent.com/37974385/109806764-482b7400-7c4f-11eb-8669-434c6afe0544.png)

## Searching a Product

![image](https://user-images.githubusercontent.com/37974385/109807291-e0c1f400-7c4f-11eb-926f-a3318d7ccb89.png)

## Adding to Cart

![image](https://user-images.githubusercontent.com/37974385/109807630-59c14b80-7c50-11eb-8e4f-8d5184ea06d2.png)
![image](https://user-images.githubusercontent.com/37974385/109807692-6cd41b80-7c50-11eb-81cc-2bffe1ba26a1.png)

## Checkout Page

![image](https://user-images.githubusercontent.com/37974385/109807782-912ff800-7c50-11eb-9fe1-f47a11c320f7.png)

## Login/Registration Page

![image](https://user-images.githubusercontent.com/37974385/109817957-b0cd1d80-7c5c-11eb-9cdc-fbad4e10ced3.png)
![image](https://user-images.githubusercontent.com/37974385/109817987-b9255880-7c5c-11eb-9bf7-8d5245d626a1.png)


## Orders List

![image](https://user-images.githubusercontent.com/37974385/109807891-ab69d600-7c50-11eb-8819-bd85cfeec707.png)


# Admin Module

After logging in, the administrator(s) can overview the monthly order info, total verified users, completed orders in the Dashboard.

![image](https://user-images.githubusercontent.com/37974385/109817396-17057080-7c5c-11eb-80c3-2769004094af.png)

They can also add new product attributes or remove old attributes.

![image](https://user-images.githubusercontent.com/37974385/109817660-5d5acf80-7c5c-11eb-8288-d04ea753a5ab.png)


## Order Management by Admin

After an order has been placed by a customer, the administrator(s) can update the status of that order in the respective module. There are different pages to see the pending orders and all orders, as shown below.

![image](https://user-images.githubusercontent.com/37974385/109812429-3f8a6c00-7c56-11eb-9fd5-77b6699ef307.png)
![image](https://user-images.githubusercontent.com/37974385/109812502-57fa8680-7c56-11eb-80a6-50f9331d7b04.png)
![image](https://user-images.githubusercontent.com/37974385/109812578-71033780-7c56-11eb-9860-b86c0b660ff2.png)


# Vendors

After logging in, one vendor can see the total order count from his/her shop as well as the inventory count and sold products' count in the dashboard.

![image](https://user-images.githubusercontent.com/37974385/109818282-086b8900-7c5d-11eb-88c5-a60d3dc67b24.png)
![image](https://user-images.githubusercontent.com/37974385/109818309-0e616a00-7c5d-11eb-86a8-d30a4c908f01.png)

## Product Addition by Vendor

A vendor can upload a new product, add necessary description and attributes of the product as shown below.

![image](https://user-images.githubusercontent.com/37974385/109818573-52ed0580-7c5d-11eb-951d-e4805f71251d.png)
![image](https://user-images.githubusercontent.com/37974385/109818604-5bddd700-7c5d-11eb-84fa-64f563ccf846.png)



The paths of some other features are in Documentation/Software Requirement Specification.docx file. The design methodologies and diagrams, user guide and other specifications are described in Documentation/software_documentation.pdf file.
