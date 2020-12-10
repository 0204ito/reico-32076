class Form::FoodCollection < Form::Base
  FORM_COUNT = 5 # 作成したい登録フォームの数を指定
  attr_accessor :foods, :refrige_id # アクセサメソッドを定義することで、インスタンス変数に外部からアクセスできるようになる

  # Form::FoodCollection.foodsが使えるようになる

  # 初期化メソッド
  def initialize(attributes = {}) # attributesの空のハッシュ
    super attributes # 親クラスのメソッドをそのまま呼び出せるsuper
    self.foods = FORM_COUNT.times.map { Food.new } unless foods.present?
  end
  # Form::FoodCollection.new(…)とするために、initializeメソッドを定義

  # 上でsuper attributesとしているので必要
  def foods_attributes=(attributes)
    self.foods = attributes.map { |_, v| Food.new(v) }
  end

  def save
    # Food.transaction do
    # foods.map do |food|
    #   food.refrige_id = self.refrige_id
    #   food.save if food.food_name
    #   end
    # end

    Food.transaction do
      foods.each do |food| # foodsを一つづつ確認
        return if food.food_name.blank? # blank?空のオブジェクトを判定できる。food_nameが空だったら全て保存されなくなる

        food.refrige_id = refrige_id
        raise ActiveRecord::Rollback unless food.save # そうでなければ保存
      end
    end
  end
end
