class Dish < ActiveRecord::Base
  belongs_to :core

  has_many :additives, dependent: :destroy
  has_many :ingredients, through: :additives, source: :addable, source_type: 'Ingredient'

end
