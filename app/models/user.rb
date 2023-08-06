class User < ApplicationRecord
  has_secure_password

  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end
