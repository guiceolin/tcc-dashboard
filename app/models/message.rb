class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User'
  has_many :deliveries
  has_many :receivers, :through => :deliveries, :source => :user

  after_save :send_message

  private

  def send_message
    receivers.each do |r|
      Delivery.new :user_id => r, :message => self, :read => false
    end
  end
end
