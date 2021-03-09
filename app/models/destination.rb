class Destination < ApplicationRecord
  belongs_to :purchase_item
  belongs_to :prefecture

  validates :postal_code,        presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city,               presence: true
  validates :building
  validates :phone_number,       presence: true

end
