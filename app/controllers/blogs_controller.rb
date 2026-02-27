class BlogsController < ApplicationController
  before_action :set_post, only: [ :show ]
  layout "post"

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "新しい投稿を行いました。"
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end



   def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
