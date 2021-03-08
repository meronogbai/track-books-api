class User < ApplicationRecord
  has_secure_password
  has_many :trackers
  has_many :books, through: :trackers

  validates :username, presence: true, uniqueness: true,
                       length: { minimum: 2, maximum: 20 }
  validates :password, presence: true, length: { minimum: 6 }
end
