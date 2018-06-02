class AddRatePointToFilm < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :rate_point, :float
  end
end
