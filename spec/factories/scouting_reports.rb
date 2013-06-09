# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scouting_report, :class => 'Scouting::Report' do
    star_id 1
  end
end
