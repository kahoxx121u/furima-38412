class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions 

  # ジャンルの選択が「--(id:1)」の時は保存不可
  # 空では登録できない
  validates :item_name,      presence: true
  validates :text,      presence: true

  validates :price,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  validates :image,      presence: true
  validates :category_id, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }

  #テーブルとのアソシエーション
  belongs_to :user
  #has_one :purchase

  #active_storageとのアソシエーション
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  #アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day
end
