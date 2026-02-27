class CreateAnswers < ActiveRecord::Migration[8.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :content
      t.text :name

      t.timestamps
    end
  end
end
