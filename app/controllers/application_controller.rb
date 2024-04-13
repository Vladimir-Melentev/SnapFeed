class ApplicationController < ActionController::Base
  include Pagy::Backend
  #подлючаем модуль на обработку ошибки из concerns
  include ErrorHandling

  private

  #Если есть user_id, ишем пользователя который хранится в сеансе
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  #Вспомогательный метод, который возвращает булево значение
  def user_signed_in?
    current_user.present?
  end

  #Делаем наши мтеоды херперами, чтобы были доступны в вью
  helper_method :current_user, :user_signed_in?
end
