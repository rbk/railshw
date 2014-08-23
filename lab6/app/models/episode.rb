class Episode < ActiveRecord::Base
	validates :title, :description, :episode_number, { presence: true }
	validates :episode_number, { numericality: true }
	belongs_to :series
end
