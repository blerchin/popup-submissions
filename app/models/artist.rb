class Artist < ActiveRecord::Base
	before_create :set_status_pending
	before_create :save_access_token

	has_many :submissions

	accepts_nested_attributes_for :submissions

	def set_status_pending
		self.status = "pending"
	end

	def save_access_token
		self.access_token = SecureRandom.urlsafe_base64(nil, false)
	end
end
