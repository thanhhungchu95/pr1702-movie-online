class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :load_search
 
  private
  def load_search
  	@q = Film.ransack(params[:q])  	
  end
end
