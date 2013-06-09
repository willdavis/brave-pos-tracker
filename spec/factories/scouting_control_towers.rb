# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scouting_control_tower, :class => 'Scouting::ControlTower' do
    region_id 1
    constellation_id 1
    solar_system_id 1
    moon_id 1
    control_tower_type_id 1
  end
end
