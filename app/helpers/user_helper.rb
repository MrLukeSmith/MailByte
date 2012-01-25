module UserHelper 

	def totalUsers
		return User.count
	end
	
	def emailInUse(email)
		if User.where(:email => email).count > 0
			return true
		else
			return false
		end
	end
	
	def loggedIn
		if session[:user]
			return true
		else
			return false
		end
	end

end
