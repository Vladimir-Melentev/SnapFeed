class CommentsController < ApplicationController
  #модуль для якоря, чтобы добавить dom_id
  include ActionView::RecordIdentifier

  before_action :set_post!
  before_action :set_comment!, except: :create

  def update
    if @comment.update comment_params
      flash[:success] = "Comment edited"
      #При редиректе генерирует ссылку включая якорь
      redirect_to post_path(@post, anchor: dom_id(@comment))
    else
      render :edit
    end
  end

  def edit; end

  def create
    @comment = @post.comments.build comment_params

    if @comment.save
      flash[:success] = "Comment created"
      redirect_to post_path(@post)
    else
      @comments = @post.comments.order created_at: :desc
      render 'posts/show'
    end
  end


  def destroy
    @comment.destroy
    flash[:success] = "Comment delete"
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post!
    @post = Post.find params[:post_id]
  end

  def set_comment!
    @comment = @post.comments.find params[:id]
  end

end