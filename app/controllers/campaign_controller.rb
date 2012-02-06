class CampaignController < ActionController::Base
	layout "application"
	include CampaignHelper
	
	def new 
		if session[:notice] != ""
			@notice = session[:notice]
			@fields = session[:fields]
			session[:notice], session[:fields] = nil
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
				c = Campaign.create(:user_id => session[:user][:id], :name => params[:campaign_name], :date_created => Time.new, :api_hash => generateHash)
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
	
	def overview
		if session[:notice] != ""
			@notice = session[:notice]
			@fields = session[:fields]
			session[:notice], session[:fields] = nil
		end
		if permittedToView(params[:id])
			@c = Campaign.find(params[:id])
		else
			session[:notice] = {'type' => "error", 'msg' => "You are not authorised to view that campaign."}
			redirect_to "/campaign"
		end
	end
	
	def subscribe
		@ref = request.referrer
		# Check api_hash. Ensure it corresponds to the campaign ID.
		# Check referring URL corresponds to the campaign. 
		# See which fields have been parsed. If no valid fields, return error. 
	end
	
	def new_template
		
	end
	
	def upload_template
		#post = Template.save(params[:templatefile])
		@info = params[:templatefile]
		#render :text => "File has been uploaded successfully"
	end
	
	def new_domain 
		if session[:notice] != ""
			@notice = session[:notice]
			@fields = session[:fields]
			session[:notice], session[:fields] = nil
		end
	end
	
	def process_new_domain
		if params[:domain] != ""
			if domainAvailable(params[:id], params[:domain])
				# Make the new campaign record.
				id = Inputdomain.create(:campaign_id => params[:id], :domain => params[:domain])
				id.save
				session[:notice] = {'type' => "success", 'msg' => "The domain '#{params[:domain]}' has been added."}
				redirect_to "/campaign/#{params[:id]}"
			else
				# Return to the form. Pre-populate field. Error: Name = In use already.
				session[:fields] = params
				session[:notice] = {'type' => "error", 'msg' => "You already have the domain '#{params[:domain]}' associated with this campaign."}
				redirect_to "/campaign/#{params[:id]}/domain/new"
			end
		else
			session[:notice] = {'type' => "error", 'msg' => "You need to enter a domain name"}
			redirect_to "/campaign/#{params[:id]}/domain/new"
		end
	end

end
