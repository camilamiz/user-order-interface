class Orderx < ApplicationRecord
  belongs_to :userx

  validates :model, presence: true
  validates :imei, presence: true
  validates :annual_price, presence: true
end
