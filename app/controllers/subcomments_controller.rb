# frozen_string_literal: true

class SubcommentsController < ApplicationController
  include PostsComments
  before_action :set_subcommentable!
  before_action :set_post
  after_action :verify_authorized

  def create
    @subcomment = @subcommentable.subcomments.build subcomment_params
    authorize @subcomment

    if @subcomment.save
      flash[:success] = 'Comment created'
      redirect_to post_path(@post)
    else
      @subcomment = @subcomment.decorate
      load_post_comments do_render: true
    end
  end

  def destroy
    subcomment = @subcommentable.subcomments.find params[:id]
    authorize subcomment

    subcomment.destroy
    flash[:success] = 'Sub-comment delete!'
    redirect_to post_path(@post)
  end

  private

  def subcomment_params
    params.require(:subcomment).permit(:body).merge(user: current_user)
  end

  def set_subcommentable!
    klass = [Post, Comment].detect { |c| params["#{c.name.underscore}_id"] }
    raise ActiveRecord::RecordNotFound if klass.blank?

    @subcommentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_post
    @post = @subcommentable.is_a?(Post) ? @subcommentable : @subcommentable.post
  end
end
