class Comment < ApplicationRecord
  with_options presence: true do
    validates :text
    validates :refrige_id
    validates :user_id
  end

  belongs_to :user
  belongs_to :refriges, optional: true
end
