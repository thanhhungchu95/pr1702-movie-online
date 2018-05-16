class CreateFilmOrigins < ActiveRecord::Migration[5.0]
  def change
    create_table :film_origins do |t|
      t.references :film, foreign_key: true
      t.references :origin, foreign_key: true

      t.timestamps
    end
  end
end
