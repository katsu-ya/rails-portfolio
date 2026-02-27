class Comment < ApplicationRecord
  belongs_to :post

  # 親コメント（返信じゃない場合は nil）
  belongs_to :parent, class_name: "Comment", optional: true

  # 子コメント（返信）
  has_many :replies,
           class_name: "Comment",
           foreign_key: :parent_id,
           dependent: :destroy

  validates :content, presence: true
end
