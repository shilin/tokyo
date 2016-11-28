class CartsController < ApplicationController
  def show
    @cart_dishes = session[:cart].map { |dish_id| Dish.find(dish_id)}
  end
end
