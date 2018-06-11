class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @film = Film.find_by id: params[:film_id]
    @comment = @film.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.film_id = @film.id
    flash[:danger]= "comment not save!" unless @comment.save 
    redirect_to film_path(@film)
  end
  def destroy
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
