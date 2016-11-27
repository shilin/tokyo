class Additive < ActiveRecord::Base
  belongs_to :dish
  belongs_to :addable, polymorphic: true

  validates :addable_id, presence: true
  validates :addable_type, presence: true

  validates :multiplier, numericality: { greater_than_or_equal_to: 1, only_integer: true }

end
