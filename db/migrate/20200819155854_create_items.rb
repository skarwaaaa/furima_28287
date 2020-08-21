class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.integer :price, null: false
      t.integer :user_id, foreign_key: true
      t.string :category, null: false
      t.string :status, null: false
      t.string :delivery_fee, null: false
      t.string :consignor, null: false
      t.string :shipping_date, null: false
      t.timestamps
    end
  end
end
