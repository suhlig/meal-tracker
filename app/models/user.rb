class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  passwordless_with :email

  has_many(
      :sessions,
      class_name: 'Passwordless::Session',
      foreign_key: 'authenticatable_id'
    )
end
