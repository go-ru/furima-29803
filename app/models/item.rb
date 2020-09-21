class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  validates :image, :name, :text, :category, :status, :delivery, :area, :day, :price, presence: true

  validates :category_id, :status_id, :delivery_id, :area_id, :day_id, numericality: { other_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
end
