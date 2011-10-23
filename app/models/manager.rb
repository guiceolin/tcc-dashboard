class Manager < Member

  has_many :master_projects,  :foreign_key => 'owner_id'

  has_many :managed_projects, :through    => :memberships,
                              :source     => :project,
                              :conditions => 'memberships.manager = true'

  def associate_managed_project(project)
    Membership.create(:project => project, :user => self, :manager => true)
  end
end
