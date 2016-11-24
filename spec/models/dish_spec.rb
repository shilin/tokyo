require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should belong_to :core }
  it { should have_many(:additives).dependent(:destroy) }
  it { should have_many :ingredients }

  it { should validate_numericality_of(:multiplier).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:multiplier).only_integer }

end
