class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_number,null: false
      t.string :prefecture,null: false
      t.string :city,null: false
      t.string :brock_number,null: false
      t.string :building_name
      t.string :phone_number,null: false
      t.integer :purchase_id,foreign_key: true,null: false
      t.timestamps
    end
  end
end
