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

  scope :top_view, ->{order("num_view DESC")}
  scope :top_updated, ->{order("created_at DESC")}
  scope :top_comment, ->{order("comment_count DESC")}
  scope :top_rate, ->{order("rate_point DESC")}
  scope :top_movie_by, ->(type){
    case type
    when "top_view"
      top_view
    when "lastest_trailer"
      top_updated
    when "top_rated"
      top_rate
    when "top_comment"
      top_comment
    end  
  }

  scope :genre, ->(genre_id) {joins(:genres).where "genres.id IN (?)", genre_id}
  scope :origin, ->(origin_id) {joins(:origins).where "origins.id IN (?)", origin_id}

  def self.update_comment_and_rating!
    self.find_in_batches do |films|
      sleep(5)
      films.each {
        |film| film.update_attributes(comment_count: film.comment,
                                                          rate_point: film.rate)
      }
    end
  end

  def comment
  	count_cmt = comments.count
  end

   def movie?
    num_ep == Settings.film.movie.to_i
  end

  def rate
  	rating_star = ratings.pluck(:star)
  	rating_star.any? ? (rating_star.sum.to_f / rating_star.count) : 0
  end
end
