require 'spec_helper'

describe Task do
  it { should belong_to :project }
  it { should belong_to :user }

  context "#completed?" do
    let(:start_project) { Fabricate :task, :start_date => 2.days.ago, :end_date => 1.day.ago }
    let(:finish_project) { Fabricate :task, :start_date => 2.days.ago }

    it { start_project.completed?.should be true }
    it { finish_project.completed?.should be false }
  end

  context "#complete" do
    let(:unstarted_task) { Fabricate :task }
    let(:started_task)   { Fabricate :task, :start_date => 2.days.ago }

    it { unstarted_task.complete.should be false }
    it { started_task.complete.should be true }
  end

  context "started?" do
    let(:unstarted_task) { Fabricate :task }
    let(:started_task)   { Fabricate :task, :start_date => 2.days.ago }

    it { started_task.started?.should be true }
    it { unstarted_task.started?.should be false }
  end

  context "start" do
     let(:unstarted_task) { Fabricate :task }
    let(:started_task)   { Fabricate :task, :start_date => 2.days.ago }

    it { started_task.start.should be false }
    it { unstarted_task.start.should be true }
  end
end
