class CreateOutreachActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :outreach_activities do |t|
      t.text :name
      t.text :description
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
