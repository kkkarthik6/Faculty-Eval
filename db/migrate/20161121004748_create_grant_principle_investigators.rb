class CreateGrantPrincipleInvestigators < ActiveRecord::Migration[5.0]
  def change
    create_table :grant_principle_investigators do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :banner_id
      t.references :person, foreign_key: true
      t.references :grant, foreign_key: true

      t.timestamps
    end
  end
end
