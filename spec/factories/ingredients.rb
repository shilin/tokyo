FactoryGirl.define do

  factory :ingredient do
    sequence(:name) { |n| "MyIngredient#{n}" }
  end
end
