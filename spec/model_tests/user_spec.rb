require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }

    it do
      should validate_numericality_of(:posts_counter)
        .only_integer
        .is_greater_than_or_equal_to(0)
    end
  end

  describe "Associations" do
    it { should have_many(:posts).with_foreign_key(:author_id) }
    it { should have_many(:comments).with_foreign_key(:author_id) }
    it { should have_many(:likes).with_foreign_key(:author_id) }
  end

  describe "Methods" do
    let!(:user) { create(:user) }

    it "returns the three most recent posts" do
      post1 = create(:post, author: user, created_at: 2.days.ago)
      post2 = create(:post, author: user, created_at: 1.day.ago)
      post3 = create(:post, author: user, created_at: Time.current)
      post4 = create(:post, author: user, created_at: 3.days.ago)

      recent_posts = user.recent_posts
      expect(recent_posts).to eq([post3, post2, post1])
    end

    it "updates the posts counter" do
      expect(user.posts_counter).to eq(0)

      create(:post, author: user)
      user.reload
      expect(user.posts_counter).to eq(1)

      create(:post, author: user)
      user.reload
      expect(user.posts_counter).to eq(2)
    end
  end
end
