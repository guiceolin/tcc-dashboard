class Member < User
  has_many :projects, :through    => :memberships,
                      :source     => :project,
                      :conditions => 'memberships.maneger = true'
end
