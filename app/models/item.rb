class Item < ApplicationRecord
  belongs_to :user


  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :day_id
    validates :price
  end
end
