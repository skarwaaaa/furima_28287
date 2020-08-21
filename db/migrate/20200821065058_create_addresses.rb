class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_number,null: false
      t.string :prefecture,null: false
      t.string :city,null: false
      t.string :brock_number,null: false
      t.string :building_name
      t.integer :phone_number,null: false
      t.integer :user_id,null: false
      t.timestamps
    end
  end
end
