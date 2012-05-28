require 'test_helper'

class CampaignsControllerTest < ActionController::TestCase
  setup do
    @campaign = campaigns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaigns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campaign" do
    assert_difference('Campaign.count') do
      post :create, campaign: { address: @campaign.address, countries: @campaign.countries, end_timezone: @campaign.end_timezone, ended_at: @campaign.ended_at, languages: @campaign.languages, name: @campaign.name, phone: @campaign.phone, start_timezone: @campaign.start_timezone, started_at: @campaign.started_at }
    end

    assert_redirected_to campaign_path(assigns(:campaign))
  end

  test "should show campaign" do
    get :show, id: @campaign
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campaign
    assert_response :success
  end

  test "should update campaign" do
    put :update, id: @campaign, campaign: { address: @campaign.address, countries: @campaign.countries, end_timezone: @campaign.end_timezone, ended_at: @campaign.ended_at, languages: @campaign.languages, name: @campaign.name, phone: @campaign.phone, start_timezone: @campaign.start_timezone, started_at: @campaign.started_at }
    assert_redirected_to campaign_path(assigns(:campaign))
  end

  test "should destroy campaign" do
    assert_difference('Campaign.count', -1) do
      delete :destroy, id: @campaign
    end

    assert_redirected_to campaigns_path
  end
end
