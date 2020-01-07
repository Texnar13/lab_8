class MyResult < ApplicationRecord
  validates :pm, :uniqueness => true
end
