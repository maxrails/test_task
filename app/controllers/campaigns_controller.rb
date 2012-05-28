class CampaignsController < InheritedResources::Base
  before_filter :only => [ :create,:update ] do
    #reformat date time
    params[:campaign][:started_at] = Campaign.set_correct_time(params[:campaign][:started_at])
    params[:campaign][:ended_at]   = Campaign.set_correct_time(params[:campaign][:ended_at])
    # countries and languages arrays
    if params[:regions].present?
      params[:campaign][:languages] = {}
      params[:regions].each do |index,val|
        params[:campaign][:languages][index] = params["languages_"+index]
      end
      params[:campaign][:regions] = params[:regions]
    end
  end

end
