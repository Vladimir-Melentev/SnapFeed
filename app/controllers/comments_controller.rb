# frozen_string_literal: true

class CommentsController < ApplicationController
  include PostsComments
  # модуль для якоря, чтобы добавить dom_id
  include ActionView::RecordIdentifier

  before_action :set_post!
  before_action :set_comment!, except: :create

  def edit; end

  def create
    @comment = @post.comments.build comment_create_params

    if @comment.save
      flash[:success] = 'Comment created'
      redirect_to post_path(@post)
    else
      load_post_comments(do_render: true)
    end
  end

  def update
    if @comment.update comment_update_params
      flash[:success] = 'Comment edited'
      # При редиректе генерирует ссылку включая якорь
      redirect_to post_path(@post, anchor: dom_id(@comment))
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment delete'
    redirect_to post_path(@post)
  end

  private

  def comment_create_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end

  def set_post!
    @post = Post.find params[:post_id]
  end

  def set_comment!
    @comment = @post.comments.find params[:id]
  end
end
