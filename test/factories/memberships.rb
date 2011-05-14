# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :manager_membership do |f|
  f.user_id 1
  f.project_id 1
  f.manager true
end


Factory.define :membership do |f|
  f.user_id 1
  f.project_id 1
  f.manager 0
end
