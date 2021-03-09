class OrderDestination < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :nickname, :name, :image, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price

  validates :postal_code,        presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city,               presence: true
  validates :building
  validates :phone_number,       presence: true

  def save
    user = User.create(nickname: nickname)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, address: address, building: building, phone_number: phone_number, user_id: user.id)
  end
end