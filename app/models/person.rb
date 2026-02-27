class Person < ApplicationRecord
  
  has_many :messages, dependent: :destroy

  validates :name, presence: { message: "は、必須項目です。" }
  validates :mail, email: { message: "はメールアドレスではありません。" }
  validates :age, numericality: { message: "は、数字で入力ください。" }
end




