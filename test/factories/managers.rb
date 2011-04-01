# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :manager do |f|
  f.sequence(:email) { |n| "manager#{n}@example.org" }
  f.password 'q1w2e3r4'
  f.password_confirmation 'q1w2e3r4'
  f.first_name 'First name'
  f.last_name 'Last Name'
end
