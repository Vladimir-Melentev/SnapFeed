# frozen_string_literal: true

class Post < ApplicationRecord
  include Subcommentable

  # Позволит удалить пост вместе с комментариями
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
end
