class Delivery < ActiveRecord::Base
  belongs_to :message
  belongs_to :user

  scope :unread, :conditions => { :read => false}

  def unread?
    !read
  end

  def unread!
    self.read = false
  end

  def read!
    self.read = true
  end
end
