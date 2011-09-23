class Project < ActiveRecord::Base

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

  def colaborators
    members + managers
  end
end
