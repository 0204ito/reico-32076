class Food < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions # 記述してmoduleを取り込む
  belongs_to :category
  # ActiveHashを用いて、belongs_toを設定する

  with_options presence: true do
    validates :food_name
    validates :purchase_date
    validates :refrige_id
  end
  validates :category_id, numericality: { other_than: 1 }
  # ジャンルの選択が「--」の時は保存できないようにする

  belongs_to :refrige, validate: false

  def self.search(search)
    #クラス全体に検索をかけたいから、クラス全体で使えるクラスメソッドを使う
    if search != ""
      Food.where('food_name LIKE(?) OR product_name LIKE(?) OR shop LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Food.all
    end
  end

  def self.category(category_id)
    if category_id!= ""
      Refrige.food.where(category_id: category_id)
     else
      Food.all
    end
  end

  def self.change(change)
    case change
    when 'purchase_new'
      return Food.all.order(purchase_date: :DESC)
    when 'purchase_old'
      return Food.all.order(purchase_date: :ASC)
    when 'sell_new'
      # return Food.where.not(sell_by: nil).order(sell_by: "DESC")賞味期限を書いてないものは含めたくない場合
      return Food.order('sell_by IS NULL, sell_by DESC')
    when 'sell_old'
      return Food.order('sell_by IS NULL, sell_by ASC')
    when 'checked_false'
      return Food.where.not(checked: true)
    when 'checked_true'
      return Food.where.not(checked: false)
    end
  end
end
