class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :area
  belongs_to_active_hash :time_to_ship

  belongs_to :user
  has_one :order
  has_one_attached :image, dependent: :destroy

  validates :image, :name, :description, :category_id, :condition_id, :shipping_cost_id, :area_id, :time_to_ship_id, :price, presence: true

  validates :category_id, :condition_id, :shipping_cost_id, :area_id, :time_to_ship_id, numericality: { only_integer: true } 
    
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は適正な販売価格を入力してください' }  
end
