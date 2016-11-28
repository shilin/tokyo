class Ingredient < ActiveRecord::Base
  include Addable

  has_many :dishes, through: :additives
  validates :name, presence: true

end
