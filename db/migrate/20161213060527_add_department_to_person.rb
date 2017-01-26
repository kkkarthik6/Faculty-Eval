class AddDepartmentToPerson < ActiveRecord::Migration[5.0]
  def change
    add_reference :people, :department, foreign_key: true
  end
end
