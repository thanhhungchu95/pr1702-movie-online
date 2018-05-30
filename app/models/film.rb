class Film < ApplicationRecord
  has_many :episodes

  has_many :film_genres
  has_many :genres, through: :film_genres

  has_many :film_origins
  has_many :origins, through: :film_origins

  has_many :comments
  has_many :ratings

  scope :movie, -> { where("num_ep = 1") }
  scope :tv_series, -> { where("num_ep > 1") }

  scope :category, -> (category) {
    case category
    when Settings.film.movie
      movie
    when Settings.film.tv_series
      tv_series
    end
  }

  scope :genre, ->(genre_id) {joins(:genres).where "genres.id IN (?)", genre_id}
  scope :origin, ->(origin_id) {joins(:origins).where "origins.id IN (?)", origin_id}

  def comment
  	count_cmt = comments.count
  end

  def rate
  	rating_star = ratings.pluck(:star)
  	rating_star.any? ? (rating_star.sum.to_f / rating_star.count) : 0
  end
end
