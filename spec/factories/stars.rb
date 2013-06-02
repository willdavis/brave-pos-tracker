# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :star do
    name "MyString"
    security "9.99"
    gate_count 1
  end
end
