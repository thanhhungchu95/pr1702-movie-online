class AddCommentCountToFilm < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :comment_count, :integer
  end
end
