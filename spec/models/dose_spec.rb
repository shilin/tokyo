require 'rails_helper'

RSpec.describe Dose, type: :model do
  it { should belong_to :dish }
  it { should belong_to :ingredient }

  it { should validate_presence_of :dish_id }
  it { should validate_presence_of :ingredient_id }

  it { should validate_numericality_of(:multiplier).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:multiplier).only_integer }

end
