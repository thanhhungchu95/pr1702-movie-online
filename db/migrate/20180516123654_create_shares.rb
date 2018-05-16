class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.integer :shared_user_id
      t.integer :sharing_user_id
      t.references :film, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
