module CampaignHelper
	
	require 'digest/sha1'

	def nameAvailable(campaign_name)
		c = Campaign.where(:name => campaign_name, :user_id => session[:user][:id])
		if c.count == 0
			return true
		else
			return false
		end
	end
	
	def generateHash
		return Digest::SHA1.hexdigest (Time.now.to_s + rand(9999).to_s)
	end

	def permittedToView(id)
		if Campaign.where(:id => id, :user_id => session[:user][:id]).count > 0 then
			return true
		else
			return false
		end
	end
end
