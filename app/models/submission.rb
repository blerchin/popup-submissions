class Submission < ActiveRecord::Base
	mount_uploader :slide, SlideUploader	
	belongs_to :artist
end
