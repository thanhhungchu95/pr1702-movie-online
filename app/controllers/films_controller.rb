class FilmsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_origins, :load_genres, only: [:movie, :tv_series]

  def index; end

  def movie
    movies = films = Film.movie
    filter_params.each do |key, val|
      films = films.merge(movies.send(key, val)) if val.present?
    end
    @films = films.paginate(page: params[:page], per_page: 10)
  end

  def tv_series
    tv_series = films = Film.tv_series
    filter_params.each do |key, val|
      films = films.merge(tv_series.send(key, val)) if val.present?
    end
    @films = films.paginate(page: params[:page], per_page: 10)
  end

  private
  def load_origins
    @origins = Origin.all
  end

  def load_genres
    @genres = Genre.all
  end

  def filter_params
    params.permit(origin: [], genre: [])
  end
end
