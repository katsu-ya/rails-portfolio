class Message < ApplicationRecord
  belongs_to :person
  self.per_page = 3 #ページ当たりの項目数
  validates :message, presence: {message:'を書いてください。'}
end
