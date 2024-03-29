class Campaign < ActiveRecord::Base
	belongs_to :user
	has_many :subscribers
	has_many :templates
	has_many :inputdomains
	
	def totalSubscribers()
		return self.subscribers.find(:all).count
	end
	
	def totalTemplates()
		return self.templates.find(:all).count
	end
	
	def totalInputdomains()
		return self.inputdomains.find(:all).count
	end

end
