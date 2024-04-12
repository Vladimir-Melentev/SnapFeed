class CommentsController < ApplicationController
  before_action :set_comment!
  def create
    @comment = @post.comments.build comment_params

    if @comment.save
      flash[:success] = "Comment created"
      redirect_to post_path(@post)
    else
      @comments = Comment.order created_at: :desc
      render 'posts/show'
    end
  end

  def edit
  end
  def destroy
    comment = @post.comments.find params[:id]
    comment.destroy
    flash[:success] = "Comment delete"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  def set_comment!
    @post = Post.find params[:post_id]
  end

end