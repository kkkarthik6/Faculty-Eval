class RemoveCollegesIdFromPerson < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :colleges_id, :integer
  end
end
