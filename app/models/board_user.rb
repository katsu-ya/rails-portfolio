class BoardUser < ApplicationRecord
  has_one :user
  has_many :board_message

  validates :nickname, presence: { message: "は、必須項目です。" }
end