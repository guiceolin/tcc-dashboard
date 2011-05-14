class Manager < Member

  has_many :managed_projects, :through    => :memberships, 
                              :source     => :project, 
                              :conditions => 'memberships.manager = true'
end
