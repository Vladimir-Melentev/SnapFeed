class ApplicationController < ActionController::Base
  #подлючаем модуль на обработку ошибки из concerns
  include ErrorHandling
end
