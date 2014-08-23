class CreateCoursesTutorialsTable < ActiveRecord::Migration
  def change
    create_table :courses_tutorials do |t|
			t.integer :course_id
			t.integer :tutorial_id
    end
  end
end
