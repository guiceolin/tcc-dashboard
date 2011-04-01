require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should allow_mass_assignment_of :first_name }
  it { should allow_mass_assignment_of :last_name }

  context '#full_name' do
    let(:user) { Factory :user , :first_name => 'John', :last_name => 'Locke' }
    subject { user.full_name }
    it { should == 'John Locke' } 
  end
end
