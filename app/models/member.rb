class Member < User

  has_many :projects, :through    => :memberships,
                      :source     => :project,
                      :conditions => 'memberships.manager = 0'

  def project_list
    projects
  end

  def current_master_project
    current_project.master_project
  end

  def current_master_project=(master_project)
    current_project.master_project = master_project
  end
end
