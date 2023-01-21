# class Article < ApplicationRecord
#   extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to :genre
#   belongs_to :condition
#   belongs_to :delivery_charge
#   belongs_to :prefecture
#   belongs_to :delivery_day

#   #空の投稿を保存できないようにする
#   validates :title, :text, presence: true

#   #ジャンルの選択が「---」の時は保存できないようにする
#   validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"} 
#   validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
#   validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
#   validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
#   validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
# end
