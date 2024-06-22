# frozen_string_literal: true

RSpec.describe 'Users' do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end
end
