class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User'
  has_many :deliveries
  has_many :receivers, :through => :deliveries, :source => :user
end
