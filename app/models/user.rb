class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 8}
  validates :username, :email, uniqueness: true
  validates :username, :email, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}
end
