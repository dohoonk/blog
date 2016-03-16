class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  belongs_to :user
  has_many :comments, dependent: :destroy

# For favourite_post index
  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user

  validates :title, presence: true,
                    uniqueness: true

# For searching
  def self.search(term)
    wildcard_term = "%#{term}%"
    where("title ILIKE :term OR body ILIKE :term", {term: wildcard_term})
  end

  def favourite_for(user)
    favourites.find_by_user_id(user)
  end
end
