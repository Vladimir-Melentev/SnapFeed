# frozen_string_literal: true

class PostsController < ApplicationController
  include PostsComments
  before_action :require_authentication, except: %i[show index]
  before_action :set_post!, only: %i[show destroy edit update]
  before_action :fetch_tags, only: %i[new edit]
  before_action :authorize_post!
  # метод пандит на права доступа
  after_action :verify_authorized

  def index
    @pagy, @posts = pagy Post.all_by_tags(params[:tag_ids])
    @posts = @posts.decorate
    @tags = Tag.all
  end

  def show
    load_post_comments
  end

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def edit; end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = 'Post created'
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    if @post.update post_params
      flash[:success] = 'Post edited'
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, tag_ids: [])
  end

  def set_post!
    # убрал find_by :id чтобы небыло ошибки с несуществующим id, создал метод в concerns/error
    @post = Post.find params[:id]
  end

  def fetch_tags
    @tags = Tag.all
  end

  # authorize метод пандит, имеет ли пользователь право на вылолнение
  def authorize_post!
    authorize(@post || Post)
  end
end
