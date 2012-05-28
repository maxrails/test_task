require 'spec_helper'

describe Campaign do
  before do
    @campaign = FactoryGirl.create(:campaign_with_brend)
  end

  subject { @campaign }

  it { should validate_presence_of :end_timezone }
  it { should validate_presence_of :start_timezone }
  it { should validate_presence_of :started_at }
  it { should validate_presence_of :ended_at }
  it { should validate_presence_of :regions }
  it { should validate_presence_of :languages }
  it { should validate_presence_of :brend_id }

end
