class User < ActiveRecord::Base
  # attr_accessor :password
  # attr_accessor :password_confirmation
  has_many :posts
  has_many :comments

  has_many :favourites, dependent: :destroy
  has_many :favourited_posts, through: :favourites, source: :posts
  validates :first_name, uniqueness: true, presence: true

  has_secure_password
end
