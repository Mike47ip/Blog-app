class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  # Remove redundant before_save callback
  after_save :update_comments_counter
  after_destroy :reset_comments_counter

  # Define a method to update the comments counter for a post
  def update_comments_counter
    # Use safe navigation (&.) and check for the presence of the post
    post = Post.find_by(id: post_id)
    post&.increment!(:comments_counter) if post.present?
  end

  # Define a method to reset the comments counter for a post
  def reset_comments_counter
    # Use safe navigation (&.) and check for the presence of the post
    post = Post.find_by(id: post_id)
    post&.decrement!(:comments_counter) if post.present?
  end
end
