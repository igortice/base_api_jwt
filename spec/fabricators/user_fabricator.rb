# frozen_string_literal: true

Fabricator(:user) do
  id 1
  email { Faker::Internet.email }
  password '123456'
  roles_mask 1
end
