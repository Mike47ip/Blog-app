class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  # Define a method to update the comments counter for a post
  def self.update_comments_counter(post)
    comments_count = where(post:).count
    post.update(comments_counter: comments_count)
  end
end
