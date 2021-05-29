class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :price, numericality: { in: 300..9999999, only_integer: true }
    validates :category_id
    validates :condition_id
    validates :payment_id
    validates :delivery_time_id
    validates :user
  end

  belongs_to :user
  # has_one :order
  has_one_attached :image

end
