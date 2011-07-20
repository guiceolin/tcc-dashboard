class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  def completed?
    end_date.present? && end_date < Time.now
  end
end
