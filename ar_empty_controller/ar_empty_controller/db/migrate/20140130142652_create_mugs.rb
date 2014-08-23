class CreateMugs < ActiveRecord::Migration
  def change
    create_table :mugs do |t|
      t.integer :capacity
      t.string :material
      t.text :decoration

      t.timestamps
    end
  end
end
