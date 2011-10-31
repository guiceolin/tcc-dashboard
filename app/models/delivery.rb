class Delivery < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
  PER_PAGE = 2

  scope :unread, :conditions => { :read => false}

  def self.search search
    result = joins(:message)
    result = result.where('deliveries.created_at >= ?', format_date(search[:from])) if search[:from].present?
    result = result.where('deliveries.created_at <= ?', format_date(search[:to])) if search[:to].present?
    result = result.where('sender_id = ?', search[:sender] ) if search[:sender].present?
    result = result.where(:read => true) if search[:read].present?
    result = result.where('master_project_id = ?', search[:master_project] ) if search[:master_project].present?
    result
  end

  def unread?
    !read
  end

  def unread!
    self.read = false
  end

  def read!
    self.read = true
  end

  private

  def self.format_date date
    DateTime.strptime(date, '%d/%m/%Y')
  end
end
