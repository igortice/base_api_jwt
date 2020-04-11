# frozen_string_literal: true

Fabricator(:user) do
  email { Faker::Internet.email }
  password { '123456' }
end
