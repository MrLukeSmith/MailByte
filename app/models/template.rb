class Template < ActiveRecord::Base
	belongs_to :campaign
	
	def self.save(upload)
		name =  upload.original_filename
		directory = "#{Rails.root}/templates"
		# create the file path
		path = File.join(directory, name)
		# write the file
    if FileTest.exists?(path)
      @notice = "File already exists"
		else
      File.open(path, "wb") { |f| f.write(upload.read) }
      @notice = "File uploaded"
    end
	end

end
