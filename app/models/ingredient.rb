class Ingredient < ActiveRecord::Base
  has_many :dishes, through: :additives
  has_many :additives, as: :addable
  validates :name, presence: true

end
