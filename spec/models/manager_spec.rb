require 'spec_helper'

describe Manager do
  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should allow_mass_assignment_of :first_name }
  it { should allow_mass_assignment_of :last_name }

  describe "#full_name" do
    let(:manager) { Factory :manager, :first_name => 'Steve', :last_name => 'Jobs' }
    subject { manager.full_name }
    it { should == "Steve Jobs" }
  end
end
