# frozen_string_literal: true

class API::V1::BaseController < ActionController::API
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    render json:   { error: "Accesso negado!" },
           status: :unauthorized
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
                {
                  status: '400',
                  title:  'Bad Request',
                  detail: resource.errors,
                  code:   '100'
                }
              ]
    }, status:   :bad_request
  end
end
