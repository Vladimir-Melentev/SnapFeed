# frozen_string_literal: true

class AddUserIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true, default: User.first.id
  end
end

