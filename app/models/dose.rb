class Dose < ActiveRecord::Base
  belongs_to :dish
  belongs_to :ingredient

  validates :multiplier, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :dish_id, presence: true
  validates :ingredient_id, presence: true
end
