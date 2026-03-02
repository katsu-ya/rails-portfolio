class BoardMessagesController < ApplicationController
  before_action :set_board_user
  layout "board_messages"

  def index
    @board_message = BoardMessage.new
    @board_messages = BoardMessage
                      .where(parent_id: nil)
                      .order(created_at: :desc)
                      .paginate(page: params[:page])
  end

  def show
    redirect_to board_messages_path
  end

  def new
    @board_message = BoardMessage.new(parent_id: params[:parent_id])
  end

  def edit
    redirect_to board_messages_path
  end

  def create
    @board_message = BoardMessage.new(board_message_params)
    @board_message.board_user = @board_user

  if @board_message.save
    redirect_to board_messages_path, notice: "投稿しました"
    else
      @board_messages = BoardMessage
                        .where(parent_id: nil)
                        .order(created_at: :desc)
                        .paginate(page: params[:page])

      render :index, status: :unprocessable_entity
    end
  end








  def update
    redirect_to board_messages_path
  end


  def destroy
    board_message = BoardMessage.find(params[:id])

  # 本人チェック
  if board_message.board_user == @board_user
      board_message.destroy
      redirect_to board_messages_path, notice: "投稿を削除しました"
    else
      redirect_to board_messages_path, alert: "削除できません"
    end
  end


  private

  def set_board_user
    @current_account = authenticated?.user
    @board_user = BoardUser.find_or_create_by(user_id: @current_account.id) do |user|
      user.nickname = "<<no name>>"
    end
  end

  def board_message_params
    params.require(:board_message).permit(:content, :parent_id)
  end
end



