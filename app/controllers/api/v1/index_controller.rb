# frozen_string_literal: true

class API::V1::IndexController < API::V1::BaseController
  def index
    render json: { controller: controller_name, action: action_name }, status: :ok
  end

  def about
    render json: { controller: controller_name, action: action_name }, status: :ok
  end
end
