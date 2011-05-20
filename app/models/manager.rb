class Manager < Member

  has_many :managed_projects, :through    => :memberships, 
                              :source     => :project, 
                              :conditions => 'memberships.manager = true'

  def associate_managed_project(project)
    Membership.create(:project => project, :user => self, :manager => true)
  end
end
