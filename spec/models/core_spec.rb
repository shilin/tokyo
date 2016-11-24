require 'rails_helper'

RSpec.describe Core, type: :model do
  it { should have_many(:dishes) }
  it { should validate_presence_of :name }
end
