class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @refrige = Refrige.find(params[:refrige_id])
  end

  def new
    @form = Form::FoodCollection.new
  end

  def create
    @form = Form::FoodCollection.new(food_collection_params)
    if @form.save
      redirect_to refrige_foods_path
    else
      flash.now[:alert]
      render :new
    end
  end

  private

  def food_collection_params
    params.require(:form_food_collection)
          .permit(foods_attributes: [:food_name, :product_name, :category_id, :purchase_date, :sell_by, :shop]).merge(refrige_id: params[:refrige_id])
  end
end
