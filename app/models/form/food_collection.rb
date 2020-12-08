class Form::FoodCollection < Form::Base
  FORM_COUNT = 2 # 作成したい登録フォームの数を指定
  attr_accessor :foods, :refrige_id # アクセサメソッドを定義することで、インスタンス変数に外部からアクセスできるようになる

  # Form::FoodCollection.foodsが使えるようになる

  # 初期化メソッド
  def initialize(attributes = {}) # attributesの空のハッシュ
    super attributes # 親クラスのメソッドをそのまま呼び出せるsuper
    self.foods = FORM_COUNT.times.map { Food.new } unless foods.present?
  end
  # Form::MemoCollection.new(…)とするために、initializeメソッドを定義

  # 上でsuper attributesとしているので必要
  def foods_attributes=(attributes)
    self.foods = attributes.map { |_, v| Food.new(v) }
  end

  def save
    Food.transaction do # transactionを使うことで範囲内のActiverecordの処理は一連の処理として保護される
      # １つでも処理が欠けるとActiveRecordの処理は全てもとの状態に戻りロールバック

      foods.map do |food|
        food.save if food.food_name # ここでfood_nameに記述があるものみが保存される
      end

      # Food.transaction do
      #   self.foods.map(&:save!)
      # end
    end
    true
  rescue StandardError => e
    false
  end
end
