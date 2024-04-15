# frozen_string_literal: true

module Subcommentable
  extend ActiveSupport::Concern

  included do
    has_many :subcomments, as: :subcommentable, dependent: :destroy
  end
end
