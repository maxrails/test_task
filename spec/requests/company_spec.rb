require 'spec_helper'

describe "Company" do
   it "display no campign yet" do
    visit '/companies'
    page.should have_content "No companies"
  end
end  
