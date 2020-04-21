# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :roles

  def roles
    object.roles_mask
  end
end
