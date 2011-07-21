require 'spec_helper'

describe Task do
  it { should belong_to :project }
  it { should belong_to :user }

  let(:start_project) { Fabricate :task, :start_date => 2.days.ago, :end_date => 1.day.ago }
  let(:finish_project) { Fabricate :task, :start_date => 2.days.ago, :end_date => 1.day.from_now }
  let(:finish_project_layout) { Fabricate :task, :start_date => 2.days.ago }

  context "#completed?" do
    it { start_project.completed?.should be true }
    it { finish_project.completed?.should be false }
    it { finish_project_layout.completed?.should be false }
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
