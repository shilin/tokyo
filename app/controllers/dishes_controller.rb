class DishesController < ApplicationController
  respond_to :js, :json

  before_action :build_dishes, only: [:index]
  before_action :create_cart, only: [:index]

  after_action :add_to_cart, only: [:create]

  def index
    respond_with(@dishes)
  end

  def create
    respond_with(@dish = Dish.create(dish_params))
  end

  private

  def dish_params
    params.require(:dish).permit(:core_id, :multiplier, additives_attributes: [:multiplier, :addable_id, :addable_type, :id, :_destroy])
  end

  def build_dishes
    @dishes = Core.all.map { |core| core.dishes.build }
    # generate additive for every ingredient and dish
    @dishes.each do |dish|
      Ingredient.all.each do |ing|
        dish.additives.build(addable: ing, multiplier: 0)
      end
    end
  end

  def create_cart
    session[:cart] ||= []
  end

  def add_to_cart
    session[:cart] << @dish.id
  end
end
