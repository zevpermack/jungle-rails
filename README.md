# Jungle

A mini e-commerce application built with Rails 4.2. 
Users can add items into their cart and checkout with stripe. 
Admin access allows for deeper permissions to maintain and modify the application 

https://user-images.githubusercontent.com/38580490/161855875-448bab62-a2e9-4925-bdf9-65b3929079bf.mov


## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server


## In the Browser
- Navigate to your server `localhost:3000/`

--------------------------------------------------
> Opening up to Jungle homepage

!["Jungle Home"](https://github.com/rewpt/jungle-rails/blob/master/app/assets/images/homepage.png?raw=true)


--------------------------------------------------

## Usage
- Scroll and click to view details about products
- Click add to put items in your cart
- View added items from the nav with My Cart
--------------------------------------------------
> Managing your cart

!["Check out my cart"](https://github.com/rewpt/jungle-rails/blob/master/app/assets/images/mycart.png?raw=true)


--------------------------------------------------
> Checking out

!["Checking out"](https://github.com/rewpt/jungle-rails/blob/master/app/assets/images/checking_out.png?raw=true)


--------------------------------------------------


## Stripe Testing
* Use Credit Card # 4111 1111 1111 1111, any CVC and any forward date expiry for testing success scenarios.

## Features
> Users
  - Pick items to be added or deleted from your cart and checkout
> Admin Function
  - Maintain categories, items, product and sales to be displayed for users
> Error handling
  - Users cannot checkout without any items in cart


## Dependencies
  
* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Testing

- Runs Rspec with capybara for end to end tests
- Use specific files name with features/filename to decrease runtime  
```sh
bin/rspec spec/features
```
--------------------------------------------------



