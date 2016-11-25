FactoryGirl.define do

  factory :core do
    sequence(:name) { |n| "MyCore#{n}" }
  end
end
