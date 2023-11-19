require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @user2 = User.create(name: 'Pheobe', photo: 'https://pheobelinktophoto.jpg', bio: 'I am a world class developer',
                         posts_counter: 0)
  end

  describe 'user#show' do
    before(:each) do
      @post1 = Post.create(title: 'post 1 title',
                           text: 'post content 1',
                           comments_counter: 0,
                           likes_counter: 0,
                           author: @user2)
      @post2 = Post.create(title: 'post 2 title',
                           text: 'post content 2',
                           comments_counter: 0,
                           likes_counter: 0,
                           author: @user2)
      @post3 = Post.create(title: 'post 3 title',
                           text: 'post content 3',
                           comments_counter: 0,
                           likes_counter: 0,
                           author: @user2)
      @post4 = Post.create(title: 'post 4 title',
                           text: 'post content 4',
                           comments_counter: 0,
                           likes_counter: 0,
                           author: @user2)

      visit "/user/#{@user2.id}/"
    end
    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://pheobelinktophoto.jpg')]")
    end
    it 'should show the username of all other users.' do
      expect(page).to have_content(@user2.name)
    end
    it 'should show number of posts each user has written.' do
      expect(page).to have_content 'Number of posts: 3'
    end
    it 'I can see the user bio.' do
      expect(page).to have_content 'I am a world class developer'
    end
    it 'I can see the user first 3 posts.' do
      expect(page).to_not have_content 'post content 1'
    end
    it 'I can see a button that lets me view all of a users posts.' do
      expect(page).to have_content 'See all posts'
    end
    it 'should redirect to that post show page when I click on a post' do
      click_link 'post 2 title'
      expect(page).to have_current_path("/user/#{@user2.id}/post/#{@post2.id}")
      puts page.html
    end
    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path("/user/#{@user2.id}/post")
    end
  end
end
