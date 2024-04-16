# frozen_string_literal: true

class Comment < ApplicationRecord
  include Authorship
  include Subcommentable

  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: { minimum: 2 }
end
