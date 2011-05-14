class Project < ActiveRecord::Base
  has_many :memberships
  has_many :members,  :through    => :memberships, 
                      :source     => :user, 
                      :conditions => 'memberships.manager = false'

  has_many :managers, :through    => :memberships, 
                      :source     => :user, 
                      :conditions => 'memberships.maneger = true'

  validates :name, :presence => true
end
