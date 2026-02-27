class RemovePoatIdFromComments < ActiveRecord::Migration[8.1]
  def change
    remove_column :comments, :poat_id, :integer
  end
end
