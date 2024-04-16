# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Authorization
  # подлючаем модуль на обработку ошибки из concerns
  include ErrorHandling
  include Authentication
end
