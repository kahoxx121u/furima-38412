class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions 
  validates :item_name,      presence: true
  validates :text,      presence: true

  validates :price,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  
  validates :image,      presence: true
  validates :category_id, presence: true

  validates :category_id, numericality: { other_than: 0 } 
  validates :condition_id, numericality: { other_than: 0 }
  validates :delivery_charge_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :delivery_day_id, numericality: { other_than: 0 }

  belongs_to :user
  #has_one :purchase

  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
end
