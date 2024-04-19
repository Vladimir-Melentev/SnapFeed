# frozen_string_literal: true

class AddUserIdToComments < ActiveRecord::Migration[7.1]
  def change
    user_id_default = User.first&.id || 1 # Используйте статичное значение, например, 1, если нет пользователей в базе данных

    add_reference :comments, :user, null: false, foreign_key: true, default: user_id_default
  end
end
