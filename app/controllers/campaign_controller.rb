class CampaignController < ActionController::Base
	layout "application"
	include CampaignHelper
	
	def new 
		if session[:notice] != ""
			@notice = session[:notice]
			session[:notice] = nil
		end
	end
	
	def index
		if session[:notice] != ""
			@notice = session[:notice]
			session[:notice] = nil
		end
		@c = Campaign.where(:user_id => session[:user][:id])
	end
	
	def new_process
		if params[:campaign_name] != ""
			if nameAvailable(params[:campaign_name])
				# Make the new campaign record.
				c = Campaign.create(:user_id => session[:user][:id], :name => params[:campaign_name], :date_created => Time.new)
				c.save
				session[:notice] = {'type' => "success", 'msg' => "The campaign '#{params[:campaign_name]}' has been added."}
				redirect_to "/campaign"
			else
				# Return to the form. Pre-populate field. Error: Name = In use already.
				session[:fields] = params
				session[:notice] = {'type' => "error", 'msg' => "You already have a campaign with the name '#{params[:campaign_name]}'"}
				redirect_to "/campaign/new"
			end
		else
			session[:notice] = {'type' => "error", 'msg' => "You need to enter a name for your campaign"}
			redirect_to "/campaign/new"
		end
	end

end
