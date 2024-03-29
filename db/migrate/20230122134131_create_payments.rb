class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table   :payments do |t|
      t.string     :postal_number,     null: false
      t.integer    :prefecture_id,     null: false
      t.string     :city,              null: false
      t.string     :address,           null: false
      t.string     :building_name
      t.string     :telephone_number,  null: false
      t.references :order,             null: false, foreign_key:true
      t.timestamps
    end
  end
end


