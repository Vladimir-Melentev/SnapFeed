# frozen_string_literal: true

class Subcomment < ApplicationRecord
  belongs_to :subcommentable, polymorphic: true
  belongs_to :user

  validates :body, presence: true, length: { minimum: 2 }
end
