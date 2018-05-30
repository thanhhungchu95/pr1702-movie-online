class FilmsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_origins, :load_genres, only: :filter

  def index; end

  def filter
    filter_films = Film.all
    filter_params.each do |key, val|
      filter_films.merge!(filter_films.send(key, val)) if val.present?
    end
    @category = [["Movie", "1"], ["TV_series", "2"]]
    @selected_params = filter_params
    @films = filter_films.paginate(page: params[:page], per_page: 10)
  end

  private
  def load_origins
    @origins = Origin.all
  end

  def load_genres
    @genres = Genre.all
  end

  def filter_params
    params.permit(:origin, :genre, :category)
  end
end
