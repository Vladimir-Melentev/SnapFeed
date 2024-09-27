# frozen_string_literal: true

class RemoveDefaultUserIdFromPostsComments < ActiveRecord::Migration[7.1]
  def change
    def up
      change_column_default :posts, :user_id, from: User.first.id, to: nil
      change_column_default :comments, :user_id, from: User.first.id, to: nil
    end

    def down
      change_column_default :posts, :user_id, from: nil, to: User.first.id
      change_column_default :comments, :user_id, from: nil, to: User.first.id
    end
  end
end
