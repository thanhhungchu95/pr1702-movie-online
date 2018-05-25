class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @top_updated_film = Film.all.order("created_at DESC").limit(5)
    @top_rating_film = top_rate
    @top_view_film = Film.all.order("num_view DESC").limit(5)
    @top_comment_film = top_comment
  end

  def new
  end

  def search
    if params[:q][:name_or_alter_name_cont].blank?
      film_search = Film.none
    else
      film_search = @q.result
    end
    @films = film_search.paginate(page: params[:page], per_page: 10)
  end

  private
  def top_comment
    Film.all.includes(:comments).sort_by{|film| film.comments.size}.reverse.take 5
  end

  def top_rate
    Film.all.includes(:ratings).sort_by{|film| film.rate}.reverse.take 5
  end
end
