require 'rails_helper'

RSpec.describe 'API::V1::Auth::SessionsRequests', type: :request do
  describe 'POST /auth/login' do
    let(:url) { '/auth/login' }
    let(:user) { Fabricate(:user) }
    let(:params) do
      {
        user: {
          email:    user.email,
          password: user.password
        }
      }
    end

    context 'login errado' do
      before { post url }

      it 'returns unathorized status 401' do
        expect(response.status).to eq 401
      end
    end

    context 'login correto' do
      before do
        post url, params: params
      end

      it 'returns 200 ok' do
        expect(response).to have_http_status(200)
      end

      it 'returns JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end

      it 'returns valid JWT token' do
        token_from_request = response.headers['Authorization'].split(' ').last
        decoded_token      = JWT.decode(token_from_request, Rails.application.credentials.dig(:devise, :jwt_secret), true)
        expect(decoded_token.first['sub']).to be_present
      end

      it 'return body json: {id, email}' do
        expect(response.body).equal? user.to_json(only: [:id, :email])
      end
    end
  end

  describe 'DELETE /auth/logout' do
    let(:url) { '/auth/logout' }

    it 'returns 204, no content' do
      delete url
      expect(response).to have_http_status(204)
    end
  end
end
