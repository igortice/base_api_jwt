require 'rails_helper'

RSpec.describe 'API::V1::Auth::RegistrationsRequests', type: :request do
  describe 'POST /auth/register' do
    let(:url) { '/auth/register' }

    context 'quando usuario já existe' do
      before do
        user   = Fabricate(:user)
        params = {
          user: {
            email:    user.email,
            password: user.password
          }
        }
        post url, params: params
      end

      it 'returns 400, bad request' do
        expect(response.status).to eq 400
      end

      it 'returns validation errors' do
        json = JSON.parse response.body
        expect(json['errors'].first['title']).to eq('Bad Request')
      end
    end
  end

  describe 'DELETE /auth/unregister' do
    let(:url) { '/auth/unregister' }
    pending ''
  end
end
