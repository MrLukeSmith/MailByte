class Template < ActiveRecord::Base
	belongs_to :campaign
	
	def self.save(upload)
		name =  upload['templatefile'].name
		directory = "templates"
		# create the file path
		path = File.join(directory, name)
		# write the file
		File.open(path, "wb") { |f| f.write(upload['templatefile'].read) }
	end

end
