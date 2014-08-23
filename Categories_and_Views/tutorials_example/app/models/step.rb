class Step < ActiveRecord::Base
	belongs_to :tutorial

	validates :title, :body, presence: true
	
	before_save :set_position
	
	def set_position
		if self.tutorial and position == nil
			self.position = self.tutorial.last_used_position + 1 
		end
	end
end
