# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  include ::Ability::Roles::Config

  before_create :set_default_role

  # KAMINARI
  # paginates_per 1
  # max_paginates_per 100

  private

    def set_default_role
      self.roles = ROLES[1] unless roles.present?
    end
end
