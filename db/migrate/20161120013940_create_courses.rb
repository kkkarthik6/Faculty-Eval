class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.text :course_number
      t.text :course_title
      t.integer :enrollment
      t.integer :year
      t.text :semester
      t.text :evaluation_results
      t.boolean :taught
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
