class Food < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions#記述してmoduleを取り込む
  belongs_to :category
  #ActiveHashを用いて、belongs_toを設定する

  with_options presence: true do
    validates :food_name
    validates :purchase_date
    validates :refrige_id
  end
  validates :genre_id, numericality: { other_than: 1 } 
  #ジャンルの選択が「--」の時は保存できないようにする
  
  belongs_to :refrige, validate: false

end
