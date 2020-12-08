class Refrige < ApplicationRecord
  validates :refrige_name, presence: true, on: :create

  has_many :refrige_users, dependent: :destroy
  has_many :users, through: :refrige_users, validate: false
  has_many :foods, dependent: :destroy # refrigeレコードが削除されたら、関するfoodやrefrige_usersのレコードも削除される。
end
