# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scouting_report, :class => 'Scouting::Report' do
    solar_system_id 1
    solar_system_name "test"
    user_id 1
  end
end
