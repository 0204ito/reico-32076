class FoodsController < ApplicationController
  before_action :authenticate_user!
  # before_action :move_to_index
  def index
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods
  end

  def new
    @form = Form::FoodCollection.new
  end

  def create
    @form = Form::FoodCollection.new(food_collection_params)
    if @form.save # これが偽にならないとrender :newは行われない
      redirect_to refrige_foods_path
    else
      render :new
    end
  end

  private

  def food_collection_params
    params.require(:form_food_collection)
          .permit(foods_attributes: [:food_name, :product_name, :category_id, :purchase_date, :sell_by, :shop, :availability]).merge(refrige_id: params[:refrige_id])
  end

  # def move_to_index
  #   unless current_user.id == food.refrige.user_ids
  #     redirect_to action: :index
  #   end
  # end
end
