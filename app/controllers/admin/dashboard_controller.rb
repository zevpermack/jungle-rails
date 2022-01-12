class Admin::DashboardController < ApplicationController
  def show
    @total_categories = Category.all.count
    @total_products = Product.all.count
  end
end
