class AddUrlAndTypeToSections < ActiveRecord::Migration
  def change
    add_column :sections, :url, :string
    add_column :sections, :type, :string
  end
end
