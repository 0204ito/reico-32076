class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.all.order(id: "DESC")
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

  def checked
    food = Food.find(params[:id])#これをこの後、以下の記述に書き換えてる
    if food.checked
      food.update(checked: false)
    else
      food.update(checked: true)
    end
    item = Food.find(params[:id])#新しく書き換えたものを変数itemに入れる
    render json: { food: item }#foodという箱にitemを入れて渡す。
  end


  def search
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.search(params[:keyword]).order(id: "DESC")
  end

  def category
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.where(category_id: params[:category_id]).order(id: "DESC")
      render :search
  end

  def change
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.change(params[:change])
      render :search
  end


  private

  def food_collection_params
    params.require(:form_food_collection)
          .permit(foods_attributes: [:food_name, :product_name, :category_id, :purchase_date, :sell_by, :shop, :availability]).merge(refrige_id: params[:refrige_id])
  end

end
