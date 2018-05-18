class ChangeNameAndDatatypeForCategory < ActiveRecord::Migration[5.0]
  def change
  	rename_column :films, :category, :num_ep
  	change_column :films, :num_ep, :integer
  end
end
