# frozen_string_literal: true

class AddImageDataToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :image_data, :text
  end
end
