class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :type
      t.string :weight
      t.timestamps
    end
  end
end
