class User < ApplicationRecord
  validates :mail, :uniqueness => true
  has_secure_password
end
