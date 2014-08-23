class Episode < ActiveRecord::Base
	validates :title, :description, :episode_number, { presence: true }
	validates :episode_number, { uniqueness: true, numericality: true }
end
