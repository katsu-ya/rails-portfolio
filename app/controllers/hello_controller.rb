class HelloController < ApplicationController
  layout "hello"
  allow_unauthenticated_access only: [ :index ]

  def initialize
    super
    @header = "Hello page"
    @footer = "copyright SYODA-Tuyano 2025."
    @title = "Authenticate Sample"
  end

   def index
    @msg = "Messageの表示"
    @messages = Message.page(params[:page]).order("created_at DESC")
      .order("created_at DESC")
  end

  def other
    @msg = "このページはログイン必須です。"
    render "hello/index"
  end
end


    
