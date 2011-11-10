class Key < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_uniqueness_of :key
  belongs_to :user
  after_save :update_keys
  after_destroy :delete_key

  delegate :projects, :to => :user

  def update_keys
    Gitosis.new.configure do |repo|
      repo.update_keys(name, key)
      projects.each do |project|
        repo.update_project(project.repo_name, project.member_keys)
      end
    end
  end

  def delete_key
    Gitosis.new.configure do |c|
      c.delete_key(name)
      projects.each do |project|
        c.update_project(project.repo_name, project.member_keys)
      end
    end
  end

end
