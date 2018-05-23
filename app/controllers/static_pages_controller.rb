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

  private
  def top_comment
    Film.all.includes(:comments).sort_by{|film| film.comments.size}.reverse.take 5
  end

  def top_rate
    Film.all.includes(:ratings).sort_by{|film| film.rate}.reverse.take 5
  end
end
