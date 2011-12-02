class MasterProject < ActiveRecord::Base
  has_paper_trail

  validates :description, :presence => true
  validates :name, :presence => true, :uniqueness => true

  belongs_to :owner, :class_name => 'User'
  has_many :projects, :autosave => true
  has_many :messages, :autosave => true

  def master_project
    self
  end

  def finish
    projects.each(&:finish)
    messages.each(&:archive)
  end

  def calendar_string
    CGI.escape("#{name} #{end_date.to_s}")
  end
end
