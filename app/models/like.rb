class Like < ApplicationRecord
  # Associations
  # A like belongs to an author
  # A like belongs to a post
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_likes_counter

  # Define a method to update the likes counter for a post

  def update_likes_counter
    Post.find_by(id: post_id).increment!(:likes_counter)
  end
end
