class CommentsController < ApplicationController
  def create
  @comment = @post.comments.new(comment_params)

  if @comment.save
    redirect_to post_path(@post)
  else
    render "posts/show", status: :unprocessable_entity
  end
end

private

def comment_params
  params.require(:comment).permit(:content, :parent_id)
end


