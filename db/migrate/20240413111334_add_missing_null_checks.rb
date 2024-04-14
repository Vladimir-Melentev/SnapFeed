# frozen_string_literal: true

class AddMissingNullChecks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :body, false
    change_column_null :comments, :body, false
  end
end
