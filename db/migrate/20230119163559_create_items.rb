class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.timestamps
      t.string  :item_name, null: false
      t.text    :text, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key:true
    end
  end
end
