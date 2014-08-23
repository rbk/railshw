class CreateSatellites < ActiveRecord::Migration
  def change
    create_table :satellites do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
