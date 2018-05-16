class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.references :film, foreign_key: true
      t.integer :num_epi
      t.string :duration

      t.timestamps
    end
  end
end
