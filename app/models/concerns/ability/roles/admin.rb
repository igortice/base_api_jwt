# frozen_string_literal: true

module Ability::Roles::Admin
  extend ActiveSupport::Concern

  included do
    def admin
      can :manage, :all
    end
  end
end
