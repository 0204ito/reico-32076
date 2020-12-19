class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_refrige, only: [:index, :create]
  before_action :move_to_index
  def index
    @comment = Comment.new
    @comments = @refrige.comments.includes(:user).all.order(id: 'DESC')
    
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to refrige_comments_path
    else
      redirect_to refrige_comments_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, refrige_id: params[:refrige_id])
  end

  def set_refrige
    @refrige = Refrige.find(params[:refrige_id])
  end

   def move_to_index
    unless @refrige.user_ids.include? current_user.id
      redirect_to root_path
    end
   end
end
