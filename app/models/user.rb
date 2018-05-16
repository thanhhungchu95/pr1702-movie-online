class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :ratings
  has_many :histories
  has_many :favourites

  has_many :watched_films, through: :histories, source: :film
  has_many :favourite_films, through: :histories, source: :film

  def friends
    Relation.where(user1_id: self.id).or(Relation.where(user2_id: self.id))
  end
end
