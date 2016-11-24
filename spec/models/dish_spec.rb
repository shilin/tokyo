require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should belong_to :core }
end
