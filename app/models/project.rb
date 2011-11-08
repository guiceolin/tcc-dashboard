class Project < ActiveRecord::Base

  belongs_to :master_project

  has_many :memberships
  has_many :members,  :through    => :memberships,
                      :source     => :user,
                      :conditions => 'memberships.manager = 0'

  has_many :managers, :through    => :memberships,
                      :source     => :user,
                      :conditions => 'memberships.manager = 1'
  has_many :tasks
  has_many :documents

  validates :name, :presence => true

  delegate :end_date, :to => :master_project

  before_save :update_repo

  def update_repo
    Gitosis.new.configure do |r|
      r.update_project(repo_name, members_email)
    end
  end

  def repo_name
    name.parameterize
  end

  def colaborators
    members + managers
  end

  def finish
    self.finished = true
  end

  def members_email
    members.map(&:email)
  end
end
