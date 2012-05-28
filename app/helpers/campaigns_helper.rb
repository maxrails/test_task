module CampaignsHelper
  def get_timezone_value(timezone)
    timezone.to_s[4..9]
  end
end
