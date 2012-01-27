module ApplicationHelper

def isLoggedIn
	if session[:user]
		return true
	else
		return false
	end
end

def menu
	theMenu = ""
	if loggedIn
		theMenu += "Hello #{session[:user][:name]} [#{link_to "Logout", "/logout"}] | "
		theMenu += "Balance: #{session[:user][:balance]} (Tarif: ###) | "
		theMenu += "#{link_to "Dashboard", "/dashboard"} - #{link_to "Campaigns", "/campaign"}"
	else
		theMenu += "Hello Guest. #{link_to "Login", "/login"}"
	end
	return raw theMenu
end

end
