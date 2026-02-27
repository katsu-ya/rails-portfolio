class AddParentIdToComments < ActiveRecord::Migration[8.1]
  def change
    add_column :comments, :parent_id, :integer
  end
end
