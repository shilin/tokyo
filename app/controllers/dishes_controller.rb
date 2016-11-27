class DishesController < ApplicationController
  def index
    @dishes = Core.all.map { |core| core.dishes.build }
    # generate additive for every ingredient and dish
    @ingredients = Ingredient.all
    @dishes.each do |dish|
      @ingredients.each do |ing|
        dish.additives.build(addable: ing, multiplier: 0)
      end
    end
  end
end
