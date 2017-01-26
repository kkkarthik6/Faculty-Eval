class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.text :publication_type
      t.text :body
      t.text :url
      t.references :report, foreign_key: true
    end
  end
end
