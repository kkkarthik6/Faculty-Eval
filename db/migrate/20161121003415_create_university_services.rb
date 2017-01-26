class CreateUniversityServices < ActiveRecord::Migration[5.0]
  def change
    create_table :university_services do |t|
      t.text :position
      t.integer :type
      t.text :description
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
