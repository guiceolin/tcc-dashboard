class Manager < Member

  belongs_to :current_master_project, :class_name => 'MasterProject'
  has_many :master_projects,  :foreign_key => 'owner_id'

  has_many :managed_projects, :through    => :memberships,
                              :source     => :project,
                              :conditions => 'memberships.manager = true'

  def associate_managed_project(project)
    Membership.create(:project => project, :user => self, :manager => true)
  end

  def active_project=(master_project)
    current_master_project= master_project
  end

  def current_project
    current_master_project
  end

  def project_list
    master_projects.collect { |mp| [mp.name, mp.id]}
  end
end
