class Item < ApplicationRecord
  belongs_to: user
  has_one: order
  belongs_to_active_hash: category
  belongs_to_active_hash: condition
  belongs_to_active_hash: shipping_cost
  belongs_to_active_hash: area
  belongs_to_active_hash: time_to_ship
end
