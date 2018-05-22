class ExpandNumCharForLink < ActiveRecord::Migration[5.0]
  def change
  	change_column :link_episodes, :link, :string, limit: 5000
  end
end
