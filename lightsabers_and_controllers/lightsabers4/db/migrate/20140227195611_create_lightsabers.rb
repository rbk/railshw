class CreateLightsabers < ActiveRecord::Migration
  def change
    create_table :lightsabers do |t|
      t.string :name
      t.text :description
      t.string :color
      t.boolean :darkside
      t.string :image

      t.timestamps
    end
  end
end
