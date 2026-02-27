class CreateBoardUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :board_users do |t|
      t.text :nickname
      t.integer :user_id
      t.text :memo

      t.timestamps
    end
  end
end
