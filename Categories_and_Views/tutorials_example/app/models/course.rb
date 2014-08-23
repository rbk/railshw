class Course < ActiveRecord::Base
	has_and_belongs_to_many :tutorials
	
	has_many :sections
	has_many :semesters, through: :sections
	
	## the old way
	# has_many :online_sections, conditions: {days: nil}, class_name: 'Section'
	
	## the new way
	# has_many :online_sections, Proc.new {where days: nil}, class_name: 'Section'
	
	# the new way with a stabby proc
	has_many :online_sections, -> {where days: nil}, class_name: 'Section'
end
