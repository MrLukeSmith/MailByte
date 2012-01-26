module CampaignHelper

	def nameAvailable(campaign_name)
		c = Campaign.where(:name => campaign_name, :user_id => session[:user][:id])
		if c.count == 0
			return true
		else
			return false
		end
	end

end
