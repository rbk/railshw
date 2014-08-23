class Category < ActiveRecord::Base
	belongs_to :parent_category, class_name: 'Category', foreign_key: 'parent_category'
	has_many :sub_categories, class_name: 'Category', foreign_key: 'parent_category'
end
