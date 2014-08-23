class Lightsaber < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :color, :inclusion => { :in => %w{green blue yellow purple red} }
end
