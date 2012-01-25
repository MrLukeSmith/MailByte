module ApplicationHelper

def isLoggedIn
	if session[:user]
		return true
	else
		return false
	end
end

end
