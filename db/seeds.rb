# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'DEFAULT ROLES'
role = Admin::Role.find_or_create_by_name :name => 'super_admin'
puts 'role: ' << role.name

role2 = Admin::Role.find_or_create_by_name :name => 'scout'
puts 'role: ' << role2.name

role3 = Admin::Role.find_or_create_by_name :name => 'banned'
puts 'role: ' << role3.name

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :confirmed_at => DateTime.now, :pilot_name => "Test_Pilot"
user.roles << role
puts 'user: ' << user.email

user2 = User.find_or_create_by_email :email => "unverified@test.com", :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :confirmed_at => DateTime.now, :pilot_name => "Test_Unverified_Pilot"
puts 'user: ' << user2.email

user3 = User.find_or_create_by_email :email => "banned@test.com", :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :confirmed_at => DateTime.now, :pilot_name => "Test_Banned_Pilot"
user3.roles << role3
puts 'user: ' << user3.email
