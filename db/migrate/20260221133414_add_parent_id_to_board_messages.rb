class AddParentIdToBoardMessages < ActiveRecord::Migration[8.1]
  def change
    add_column :board_messages, :parent_id, :integer
  end
end
