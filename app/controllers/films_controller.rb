class FilmsController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def filter
    filter_films = Film.all
    filter_params.each do |key, val|
      filter_films.merge!(filter_films.send(key, val)) if val.present?
    end
    @category = [["Movie", "1"], ["TV_series", "2"]]
    @selected_params = filter_params
    @films = filter_films.paginate(page: params[:page],
                                    per_page: Settings.film.per_page)
  end

  private
  def filter_params
    params.permit(:origin, :genre, :category)
  end

end
