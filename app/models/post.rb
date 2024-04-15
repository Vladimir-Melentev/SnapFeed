# frozen_string_literal: true

class Post < ApplicationRecord
  include Subcommentable

  # Позволит удалить пост вместе с комментариями
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }

  #метод класса который можем вызвать
  scope :all_by_tags, ->(tags) do
    posts = includes(:user)
    if tags
      posts = posts.joins(:tags).where(tags: tags).preload(:tags)
    else
      posts = posts.includes(:post_tags, :tags)
    end

    posts.order(created_at: :desc)
  end
end

