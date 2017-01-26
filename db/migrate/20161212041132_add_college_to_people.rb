class AddCollegeToPeople < ActiveRecord::Migration[5.0]
  def change
    add_reference :people, :colleges, foreign_key: true
  end
end
