class Artist < ActiveRecord::Base
	before_create :set_status_pending
	before_create :save_access_token

	has_many :applications
	has_many :installations

	validates_presence_of :first_name, :last_name, :email, :phone
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }


	def full_name
		"#{first_name} #{last_name}"
	end
	def set_status_pending
		self.status = "pending"
	end

	def save_access_token
		self.access_token = SecureRandom.urlsafe_base64(nil, false)
	end
end
