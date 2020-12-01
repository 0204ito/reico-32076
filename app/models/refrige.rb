class Refrige < ApplicationRecord

  with_options presence: true do
    validates :refrige_name
    validates :user_id
  end

  has_many :refrige_users
  has_many :users, through: :refrige_users
  
end
