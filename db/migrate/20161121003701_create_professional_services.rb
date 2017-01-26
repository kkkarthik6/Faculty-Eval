class CreateProfessionalServices < ActiveRecord::Migration[5.0]
  def change
    create_table :professional_services do |t|
      t.text :title
      t.text :description
      t.integer :type
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
