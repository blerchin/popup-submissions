class Submission < ActiveRecord::Base
	mount_uploader :slide, SlideUploader	
	belongs_to :installation
	belongs_to :application
	
	def app_submission_ids
		@app_submission_ids ||= application.submissions.pluck(:id)
	end
	def next_id
		i = app_submission_ids.index(id) + 1
		i < app_submission_ids.length ? app_submission_ids[i] : nil
	end
	def prev_id
		i = app_submission_ids.index(id) - 1
		i > -1 ? app_submission_ids[i] : nil
	end
 
		
end
