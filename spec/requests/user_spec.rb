require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET /index' do
    it 'returns http success for user index' do
      get '/user'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('user/index')
      expect(response.body).to include 'List of all Users'
    end

    it 'returns http success for user show' do
      get '/user/index'
      expect(response).to have_http_status(:success)
      expect(response).to render_template('user/show')
      expect(response.body).to include 'Here is the bio of the User'
    end
  end
end
