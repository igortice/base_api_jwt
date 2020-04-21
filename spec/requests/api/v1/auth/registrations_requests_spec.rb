# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::V1::Auth::RegistrationsRequests', type: :request do
  describe 'POST /auth/register' do
    let(:url) { '/auth/register' }
    let(:params) do
      {
        user: {
          email:    'user@example.com',
          password: 'password'
        }
      }
    end

    context 'quando usuario não existe' do
      before { post url, params: params }

      it 'returns 200' do
        expect(response.status).to eq 200
      end

      it 'returns new user body' do
        expect(JSON.parse(response.body)).to eq User.last.as_json
      end
    end

    context 'quando usuario já existe' do
      before do
        Fabricate :user, email: params[:user][:email]
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
