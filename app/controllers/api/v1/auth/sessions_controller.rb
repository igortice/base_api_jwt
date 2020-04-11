# frozen_string_literal: true

class API::V1::Auth::SessionsController < Devise::SessionsController
  private
    def respond_with(resource, _opts = {})
      render json: resource.as_json(only: [:id, :email])
    end

    def respond_to_on_destroy
      head :no_content
    end
end
