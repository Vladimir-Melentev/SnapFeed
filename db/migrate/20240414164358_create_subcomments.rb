# frozen_string_literal: true

class CreateSubcomments < ActiveRecord::Migration[7.1]
  def change
    create_table :subcomments do |t|
      t.string :body
      t.references :subcommentable, polymorphic: true, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
