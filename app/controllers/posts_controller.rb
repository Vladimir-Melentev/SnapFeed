# frozen_string_literal: true

class PostsController < ApplicationController
  include PostsComments
  before_action :set_post!, only: %i[show destroy edit update]

  def index
    @pagy, @posts = pagy Post.include(:user).order(created_at: :desc)
    @posts = @posts.decorate
  end

  def show
    load_post_comments
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  def edit; end

  def update
    if @post.update post_params
      flash[:success] = 'Post edited'
      redirect_to posts_path
    else
      render :edit
    end
  end

  def index
    @pagy, @posts = pagy Post.order(created_at: :desc)
    @posts = @posts.decorate
  end

  def new
    @post = Post.new
  end



  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = 'Post created'
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post!
    # убрал find_by :id чтобы небыло ошибки с несуществующим id, создал метод в concerns/error
    @post = Post.find params[:id]
  end
end
