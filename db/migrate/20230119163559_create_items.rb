class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string  :item_name, null: false
      t.text    :explanation, null: false
      t.integer :genre_id, null: false
      t.integer :condition_item_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_days_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key:true
    end
  end
end
