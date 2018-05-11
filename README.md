# README

E-commerce site built using rails and a frontend using materialize. Basic functionality and AJAX are in place. if you want anything else done please let me know!

# Technologies used
* Rails
* materialize
* Factorybot
* Bcrypt
* Masonry
* Jquery with AJAX

# SET UP:

* run the following on command line in order
* $ git clone https://github.com/passwordiscomputer/went-to-bali.git
* (navigate to project directory)
* $ bundle install
* $ rails db:create
* $ rails db:migrate
* $ rails db:test:prepare
* $ rails db:seed
* $ rails s
* Then navigate to localhost:3000 in internet explorer 6
* Default admin email: "admin@admin.com" password: "password"
* please change these as needed in the seed file. Message me if further directions are needed

# Features Added
* Ensure that users can't order a negative number of items.
* Add Stripe for user checkout
* allow admin to edit and add new products
* Add admin links to navbar so admins can easily add, update and delete products.
* Fix the row height for products, which can quickly become uneven.
* Add admin flash messages for adding, updating and deleting products.
* Add flash messages for signing up, signing in and signing out.
