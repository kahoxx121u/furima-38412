class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,                null: false
      t.text       :text,                 null: false
      t.integer    :category_id,          null: false
      t.integer    :condition_id,         null: false
      t.integer    :deliveryCharge_id,   null: false
      t.integer    :prefecture_id,        null: false
      t.integer    :deliveryDay_id,      null: false
      t.integer    :price,                null: false
      t.references :user,                 null: false, foreign_key:true
      t.timestamps
    end
  end
end
