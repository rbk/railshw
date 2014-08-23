class Book < ActiveRecord::Base

	validates :title, :isbn, presence: true
	has_many :authors

end
