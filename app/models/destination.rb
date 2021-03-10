class Destination < ApplicationRecord
  belongs_to :order
  belongs_to :user
  belongs_to :prefecture
end
