class Refrige < ApplicationRecord
  validates :refrige_name, presence: true

  has_many :refrige_users
  has_many :users, through: :refrige_users, validate: false
end
