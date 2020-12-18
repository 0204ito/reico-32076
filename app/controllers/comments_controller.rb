class CommentsController < ApplicationController
  def index
    @refrige = Refrige.find(params[:refrige_id])
    @comment = Comment.new
    @comments = @refrige.comments.includes(:user).all.order(id: "DESC")
  end

  def create
    @refrige = Refrige.find(params[:refrige_id])
    @comment = Comment.new(comment_params)
    if  @comment.save
      redirect_to refrige_comments_path
    else
      redirect_to refrige_comments_path
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, refrige_id: params[:refrige_id])
  end

end
