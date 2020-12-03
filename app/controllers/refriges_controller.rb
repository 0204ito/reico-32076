class RefrigesController < ApplicationController
  before_action :authenticate_user!
  def index
    # @refrige = Refrige.find(params[:id])
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

  private

  def refrige_params
    params.require(:refrige).permit(:refrige_name, user_ids: [])
  end
end
