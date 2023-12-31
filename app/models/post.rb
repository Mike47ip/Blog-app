class Post < ApplicationRecord
  # Associations
  # A post belongs to an author
  # A post has many comments
  # A post has many likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :update_posts_counter_for_user
  # before_save :update_posts_counter
  # before_save :update_user_posts_counter

  # The 3 most recent comments for a given post
  scope :recent_comments, ->(post) { post.comments.order(created_at: :desc).limit(5) }

  # Add validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter_for_user
    author.increment!(:posts_counter) if author.present?
  end
end
