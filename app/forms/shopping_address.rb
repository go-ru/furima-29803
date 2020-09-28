class ShoppingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :lot_number, :building, :tel_number, :shopping_id, :user_id, :item_id, :token

  validates :postal_code, :area_id, :city, :lot_number, :tel_number, :token, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :tel_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
  validates :area_id, numericality: { other_than: 0 }

  def save
    shopping = Shopping.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, lot_number: lot_number, building: building, tel_number: tel_number, shopping_id: shopping.id)
  end
end
