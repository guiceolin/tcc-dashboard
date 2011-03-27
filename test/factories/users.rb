# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  #f.sequence(:first_name) { |n| "User created by a factory##{n}" }
  f.sequence(:email) { |n| "user#{n}@example.org" }
  f.password 'q1w2e3r4'
  f.password_confirmation 'q1w2e3r4'

end
