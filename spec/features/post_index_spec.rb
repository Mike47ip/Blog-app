require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Lawrence', photo: 'https://abellinktophoto.jpg', bio: 'Food enthusiast',
                         posts_counter: 0)
    @post1 = Post.create(title: 'post 1 title',
                         text: 'post content 1',
                         comments_counter: 3,
                         likes_counter: 0,
                         author: @user1)
    @comment1 = Comment.create(text: 'First comment from Lawrence', author_id: @user1.id, post_id: @post1.id)
  end

  describe 'post index' do
    before(:each) do
      visit "/user/#{@user1.id}/post"
    end
    it 'I can see the user\'s profile picture.' do
      expect(page).to have_xpath("//img[contains(@src,'https://abellinktophoto.jpg')]")
    end
    it 'I can see the user\'s username.' do
      expect(page).to have_content(@user1.name)
    end
    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content 'Number of posts: 0'
    end
    it 'I can see a post\'s title.' do
      expect(page).to have_content 'post 1 title'
    end
    it 'I can see some of the post\'s body.' do
      expect(page).to have_content 'post content 1'
    end
    it 'I can see the first comments on a post.' do
      expect(page).to have_content 'First comment from Lawrence'
    end
    it 'I can see how many comments a post has.' do
      expect(page).to have_content 'Comments: 5'
      expect(page).to_not have_content 'Comments: 0'
    end
    it 'I can see how many likes a post has.' do
      expect(page).to_not have_content 'Likes: 1'
      expect(page).to have_content 'Likes: 0'
    end
    it 'When I click on a post, it redirects me to that posts show page.' do
      click_link 'post 1 title'
      expect(page).to have_current_path("/user/#{@user1.id}/post/#{@post1.id}")
    end
    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'Pagnation'
    end
  end
end
