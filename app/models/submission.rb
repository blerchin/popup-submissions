class Submission < ActiveRecord::Base
	mount_uploader :slide, SlideUploader	
	belongs_to :installation
	belongs_to :application
	
end
