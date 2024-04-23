# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(@user.id)
    redirect_to @user, notice: 'You have subscribed to a user.'
  end

  def destroy
    current_user.unfollow(@user.id)
    redirect_to @user, notice: 'You have unsubscribed from the user.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
