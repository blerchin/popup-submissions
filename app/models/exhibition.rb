class Exhibition < ActiveRecord::Base
	has_many :applications
	has_many :installations

	scope :open, lambda {
		where("submission_start < ?", Time.now)
			.where("submission_end   > ?", Time.now)
	}
end
