class CreateGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :grants do |t|
      t.integer :status
      t.text :title
      t.text :duration
      t.decimal :total_funding
      t.decimal :unm_portion
      t.decimal :soe_portion
      t.text :granscol
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
