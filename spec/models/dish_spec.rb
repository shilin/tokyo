require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should belong_to :core }
  it { should have_many(:additives).dependent(:destroy) }
  it { should have_many :ingredients }

end
