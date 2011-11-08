class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  after_save :update_repo

  validates :user_id, :uniqueness => { :scope => :project_id }

  def update_repo
    project.save
  end
end
