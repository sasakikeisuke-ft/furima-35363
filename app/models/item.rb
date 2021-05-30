class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    validates :price,
              format: {
                with: /\A[0-9]+\z/,
                message: 'is invalid. Input half-width characters'
              },
              numericality: {
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9_999_999,
                message: 'is out of setting range'
              }
    validates :user
    with_options numericality: { other_than: 0, message: "can't be blank" } do
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
