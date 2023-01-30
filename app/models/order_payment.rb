class OrderPayment
  include ActiveModel::Model
  attr_accessor :postal_number, :prefecture_id, :city, :address, :building_name, :telephone_number, :user_id, :item_id, :token
 
  #バリデーションを記載する
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  #データをテーブルに保存する処理
  def save
    # 発送先情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Payment.create(postal_number: postal_number, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end


end

