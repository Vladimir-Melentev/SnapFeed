class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to SnapFeed, #{@user.name}"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  #метод говорит что в параметрах должен быть юзер и мы разрешаем перечисленные атрибуты
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end