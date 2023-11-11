class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_comments_counter

  # Define a method to update the comments counter for a post
  def update_comments_counter
    Post.find_by(id: post_id).increment!(:comments_counter)
  end
end
