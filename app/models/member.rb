class Member < User

  has_many :projects, :through    => :memberships,
                      :source     => :project,
                      :conditions => 'memberships.manager = 0'
end
