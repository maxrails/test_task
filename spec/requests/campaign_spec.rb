require 'spec_helper'

describe "Campaign" do
  before :each do
    @campaign = FactoryGirl.create(:campaign_with_brend)
  end

  it "display no campign yet" do
    DatabaseCleaner.clean
    visit '/campaigns'
    page.should have_content "No campaigns yet. Let's create one"
  end

  it "display campigns should show all and allow to edit each" do
    visit '/campaigns'
    page.should_not have_content "No campaigns yet. Let's create one"
    [:name,:started_at,:ended_at,:start_timezone,:end_timezone].each do |item|
      page.should have_content @campaign.send(item).try(:civil) rescue page.should have_content @campaign.send(item)
    end
    page.should have_content @campaign.languages['1'][0]
    page.should have_content @campaign.regions['1'][0]

    visit edit_campaign_path(@campaign)
    page.should have_content "Edit Campaign"
    temp_name = Time.now.to_i.to_s
    fill_in 'Started at', :with=>'05/22/2010 08:00'
    click_button 'Update Campaign'
    page.should have_content 'Campaign'
    page.should have_content "22 May 2010 at 08:00 am"
  end

  describe 'Create' do
    it "should not create campaign without brend", :js => true do
      DatabaseCleaner.clean
      visit '/campaigns/new'
      array = ["05/22/2012 08:00","05/23/2012 09:00","Barbados","ara (ar) - Arabic","(GMT-11:00) International Date Line West"]
      page.should have_content "New Campaign"
      fill_in 'Started at', :with => array[0]
      fill_in 'Ended at', :with => array[1]
      select(array[2], :from => 'regions')
      select(array[3], :from => 'languages_1_')
      click_button 'Create Campaign'
      page.should have_content 'New Campaign'
    end
  end

end
