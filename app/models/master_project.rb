class MasterProject < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  has_many :projects, :autosave => true
  has_many :messages, :autosave => true

  def finish
    projects.each(&:finish)
    messages.each(&:archive)
  end
  def calendar_string
    CGI.escape("#{name} #{end_date.to_s}")
  end
end
