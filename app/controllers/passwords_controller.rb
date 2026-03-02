# app/controllers/passwords_controller.rb
class PasswordsController < ApplicationController 
  allow_unauthenticated_access 
 # skip_before_action :require_authentication
  layout "authentication"

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email_address: params[:email_address])

    if user
      user.update!(
          reset_password_token: SecureRandom.urlsafe_base64,
          reset_password_sent_at: Time.current
        )

        # 本来はメール送信
        # Rails.logger.debug "RESET URL: #{edit_password_url(user.reset_password_token)}"
        redirect_to edit_password_path(user.reset_password_token),
                  notice: "新しいパスワードを設定してください"
    else
      # redirect_to new_session_path, notice: "パスワード再設定用の案内を送信しました"
      flash.now[:alert] = "メールアドレスが見つかりません"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @token = params[:token]
    @user = User.find_by!(reset_password_token: params[:token])
  end

  def update
    @token = params[:token]
    @user = User.find_by!(reset_password_token: params[:token])

      if @user.update(password_params.merge(reset_password_token: nil))
         @user.update!(reset_password_token: nil) # ← 再利用防止
         redirect_to new_session_path, notice: "パスワードを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
