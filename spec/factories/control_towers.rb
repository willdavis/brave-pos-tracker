# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :control_tower do
    corporation_id 1
    type_id 1
    moon_id 1
    moon_name "MyString"
    solar_system_id 1
    constellation_id 1
    region_id 1
  end
end
