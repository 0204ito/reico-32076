class RefrigesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_refrige, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @refrige = Refrige.new
  end

  def create
    @refrige = Refrige.new(refrige_params)
    if @refrige.save
      redirect_to refriges_path
    else
      render :new
    end
  end

  def edit
     redirect_to action: :index unless current_user.id && @refrige.user_ids
  end

  def update
    if @refrige.update(refrige_params)
      redirect_to refrige_foods_path(@refrige.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to refriges_path if @refrige.destroy
    redirect_to action: :index unless current_user.id && @refrige.user_ids
  end

  private

  def refrige_params
    params.require(:refrige).permit(:refrige_name, user_ids: [])
  end


  def set_refrige
    @refrige = Refrige.find(params[:id])
  end
end
