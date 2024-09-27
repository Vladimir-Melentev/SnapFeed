# frozen_string_literal: true

module LikesHelper
  def like_count(post)
    Like.where(post_id: post.id).count
  end

  def current_user_liked_a_post(post)
    current_user&.likes&.find_by(post: post)
  end
end
