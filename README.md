# Jungle

A mini e-commerce application built with Rails 4.2. 
Users can add items into their cart and checkout with stripe while admin access allows maintenance of the

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


!["Jungle Home"](https://github.com/rewpt/jungle-rails/blob/master/app/assets/images/homepage.png?raw=true)
Opening up to Jungle homepage

## Usage
- Scroll and click to view details about products
- Click add to put items in your cart

!["Booking Appointment"](https://github.com/rewpt/scheduler/blob/master/docs/BookingAppt.png?raw=true)
Booking an appointment

!["Viewing appointments"](https://github.com/rewpt/scheduler/blob/master/docs/BookedAppts.png?raw=true)
Viewing booked appointments

## Features
- Record Keeping
  - Spots remaining will update automatically for each day, showing which spots are available during the week.
- Express back-end
  - Appointments saved will be remembered for next visit
- Error handling
  - Appointments unable to be saved or deleted will show an error


## Dependencies
  
* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe


## Testing

## Running Webpack Development Server

```sh
npm start
```

## Running Jest Test Framework

```sh
npm test
```

## Running Storybook Visual Testbed

```sh
npm run storybook
```

## Running Cypress (make sure dev dependencies installed)

```sh
npm run cypress
```
--------------------------------------------------
# Jungle



## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)



## Stripe Testing



## Dependencies



