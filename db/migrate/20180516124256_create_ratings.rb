class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :film, foreign_key: true
      t.integer :star

      t.timestamps
    end
  end
end
