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

  def colaborators
    members + managers
  end

  def finish
    self.finished = true
  end
end
