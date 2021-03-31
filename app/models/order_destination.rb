class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid." }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city
  validates :address
  validates :phone_number, length: { maximum: 11 }
  validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end