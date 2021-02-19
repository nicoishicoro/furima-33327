class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :info, presence: true

  belongs_to :user
  has_one_attached :image
  has_one :purchase_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 } 

end
