class Campaign < ActiveRecord::Base
	belongs_to :user
	has_many :subscribers
	
	def totalSubscribers()
		return self.subscribers.find(:all).count
	end

end
