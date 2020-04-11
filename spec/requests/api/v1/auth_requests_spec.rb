require 'rails_helper'

RSpec.describe "API::V1::AuthRequests", type: :request do
  describe "POST /auth/login" do
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

    context 'com login params' do
      before do
        post url, params: params
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns JTW token in authorization header' do
        expect(response.headers['Authorization']).to be_present
      end
    end

    context 'com login params incorretos' do
      before { post url }

      it 'returns unathorized status' do
        expect(response.status).to eq 401
      end
    end
  end
end
