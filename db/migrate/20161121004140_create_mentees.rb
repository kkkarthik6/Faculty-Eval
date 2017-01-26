class CreateMentees < ActiveRecord::Migration[5.0]
  def change
    create_table :mentees do |t|
      t.integer :mentee_type
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :banner_id
      t.text :study_stage
      t.datetime :expected_graduation
      t.text :support_source
      t.text :placement
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
