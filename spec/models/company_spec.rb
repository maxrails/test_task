require 'spec_helper'

describe Company do
  before do
    @company = FactoryGirl.create(:company)
  end

  subject { @company }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :address }


end  
