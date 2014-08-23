class Satellite < ActiveRecord::Base
	validates :name,{uniqueness: true, presence: true}
	
	has_many :children_satellites, class_name: 'Satellite', foreign_key: 'parent_id'
	belongs_to :parent_satellite, class_name: 'Satellite', foreign_key: 'parent_id'

end
