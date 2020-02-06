class Admin::DashboardController < ApplicationController
  def show
    @all_products_count = Product.all.count
    @all_categories_count = Category.all.count
  end
end
