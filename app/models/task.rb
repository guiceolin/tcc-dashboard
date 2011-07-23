class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  def start
    !start_date.present? && !!(start_date = Time.now)
  end

  def started?
    start_date.present?
  end

  def complete
    start_date.present? && !!(end_date = Time.now)
  end

  def completed?
    end_date.present?
  end


end
