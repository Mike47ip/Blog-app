require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user = User.create(name: 'Someone', photo: '', bio: 'Yet another human.',posts_counter: 0)
    @user.save
    @post = Post.create(author_id: @user, title: 'Hello world', text: 'Hello world body', likes_counter: 0, comments_counter: 0)
    @post.save
    @comment = Comment.create(author_id: @user, post: @post, text: 'Hello world comment')
  end

  describe 'Associations' do

    it 'should belong to a post' do
      expect(@comment.post).to eq(@post)
    end
  end
end
