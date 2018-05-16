class Film < ApplicationRecord
  has_many :episodes

  has_many :film_genres
  has_many :genres, through: :film_genres

  has_many :film_origins
  has_many :origins, through: :film_origins

  has_many :comments
  has_many :ratings
end
