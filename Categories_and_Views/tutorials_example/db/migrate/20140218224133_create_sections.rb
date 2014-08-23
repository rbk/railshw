class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :days
      t.string :times
      t.references :course, index: true
      t.references :semester, index: true

      t.timestamps
    end
  end
end
