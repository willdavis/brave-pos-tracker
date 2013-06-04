# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :planet do
    name "MyString"
    asteroid_belt_count 1
    ice_belt_count 1
    poco_owner_id 1
  end
end
