Fabricator :membership do
  user
  project
  manager 0
end

Fabricator :manager_membership, :from => :membership do
  manager true
end
