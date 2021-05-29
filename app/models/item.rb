class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :price, numericality: { in: 300..9999999, only_integer: true }
    validates :user
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :condition_id
      validates :payment_id
      validates :prefecture_id
      validates :delivery_time_id
    end
  end

  belongs_to :user
  # has_one :order
  has_one_attached :image

  # ActiveHash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :payment
  belongs_to :prefecture
  belongs_to :delivery_time

end
