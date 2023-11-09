require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe 'GET /index' do
    it 'returns http success for post index' do
      get '/user/index/post'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('post/index')
      expect(response.body).to include 'list of all post'
    end

    it 'returns http success for post show' do
      get '/user/index/post/index'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('post/show')
      expect(response.body).to include 'post details with its comments'
    end
  end
end