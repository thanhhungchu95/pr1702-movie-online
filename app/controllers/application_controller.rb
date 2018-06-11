class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :load_search, :load_origins, :load_genres
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
