# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  validates :password,
            length: { minimum: 6 },
            allow_nil: true

   # トークン生成
  def generate_reset_password_token!
    update!(
      reset_password_token: SecureRandom.urlsafe_base64,
      reset_password_sent_at: Time.current
    )
  end

  # トークン有効期限（例：2時間）
  def reset_password_token_valid?
    reset_password_sent_at.present? &&
      reset_password_sent_at > 2.hours.ago
  end

  def clear_reset_password_token!
    update!(
      reset_password_token: nil,
      reset_password_sent_at: nil
    )
  end
end
