class Dish < ActiveRecord::Base
  belongs_to :core

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
