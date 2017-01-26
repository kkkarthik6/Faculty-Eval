class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :report_year
      t.integer :rank
      t.text :department
      t.text :self_evaluation_text
      t.text :future_plans_text
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
