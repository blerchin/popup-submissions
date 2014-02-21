class Installation < ActiveRecord::Base
	belongs_to :artist
	belongs_to :exhibition
	has_many   :submissions
end
