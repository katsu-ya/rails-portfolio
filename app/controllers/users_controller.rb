class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  layout 'board_users'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for(@user)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = Current.user
  end

  def update
    @user = Current.user
    if @user.update(user_params)
      redirect_to root_path, notice: "更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:email_address, :password, :password_confirmation)
  end
  
end
