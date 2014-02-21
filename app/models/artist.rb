class Artist < ActiveRecord::Base
	before_create :set_status_pending
	before_create :save_access_token

	has_many :applications
	has_many :installations


	def set_status_pending
		self.status = "pending"
	end

	def save_access_token
		self.access_token = SecureRandom.urlsafe_base64(nil, false)
	end
end
