class OrderDestination
  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid." }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city
  validates :phone_number
  end

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end