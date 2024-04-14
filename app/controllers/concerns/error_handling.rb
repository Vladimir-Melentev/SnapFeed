# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern

  included do
    # Обработка ошибки RecordNotFound в методе notfound
    rescue_from ActiveRecord::RecordNotFound, with: :notfound

    private

    def notfound(exception)
      # Записываем ошибку в лог и рендерим форму ошибки
      logger.warn exception
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
