class Dish < ActiveRecord::Base
  belongs_to :core

  has_many :additives, dependent: :destroy
  has_many :ingredients, through: :additives, source: :addable, source_type: 'Ingredient'

  validates :multiplier, numericality: { greater_than_or_equal_to: 1, only_integer: true }


end
