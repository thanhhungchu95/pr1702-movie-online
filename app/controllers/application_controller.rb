class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :load_search, :load_origins, :load_genres

  private
  def load_search
  	@q = Film.ransack(params[:q])
  end

  def load_origins
    @origins = Origin.all
  end

  def load_genres
    @genres = Genre.all
  end
end
