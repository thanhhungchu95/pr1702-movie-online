class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :name
      t.string :alter_name
      t.integer :copyright_year
      t.text :description
      t.string :img
      t.integer :category
      t.integer :num_view

      t.timestamps
    end
  end
end
