class Like < ApplicationRecord
  # Associations
  # A like belongs to an author
  # A like belongs to a post
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  # Define a method to update the likes counter for a post
  def self.update_likes_counter(post)
    likes_count = where(post:).count
    post.update(likes_counter: likes_count)
  end
end
