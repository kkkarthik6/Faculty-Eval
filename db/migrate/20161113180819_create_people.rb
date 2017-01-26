class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.text :banner_id
      t.text :net_id
      t.text :first_name
      t.text :last_name
      t.text :position

      t.timestamps
    end
  end
end
