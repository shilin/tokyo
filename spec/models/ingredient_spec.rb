require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  it { should have_many :dishes }
  it { should have_many :additives }

  it { should validate_presence_of :name }

  it_behaves_like :addable
end
