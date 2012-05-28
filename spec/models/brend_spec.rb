require 'spec_helper'

describe Brend do
  before do
    @brend = FactoryGirl.create(:brend_with_company)
  end

  subject { @brend }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :company_id }

end  
