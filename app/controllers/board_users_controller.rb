class BoardUsersController < ApplicationController
  before_action :require_authentication
  before_action :set_board_user
  before_action :redirect_if_no_name, except: [:edit, :update]
  layout 'board_users'

  def show
  end

  def edit
  end

  def update
    if @board_user.update(board_user_params)
      redirect_to board_user_path  # notice: "ニックネームを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_board_user
    @current_account = authenticated?.user
    @board_user = BoardUser.find_or_create_by(user_id: @current_account.id) do |user|
      user.nickname = "<<no name>>"
    end
  end

  def redirect_if_no_name
    if @board_user.nickname == "<<no name>>"
      redirect_to edit_board_user_path, alert: "ニックネームを設定してください"
    end
  end

  def board_user_params
    params.require(:board_user).permit(:nickname)
  end
end
