class PurchaseItem < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :nickname, :name, :image, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price
  
  validates :nickname,        presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :sales_status_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_fee_status_id, numericality: { other_than: 1 }
  
  def save
    user = User.create(nickname: nickname)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, address: address, building: building, phone_number: phone_number, user_id: user.id)
  end
end
