class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User'
  belongs_to :master_project
  has_many :deliveries, :autosave => true
  has_many :receivers, :through => :deliveries, :source => :user

  after_save :send_message


  def archive
    deliveries.map(&:archive)
  end

  private

  def send_message
    receivers.each do |r|
      Delivery.new :user_id => r, :message => self, :read => false
    end
  end
end
