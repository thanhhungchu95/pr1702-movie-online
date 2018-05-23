class AddIndexToRatings < ActiveRecord::Migration[5.0]
  def change
    add_index :ratings, [:film_id, :user_id], unique: true
  end
end
