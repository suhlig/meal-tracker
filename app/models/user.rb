require 'domain_validator'

class User < ApplicationRecord
  passwordless_with :email
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_with DomainValidator
  has_many( :sessions, class_name: 'Passwordless::Session', foreign_key: 'authenticatable_id' )
end
