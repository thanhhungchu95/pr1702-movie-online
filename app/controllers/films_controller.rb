class FilmsController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def filter
    filter_films = Film.all
    filter_params.each do |key, val|
      filter_films.merge!(filter_films.send(key, val)) if (Film.respond_to? key) && (val.present?)
    end
    @category = [["Movie", "1"], ["TV_series", "2"]]
    @selected_params = filter_params
    @films = filter_films.paginate(page: params[:page],
                                    per_page: Settings.film.per_page)
  end

  def show
    @film = Film.find_by id: params[:id]
    redirect_to root_url unless @film
  end

  def view
    @film = Film.find_by id: params[:id]
    redirect_to root_url unless @film
    @episodes = @film.episodes.order("num_epi ASC")

    @episode = params[:episode_id] ? @episodes.find_by(id: params[:episode_id]) : @episodes.first
    redirect_to view_film_path(@film) unless @episodes.include? @episode
  end

  private
  def filter_params
    params.permit(:origin, :genre, :category)
  end

end
