class Item < ApplicationRecord
  validates :item_name,      presence: true
  validates :text,      presence: true
  
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  
  validates :image,      presence: true
  validates :category_id, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliveryCharge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliveryDay_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  # belongs_to :category
  # belongs_to :condition
  # belongs_to :delivery_charge
  # belongs_to :prefecture
  # belongs_to :delivery_day
end
