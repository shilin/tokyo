class DishesController < ApplicationController
  def index
    @dishes = Core.all.map { |core| core.dishes.build }
  end
end
