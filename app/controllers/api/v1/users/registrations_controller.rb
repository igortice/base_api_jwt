# frozen_string_literal: true

class API::V1::Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end
end
