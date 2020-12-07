class RefrigesController < ApplicationController
  before_action :authenticate_user!
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
    @refrige = Refrige.find(params[:id])
  end

  def update
    refrige = Refrige.find(params[:id])
    if refrige.update(refrige_params)
      redirect_to refrige_foods_path(refrige.id)
    else
      render :edit
    end
  end

  def destroy
    refrige = Refrige.find(params[:id])
    redirect_to refriges_path if refrige.destroy
  end


  private

  def refrige_params
    params.require(:refrige).permit(:refrige_name, user_ids: [])
  end

end
