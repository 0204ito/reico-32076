class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.all.order(id: 'DESC')
  end

  def new
    @food = Food.new
    @refrige = Refrige.find(params[:refrige_id])
  end

  def create
    # (food_name: params[:food][:food_name],product_name: params[:food][:product_name],category_id: params[:food][:category_id],purchase_date: params[:food][:purchase_date],sell_by: params[:food][:sell_by],shop: params[:food][:shop], refrige_id: params[:refrige_id])
    food = Food.new(food_params)
    if food.valid?#バリデーションを通っていれば
      food.save
    end
    render json:{ food: food }
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
    redirect_to search_refrige_foods_path
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
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
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.search(params[:keyword]).order(id: 'DESC')
  end

  def category
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.where(category_id: params[:category_id]).order(id: 'DESC')
    render :search
  end

  def change
    @refrige = Refrige.find(params[:refrige_id])
    @foods = @refrige.foods.change(params[:change])
    render :search
  end


  private

  def food_params
    params.require(:food).permit(:food_name, :product_name, :category_id, :purchase_date, :sell_by, :shop).merge(refrige_id: params[:refrige_id], checked: false)
  end #画面上で入力してない値をパラメーターに含めたいときはmergeを使うchecked: false
end
