class BoardMessage < ApplicationRecord
  belongs_to :board_user
  self.per_page = 5

  # 親メッセージ
  belongs_to :parent,
             class_name: "BoardMessage",
             optional: true

  # 返信（子）
  has_many :replies,
           class_name: "BoardMessage",
           foreign_key: :parent_id,
           dependent: :destroy

  validates :content, presence: { message: "は、必須項目です。" }
end
