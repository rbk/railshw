class Tutorial < ActiveRecord::Base
	has_many :steps
	has_and_belongs_to_many :courses
	
	def last_used_position
		last = self.steps.order(:position).last
		if last and last.position
			last.position
		else
			0
		end
	end
end
