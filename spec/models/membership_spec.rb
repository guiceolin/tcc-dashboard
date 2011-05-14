require 'spec_helper'

describe Membership do
  let(:membership) { Factory :membership } 
  subject { membership }
  it { should validate_uniqueness_of(:user_id).scoped_to(:project_id) }
  it { should belong_to(:user) }
  it { should belong_to(:project) }
end
