class Application < ActiveRecord::Base
	has_many :submissions
	belongs_to :artist
	belongs_to :exhibition

	accepts_nested_attributes_for :submissions
end
