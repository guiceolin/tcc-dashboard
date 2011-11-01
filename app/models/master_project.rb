class MasterProject < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  has_many :projects, :autosave => true
  has_many :messages, :autosave => true

  def finish
    projects.each(&:finish)
    messages.each(&:archive)
  end
end
