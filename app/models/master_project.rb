class MasterProject < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  has_many :projects
end
