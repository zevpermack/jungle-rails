class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASS'] 
  def show
    @total_categories = Category.all.count
    @total_products = Product.all.count
  end
end
