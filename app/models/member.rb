class Member < User

  has_many :projects, :through    => :memberships,
                      :source     => :project,
                      :conditions => 'memberships.manager = 0'

  def project_list
    projects.collect {|project| [project.name, project.id]}
  end
end
