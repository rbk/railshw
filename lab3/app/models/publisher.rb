class Publisher < ActiveRecord::Base

	validates :name
	has_many :books

end
