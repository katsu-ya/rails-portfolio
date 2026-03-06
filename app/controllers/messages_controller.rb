class MessagesController < ApplicationController
  layout "messages"
  before_action :set_person
  before_action :set_person, only: [:index, :new, :create]

  def index
    @person = Person.find(params[:person_id])
    @messages = @person.messages
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = @person.messages.build
  end

  def create
    @person = Person.find(params[:person_id])
    @message = @person.messages.build(message_params)

    if @message.save
      redirect_to @message, notice: "メッセージを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to person_message_path(@person, @message)
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to person_messages_path(@person)
  end

  private

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_message
    @message = @person.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :message)
  end

end
