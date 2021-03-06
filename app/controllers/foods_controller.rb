class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: [:edit, :update, :destroy]
  before_action :set_refrige, only: [:index, :new, :search, :category, :change]

  def index
    @foods = @refrige.foods.all.order(id: 'DESC')
    redirect_to root_path unless @refrige.user_ids.include? current_user.id
  end

  def new
    @food = Food.new
    redirect_to root_path unless @refrige.user_ids.include? current_user.id
  end

  def create
    # (food_name: params[:food][:food_name],product_name: params[:food][:product_name],category_id: params[:food][:category_id],purchase_date: params[:food][:purchase_date],sell_by: params[:food][:sell_by],shop: params[:food][:shop], refrige_id: params[:refrige_id])
    food = Food.new(food_params)
    if food.valid? # バリデーションを通っていれば
      category = Category.find(food.category_id)
      food.save
    end
    render json: { food: food, category: category }
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to search_refrige_foods_path
    else
      render :edit
    end
  end

  def destroy
    if @food.destroy
      redirect_to search_refrige_foods_path
    else
      render :edit
    end
  end

  def checked
    food = Food.find(params[:id]) # これをこの後、以下の記述に書き換えてる
    if food.checked
      food.update(checked: false)
    else
      food.update(checked: true)
    end
    item = Food.find(params[:id]) # 新しく書き換えたものを変数itemに入れる
    render json: { food: item } # foodという箱にitemを入れて渡す。
  end

  def search
    @foods = @refrige.foods.search(params[:keyword]).order(id: 'DESC')
    redirect_to root_path unless @refrige.user_ids.include? current_user.id
  end

  def category
    @foods = @refrige.foods.where(category_id: params[:category_id]).order(id: 'DESC')
    render :search
  end

  def change
    @foods = @refrige.foods.change(params[:change])
    render :search
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :product_name, :category_id, :purchase_date, :sell_by, :shop).merge(refrige_id: params[:refrige_id], checked: false)
  end # 画面上で入力してない値をパラメーターに含めたいときはmergeを使うchecked: false

  def set_food
    @food = Food.find(params[:id])
  end

  def set_refrige
    @refrige = Refrige.find(params[:refrige_id])
  end
end
