class CreateBoardMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :board_messages do |t|
      t.text :content
      t.integer :board_user_id
      t.timestamps
    end
  end
end
