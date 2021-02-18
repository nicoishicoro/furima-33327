class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :info, presence: true

  belongs_to :user
  has_one_attached :image
  has_one :purchase_item
end
