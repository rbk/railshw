class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :number
      t.integer :credits

      t.timestamps
    end
  end
end
