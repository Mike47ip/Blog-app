class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_validation :set_default

  # :Confirmable
  # Associations
  # A user has many posts
  # A user has many comments
  # A user has many likes
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id


  # The 3 most recent posts for a user
  scope :recent_posts, ->(user) { user.posts.order('created_at desc').limit(3) }

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def set_default
    self.posts_counter = 0
  end
end
