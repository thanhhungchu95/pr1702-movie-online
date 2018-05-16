class CreateLinkEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :link_episodes do |t|
      t.references :episode, foreign_key: true
      t.string :link
      t.integer :quality

      t.timestamps
    end
  end
end
