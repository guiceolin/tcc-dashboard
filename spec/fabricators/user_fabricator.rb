Fabricator(:user) do
  first_name 'first_name'
  last_name 'last_name'
  password 'q1w2e3r4'
  password_confirmation 'q1w2e3r4'
  email { sequence(:email) { |i| "user#{i}@example.com" } }
end
Fabricator :admin, :from => :user do
  after_build { |user| user.type  = 'Admin' }
end

Fabricator :manager, :from => :user do
  after_build { |user| user.type = 'Manager' }
end

Fabricator :member, :from => :user do
  after_build { |user| user.type = 'Member' }
end
