# frozen_string_literal: true

class API::V1::UsersController < API::V1::BaseController
  load_and_authorize_resource

  # GET /api/v1/users
  def index
    users = @users.page(params[:page])

    render json: users
  end

  # GET /api/v1/users/1
  def show
    render json: @user
  end

  # POST /api/v1/users
  # def create
  #   @api_v1_user = API::V1::User.new(api_v1_user_params)
  #
  #   if @api_v1_user.save
  #     render json: @api_v1_user, status: :created, location: @api_v1_user
  #   else
  #     render json: @api_v1_user.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /api/v1/users/1
  # def update
  #   if @api_v1_user.update(api_v1_user_params)
  #     render json: @api_v1_user
  #   else
  #     render json: @api_v1_user.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /api/v1/users/1
  # def destroy
  #   @user.destroy
  # end
end
