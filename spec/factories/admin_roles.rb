# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_role, :class => 'Admin::Role' do
    name "MyString"
  end
end
