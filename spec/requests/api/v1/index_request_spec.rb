# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::V1::Indices', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/index/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /about' do
    it 'returns http success' do
      get '/api/v1/index/about'
      expect(response).to have_http_status(:success)
    end
  end
end
