class User < ApplicationRecord
  validates :mail, :uniqueness => true
end
