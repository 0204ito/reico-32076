class RefrigeUser < ApplicationRecord
  belongs_to :refrige
  belongs_to :user
end
