class Refrige < ApplicationRecord

  with_options presence: true do
    validates :refrige_name
    validates :user_id
  end

  belongs_to :user
  has_many :foods
end
