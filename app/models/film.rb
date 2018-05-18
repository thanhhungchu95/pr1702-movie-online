class Film < ApplicationRecord
  has_many :episodes

  has_many :film_genres
  has_many :genres, through: :film_genres

  has_many :film_origins
  has_many :origins, through: :film_origins

  has_many :comments
  has_many :ratings

  def comment
  	count_cmt = comments.count
  end

  def rate
  	rating_star = ratings.pluck(:star)
  	rating_star.any? ? (rating_star.sum.to_f / rating_star.count) : 0
  end
end
