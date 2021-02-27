class User < ApplicationRecord
  has_secure_password
  has_many :books

  validates :username, presence: true, length: { minimum: 2, maximum: 20 }
  validates :password, presence: true, length: { minimum: 6 }
end
